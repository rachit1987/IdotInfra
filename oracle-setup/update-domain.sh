#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo ./update-domain.sh yourdomain.com"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: sudo ./update-domain.sh yourdomain.com"
  exit 1
fi

DOMAIN="$1"
DEPLOY_DIR="/opt/idotinfra"

source "$DEPLOY_DIR/.env"

echo "Updating WordPress URLs to https://$DOMAIN ..."

cd "$DEPLOY_DIR"
docker compose exec -T wordpress wp search-replace "http://$(docker compose exec -T wordpress wp option get siteurl --allow-root 2>/dev/null | tr -d '[:space:]' | sed 's|http[s]*://||')" "https://$DOMAIN" --all-tables --allow-root 2>/dev/null || true
docker compose exec -T wordpress wp option update siteurl "https://$DOMAIN" --allow-root 2>/dev/null || \
  docker compose exec -T db mariadb -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" -e \
    "UPDATE wp_options SET option_value='https://$DOMAIN' WHERE option_name IN ('siteurl','home');"
docker compose exec -T wordpress wp option update home "https://$DOMAIN" --allow-root 2>/dev/null || true
docker compose exec -T wordpress wp cache flush --allow-root 2>/dev/null || true

echo ""
echo "Done! WordPress now uses https://$DOMAIN"
echo ""
echo "Make sure you have:"
echo "  1. Pointed your domain's DNS A record to this server's IP"
echo "  2. Added a Proxy Host in Nginx Proxy Manager (http://YOUR_IP:81):"
echo "     - Domain: $DOMAIN"
echo "     - Forward to: wordpress, port 80"
echo "     - SSL: Enable, Force HTTPS, Let's Encrypt"
echo ""
