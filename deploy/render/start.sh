#!/bin/bash
set -e

# Render exposes a dynamic PORT; Apache must listen on it
if [ -n "$PORT" ]; then
    sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf
    sed -i "s/<VirtualHost \*:80>/<VirtualHost *:$PORT>/g" \
        /etc/apache2/sites-available/000-default.conf
fi

# Copy custom theme into the live WordPress tree
if [ -d /usr/src/idotinfra-theme ]; then
    mkdir -p /var/www/html/wp-content/themes/idotinfra-theme
    cp -r /usr/src/idotinfra-theme/* /var/www/html/wp-content/themes/idotinfra-theme/
    chown -R www-data:www-data /var/www/html/wp-content/themes/idotinfra-theme
fi

# One-time WordPress setup (runs only when the DB has no tables yet)
wp_setup() {
    local WP="wp --allow-root --path=/var/www/html"

    if $WP core is-installed 2>/dev/null; then
        echo "[render] WordPress already installed — skipping setup."
        return
    fi

    echo "[render] Running first-time WordPress setup..."

    $WP core install \
        --url="${RENDER_EXTERNAL_URL:-http://localhost}" \
        --title="I-Dot Infra" \
        --admin_user="${WP_ADMIN_USER:-admin}" \
        --admin_password="${WP_ADMIN_PASSWORD:-changeme}" \
        --admin_email="${WP_ADMIN_EMAIL:-admin@idotinfra.com}" \
        --skip-email

    # Install parent theme and plugins
    $WP theme install astra --force || true
    $WP theme activate idotinfra-theme
    $WP plugin install contact-form-7 --activate --force || true

    # Import database dump if present and DB is fresh
    if [ -f /usr/src/db-export.sql ]; then
        echo "[render] Importing database dump..."
        $WP db import /usr/src/db-export.sql || true

        echo "[render] Replacing localhost URLs with Render URL..."
        $WP search-replace 'http://localhost:8082' "${RENDER_EXTERNAL_URL:-http://localhost}" \
            --all-tables --skip-columns=guid || true
    fi

    # Basic site options
    $WP option update blogname "I-Dot Infra"
    $WP option update blogdescription "Trust, Opportunity, Dreams, Innovation"
    $WP option update siteurl "${RENDER_EXTERNAL_URL:-http://localhost}"
    $WP option update home "${RENDER_EXTERNAL_URL:-http://localhost}"
    $WP option update timezone_string "Asia/Kolkata"
    $WP rewrite structure '/%postname%/' --hard
    $WP rewrite flush --hard

    echo "[render] Setup complete."
}

# Wait for the database to accept connections (max 60 s)
echo "[render] Waiting for database..."
for i in $(seq 1 60); do
    if mysqladmin ping -h"${WORDPRESS_DB_HOST%%:*}" \
        -P"${WORDPRESS_DB_PORT:-3306}" \
        -u"$WORDPRESS_DB_USER" \
        -p"$WORDPRESS_DB_PASSWORD" --ssl --silent 2>/dev/null; then
        echo "[render] Database is ready."
        break
    fi
    sleep 1
done

# Run setup in the background so Apache can start accepting health checks
wp_setup &

exec apache2-foreground
