#!/bin/bash
set -e

echo "============================================"
echo "  Oracle Cloud Server Setup for IdotInfra"
echo "============================================"

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root: sudo ./setup-server.sh"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEPLOY_DIR="/opt/idotinfra"

echo ""
echo "[1/6] Installing Docker..."
apt-get update -qq
apt-get install -y -qq ca-certificates curl gnupg lsb-release

install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
apt-get update -qq
apt-get install -y -qq docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

usermod -aG docker ubuntu
systemctl enable docker
systemctl start docker

echo "  Docker installed: $(docker --version)"

echo ""
echo "[2/6] Opening firewall ports..."
iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -p tcp --dport 443 -j ACCEPT
iptables -I INPUT 6 -m state --state NEW -p tcp --dport 81 -j ACCEPT
netfilter-persistent save 2>/dev/null || iptables-save > /etc/iptables/rules.v4 2>/dev/null || true
echo "  Ports 80, 443, 81 opened"

echo ""
echo "[3/6] Creating deployment directory..."
mkdir -p "$DEPLOY_DIR"

cat > "$DEPLOY_DIR/docker-compose.yml" << 'COMPOSE'
services:
  nginx-proxy-manager:
    image: jc21/nginx-proxy-manager:latest
    restart: always
    ports:
      - "80:80"
      - "443:443"
      - "81:81"
    volumes:
      - npm_data:/data
      - npm_letsencrypt:/etc/letsencrypt
    networks:
      - web

  db:
    image: mariadb:10.11
    restart: always
    environment:
      MARIADB_ROOT_PASSWORD: ${MYSQL_ROOT_PASSWORD}
      MARIADB_DATABASE: ${MYSQL_DATABASE}
      MARIADB_USER: ${MYSQL_USER}
      MARIADB_PASSWORD: ${MYSQL_PASSWORD}
    volumes:
      - db_data:/var/lib/mysql
    healthcheck:
      test: ["CMD", "healthcheck.sh", "--connect", "--innodb_initialized"]
      interval: 10s
      timeout: 5s
      retries: 10
      start_period: 30s
    networks:
      - internal

  wordpress:
    depends_on:
      db:
        condition: service_healthy
    image: wordpress:latest
    restart: always
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: ${MYSQL_USER}
      WORDPRESS_DB_PASSWORD: ${MYSQL_PASSWORD}
      WORDPRESS_DB_NAME: ${MYSQL_DATABASE}
    volumes:
      - wp_data:/var/www/html
      - wp_themes:/var/www/html/wp-content/themes
      - wp_uploads:/var/www/html/wp-content/uploads
    networks:
      - web
      - internal

networks:
  web:
    driver: bridge
  internal:
    driver: bridge

volumes:
  npm_data:
  npm_letsencrypt:
  db_data:
  wp_data:
  wp_themes:
  wp_uploads:
COMPOSE

MYSQL_ROOT_PASS=$(openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 20)
MYSQL_PASS=$(openssl rand -base64 16 | tr -dc 'a-zA-Z0-9' | head -c 20)

cat > "$DEPLOY_DIR/.env" << ENVFILE
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASS}
MYSQL_DATABASE=wordpress
MYSQL_USER=wpuser
MYSQL_PASSWORD=${MYSQL_PASS}
ENVFILE

chmod 600 "$DEPLOY_DIR/.env"

echo "  Deployment files created at $DEPLOY_DIR"
echo "  DB credentials saved to $DEPLOY_DIR/.env"

echo ""
echo "[4/6] Starting containers..."
cd "$DEPLOY_DIR"
docker compose up -d

echo "  Waiting for MariaDB to be healthy..."
for i in $(seq 1 60); do
  if docker compose exec -T db healthcheck.sh --connect --innodb_initialized >/dev/null 2>&1; then
    echo "  MariaDB is ready."
    break
  fi
  sleep 2
done

echo "  Waiting for WordPress to initialize..."
sleep 15
echo "  Containers are running."

echo ""
echo "[5/6] Installing Astra theme and Contact Form 7..."
docker compose exec -T wordpress wp theme install astra --activate --allow-root 2>/dev/null || true
docker compose exec -T wordpress wp plugin install contact-form-7 --activate --allow-root 2>/dev/null || true

echo ""
echo "[6/6] Setting up keep-alive cron and nightly backups..."

cat > /etc/cron.d/idotinfra-keepalive << 'CRON'
# Ping the site every 4 hours to prevent Oracle idle reclamation
0 */4 * * * root curl -s -o /dev/null http://localhost/ 2>/dev/null
CRON

mkdir -p /opt/backups

cat > /usr/local/bin/idotinfra-backup.sh << 'BACKUP'
#!/bin/bash
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/opt/backups"
source /opt/idotinfra/.env
docker compose -f /opt/idotinfra/docker-compose.yml exec -T db mariadb-dump -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" > "$BACKUP_DIR/wp-db-$TIMESTAMP.sql"
# Keep only last 7 backups
ls -t "$BACKUP_DIR"/wp-db-*.sql | tail -n +8 | xargs rm -f 2>/dev/null
BACKUP
chmod +x /usr/local/bin/idotinfra-backup.sh

cat > /etc/cron.d/idotinfra-backup << 'CRON'
# Nightly database backup at 2 AM
0 2 * * * root /usr/local/bin/idotinfra-backup.sh
CRON

echo ""
echo "============================================"
echo "  Server setup complete!"
echo "============================================"
echo ""
echo "Next steps:"
echo "  1. From your LOCAL machine, upload the data files:"
echo ""
echo "     scp -i YOUR_KEY db-export.sql ubuntu@YOUR_IP:~/IdotInfra/oracle-setup/"
echo "     scp -i YOUR_KEY wp-uploads.tar.gz ubuntu@YOUR_IP:~/IdotInfra/oracle-setup/"
echo ""
echo "  2. Then on this server, run:"
echo ""
echo "     cd ~/IdotInfra/oracle-setup"
echo "     sudo ./import-data.sh YOUR_PUBLIC_IP"
echo ""
echo "  Nginx Proxy Manager: http://YOUR_IP:81"
echo "    Default login: admin@example.com / changeme"
echo ""
