#!/bin/bash
set -e

if [ -n "$PORT" ]; then
    sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf
    sed -i "s/<VirtualHost \*:80>/<VirtualHost *:$PORT>/g" \
        /etc/apache2/sites-available/000-default.conf
fi

copy_theme() {
    while [ ! -f /var/www/html/wp-includes/version.php ]; do sleep 1; done
    if [ -d /usr/src/idotinfra-theme ]; then
        mkdir -p /var/www/html/wp-content/themes/idotinfra-theme
        cp -r /usr/src/idotinfra-theme/* /var/www/html/wp-content/themes/idotinfra-theme/
        chown -R www-data:www-data /var/www/html/wp-content/themes/idotinfra-theme
        echo "[render] Theme copied."
    fi
}

wp_setup() {
    local WP="wp --allow-root --path=/var/www/html"

    echo "[render] Waiting for WordPress files..."
    while [ ! -f /var/www/html/wp-load.php ]; do sleep 1; done

    echo "[render] Waiting for database..."
    for i in $(seq 1 90); do
        if mysqladmin ping -h"${WORDPRESS_DB_HOST%%:*}" \
            -P"${WORDPRESS_DB_PORT:-3306}" \
            -u"$WORDPRESS_DB_USER" \
            -p"$WORDPRESS_DB_PASSWORD" --silent 2>/dev/null; then
            echo "[render] Database is ready."
            break
        fi
        if [ "$i" -eq 90 ]; then
            echo "[render] WARNING: Database not reachable after 90s, continuing anyway."
        fi
        sleep 1
    done

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

    $WP theme install astra --force || true
    $WP theme activate idotinfra-theme
    $WP plugin install contact-form-7 --activate --force || true

    if [ -f /usr/src/db-export.sql ]; then
        echo "[render] Importing database dump..."
        $WP db import /usr/src/db-export.sql || true

        echo "[render] Replacing localhost URLs with Render URL..."
        $WP search-replace 'http://localhost:8082' "${RENDER_EXTERNAL_URL:-http://localhost}" \
            --all-tables --skip-columns=guid || true
    fi

    $WP option update blogname "I-Dot Infra"
    $WP option update blogdescription "Trust, Opportunity, Dreams, Innovation"
    $WP option update siteurl "${RENDER_EXTERNAL_URL:-http://localhost}"
    $WP option update home "${RENDER_EXTERNAL_URL:-http://localhost}"
    $WP option update timezone_string "Asia/Kolkata"
    $WP rewrite structure '/%postname%/' --hard
    $WP rewrite flush --hard

    echo "[render] Setup complete."
}

copy_theme &
wp_setup &

# Hand off to the WordPress entrypoint so it copies WP files + creates wp-config.php,
# then starts Apache. (CMD ["start.sh"] bypasses WP setup because the entrypoint only
# triggers on "apache2-foreground" as $1 — calling it explicitly here fixes that.)
exec docker-entrypoint.sh apache2-foreground
