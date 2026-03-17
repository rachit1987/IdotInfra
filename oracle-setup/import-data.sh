#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo ./import-data.sh YOUR_PUBLIC_IP"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: sudo ./import-data.sh YOUR_PUBLIC_IP"
  echo "Example: sudo ./import-data.sh 129.154.52.100"
  exit 1
fi

SERVER_IP="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEPLOY_DIR="/opt/idotinfra"

source "$DEPLOY_DIR/.env"

echo "============================================"
echo "  Importing IdotInfra Data"
echo "============================================"

if [ ! -f "$SCRIPT_DIR/db-export.sql" ]; then
  echo "ERROR: db-export.sql not found in $SCRIPT_DIR"
  echo "Upload it first: scp db-export.sql ubuntu@$SERVER_IP:~/IdotInfra/oracle-setup/"
  exit 1
fi

if [ ! -f "$SCRIPT_DIR/wp-uploads.tar.gz" ]; then
  echo "ERROR: wp-uploads.tar.gz not found in $SCRIPT_DIR"
  echo "Upload it first: scp wp-uploads.tar.gz ubuntu@$SERVER_IP:~/IdotInfra/oracle-setup/"
  exit 1
fi

echo ""
echo "[1/5] Copying theme files..."
THEME_SRC="$SCRIPT_DIR/../wp-content/themes/idotinfra-theme"
if [ -d "$THEME_SRC" ]; then
  docker compose -f "$DEPLOY_DIR/docker-compose.yml" cp "$THEME_SRC" wordpress:/var/www/html/wp-content/themes/idotinfra-theme
  echo "  Theme copied."
else
  echo "  WARNING: Theme directory not found at $THEME_SRC"
fi

echo ""
echo "[2/5] Importing database..."
docker compose -f "$DEPLOY_DIR/docker-compose.yml" exec -T db mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$SCRIPT_DIR/db-export.sql"
echo "  Database imported."

echo ""
echo "[3/5] Updating WordPress URLs to use server IP..."
cd "$DEPLOY_DIR"
docker compose exec -T wordpress wp option update siteurl "http://$SERVER_IP" --allow-root 2>/dev/null || \
  docker compose exec -T db mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e \
    "UPDATE wp_options SET option_value='http://$SERVER_IP' WHERE option_name IN ('siteurl','home');"
docker compose exec -T wordpress wp option update home "http://$SERVER_IP" --allow-root 2>/dev/null || true

echo "  URLs updated to http://$SERVER_IP"

echo ""
echo "[4/5] Importing uploads (images)..."
UPLOADS_CONTAINER_PATH="/var/www/html/wp-content/"
docker compose exec -T wordpress bash -c "mkdir -p /var/www/html/wp-content/uploads"
docker compose cp "$SCRIPT_DIR/wp-uploads.tar.gz" wordpress:/tmp/wp-uploads.tar.gz
docker compose exec -T wordpress bash -c "cd /var/www/html/wp-content && tar xzf /tmp/wp-uploads.tar.gz && chown -R www-data:www-data uploads/ && rm /tmp/wp-uploads.tar.gz"
echo "  Uploads imported."

echo ""
echo "[5/5] Activating child theme and flushing..."
docker compose exec -T wordpress wp theme activate idotinfra-theme --allow-root 2>/dev/null || true
docker compose exec -T wordpress wp rewrite flush --allow-root 2>/dev/null || true
docker compose exec -T wordpress wp cache flush --allow-root 2>/dev/null || true
echo "  Theme activated, caches flushed."

echo ""
echo "============================================"
echo "  Import complete!"
echo "============================================"
echo ""
echo "  Your site is live at: http://$SERVER_IP"
echo ""
echo "  WordPress Admin: http://$SERVER_IP/wp-admin/"
echo "  Nginx Proxy Manager: http://$SERVER_IP:81"
echo ""
echo "  To add a custom domain later, run:"
echo "    sudo ./update-domain.sh yourdomain.com"
echo ""
