#!/bin/bash
set -e

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo ./add-site.sh sitename"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Usage: sudo ./add-site.sh sitename"
  echo "Example: sudo ./add-site.sh myblog"
  exit 1
fi

SITE_NAME="$1"
SITE_NAME_CLEAN=$(echo "$SITE_NAME" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z0-9')
DEPLOY_DIR="/opt/$SITE_NAME_CLEAN"

if [ -d "$DEPLOY_DIR" ]; then
  echo "ERROR: $DEPLOY_DIR already exists. Site may already be set up."
  exit 1
fi

DB_PASS=$(openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 20)
DB_ROOT_PASS=$(openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 20)
DB_NAME="wp_${SITE_NAME_CLEAN}"
DB_USER="wp_${SITE_NAME_CLEAN}"

mkdir -p "$DEPLOY_DIR"

cat > "$DEPLOY_DIR/docker-compose.yml" << COMPOSE
services:
  db-${SITE_NAME_CLEAN}:
    image: mariadb:10.11
    restart: always
    environment:
      MARIADB_ROOT_PASSWORD: \${MYSQL_ROOT_PASSWORD}
      MARIADB_DATABASE: \${MYSQL_DATABASE}
      MARIADB_USER: \${MYSQL_USER}
      MARIADB_PASSWORD: \${MYSQL_PASSWORD}
    volumes:
      - db_data:/var/lib/mysql
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      interval: 10s
      timeout: 5s
      retries: 10
      start_period: 30s
    networks:
      - idotinfra_web
      - internal

  wordpress-${SITE_NAME_CLEAN}:
    depends_on:
      db-${SITE_NAME_CLEAN}:
        condition: service_healthy
    image: wordpress:latest
    restart: always
    environment:
      WORDPRESS_DB_HOST: db-${SITE_NAME_CLEAN}
      WORDPRESS_DB_USER: \${MYSQL_USER}
      WORDPRESS_DB_PASSWORD: \${MYSQL_PASSWORD}
      WORDPRESS_DB_NAME: \${MYSQL_DATABASE}
    volumes:
      - wp_data:/var/www/html
    networks:
      - idotinfra_web
      - internal

networks:
  idotinfra_web:
    external: true
  internal:
    driver: bridge

volumes:
  db_data:
  wp_data:
COMPOSE

cat > "$DEPLOY_DIR/.env" << ENVFILE
MYSQL_ROOT_PASSWORD=${DB_ROOT_PASS}
MYSQL_DATABASE=${DB_NAME}
MYSQL_USER=${DB_USER}
MYSQL_PASSWORD=${DB_PASS}
ENVFILE

chmod 600 "$DEPLOY_DIR/.env"

cd "$DEPLOY_DIR"
docker compose up -d

echo ""
echo "============================================"
echo "  New site '$SITE_NAME' created!"
echo "============================================"
echo ""
echo "  Container: wordpress-${SITE_NAME_CLEAN}"
echo "  Deploy dir: $DEPLOY_DIR"
echo "  Credentials: $DEPLOY_DIR/.env"
echo ""
echo "  Next: Add a Proxy Host in Nginx Proxy Manager (http://YOUR_IP:81)"
echo "    - Domain: your-domain-or-subdomain"
echo "    - Forward Hostname: wordpress-${SITE_NAME_CLEAN}"
echo "    - Forward Port: 80"
echo "    - Enable SSL if using a domain"
echo ""
