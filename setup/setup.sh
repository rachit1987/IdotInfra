#!/bin/bash
# I-Dot Infra WordPress Setup Script
# Run inside the wordpress container via: docker compose exec wordpress bash /setup/setup.sh

set -e

WP="/usr/local/bin/wp --allow-root"
SITE_URL="http://localhost:8082"
SITE_TITLE="I-Dot Infra"
ADMIN_USER="admin"
ADMIN_PASS="admin123"
ADMIN_EMAIL="admin@idotinfra.com"

echo "=== Setting up WP-CLI cache ==="
mkdir -p /var/www/.wp-cli/cache
chown -R www-data:www-data /var/www/.wp-cli

echo "=== Installing WordPress Core ==="
if ! $WP core is-installed 2>/dev/null; then
    $WP core install \
        --url="$SITE_URL" \
        --title="$SITE_TITLE" \
        --admin_user="$ADMIN_USER" \
        --admin_password="$ADMIN_PASS" \
        --admin_email="$ADMIN_EMAIL" \
        --skip-email
    echo "WordPress installed successfully."
else
    echo "WordPress already installed."
fi

echo "=== Installing Astra Theme ==="
if [ -f /tmp/astra.zip ]; then
    $WP theme install /tmp/astra.zip --force
else
    $WP theme install astra --force || echo "Astra install from repo failed, will try later."
fi

echo "=== Activating I-Dot Infra Child Theme ==="
$WP theme activate idotinfra-theme

echo "=== Installing Contact Form 7 ==="
if [ -f /tmp/contact-form-7.zip ]; then
    $WP plugin install /tmp/contact-form-7.zip --activate --force
else
    $WP plugin install contact-form-7 --activate --force || echo "CF7 install from repo failed."
fi

echo "=== Configuring Site Settings ==="
$WP option update blogname "I-Dot Infra"
$WP option update blogdescription "Trust, Opportunity, Dreams, Innovation"
$WP option update timezone_string "Asia/Kolkata"
$WP option update date_format "F j, Y"
$WP option update time_format "g:i a"

echo "=== Deleting Default Content ==="
$WP post delete 1 --force 2>/dev/null || true
$WP post delete 2 --force 2>/dev/null || true
$WP post delete 3 --force 2>/dev/null || true

echo "=== Creating Pages ==="

# Home page
HOME_ID=$($WP post create --post_type=page --post_title="Home" --post_status=publish --post_name="home" --porcelain 2>/dev/null || echo "")
if [ -n "$HOME_ID" ]; then
    echo "Home page created: $HOME_ID"
fi

# About Us page
ABOUT_ID=$($WP post create --post_type=page --post_title="About Us" --post_status=publish --post_name="about-us" --porcelain 2>/dev/null || echo "")
if [ -n "$ABOUT_ID" ]; then
    $WP post meta update $ABOUT_ID _wp_page_template "page-about.php"
    echo "About Us page created: $ABOUT_ID"
fi

# Projects page
PROJECTS_ID=$($WP post create --post_type=page --post_title="Projects" --post_status=publish --post_name="projects" --porcelain 2>/dev/null || echo "")
if [ -n "$PROJECTS_ID" ]; then
    $WP post meta update $PROJECTS_ID _wp_page_template "page-projects.php"
    echo "Projects page created: $PROJECTS_ID"
fi

# Contact Us page
CONTACT_CONTENT='<h2>Get In Touch</h2>
<p>We would love to hear from you! Whether you are interested in one of our projects, have questions about availability, or just want to know more about I-Dot Infra, please fill out the form below or reach us directly.</p>

[contact-form-7 id="" title="Contact Form"]

<div style="margin-top:40px;">
<h3>Contact Information</h3>
<p><strong>Address:</strong> Bhadreswar, Hooghly, West Bengal, India</p>
<p><strong>Phone:</strong> +91 99999 99999</p>
<p><strong>Email:</strong> info@idotinfra.com</p>
</div>'

CONTACT_ID=$($WP post create --post_type=page --post_title="Contact Us" --post_status=publish --post_name="contact-us" --post_content="$CONTACT_CONTENT" --porcelain 2>/dev/null || echo "")
if [ -n "$CONTACT_ID" ]; then
    echo "Contact Us page created: $CONTACT_ID"
fi

echo "=== Setting Static Front Page ==="
if [ -n "$HOME_ID" ]; then
    $WP option update show_on_front "page"
    $WP option update page_on_front "$HOME_ID"
    echo "Static front page set to Home."
fi

echo "=== Flushing Rewrite Rules ==="
$WP rewrite structure '/%postname%/' --hard
$WP rewrite flush --hard

echo "=== Creating Navigation Menu ==="
$WP menu create "Primary Menu" 2>/dev/null || true

if [ -n "$HOME_ID" ]; then
    $WP menu item add-post "Primary Menu" $HOME_ID --title="Home"
fi
if [ -n "$ABOUT_ID" ]; then
    $WP menu item add-post "Primary Menu" $ABOUT_ID --title="About Us"
fi
if [ -n "$PROJECTS_ID" ]; then
    PROJECTS_MENU_ID=$($WP menu item add-post "Primary Menu" $PROJECTS_ID --title="Projects" --porcelain 2>/dev/null || echo "")
fi
if [ -n "$CONTACT_ID" ]; then
    $WP menu item add-post "Primary Menu" $CONTACT_ID --title="Contact Us"
fi

$WP menu location assign "Primary Menu" primary 2>/dev/null || true

echo "=== Uploading Logo ==="
if [ -f /var/www/html/wp-content/themes/idotinfra-theme/assets/logo.png ]; then
    LOGO_ID=$($WP media import /var/www/html/wp-content/themes/idotinfra-theme/assets/logo.png --title="I-Dot Infra Logo" --porcelain 2>/dev/null || echo "")
    if [ -n "$LOGO_ID" ]; then
        $WP option update site_logo "$LOGO_ID"
        $WP option update site_icon "$LOGO_ID"
        echo "Logo uploaded and set: $LOGO_ID"
    fi
fi

echo "=== Creating Contact Form ==="
CF7_FORM='<label>Your Name (required)
[text* your-name]</label>

<label>Your Email (required)
[email* your-email]</label>

<label>Phone Number
[tel your-phone]</label>

<label>Interested Project
[select project "Select a Project" "Shakuntala" "Anupama" "VishnuPriya" "BhitikaVilla" "Other"]</label>

<label>Your Message
[textarea your-message]</label>

[submit "Send Enquiry"]'

CF7_ID=$($WP post create --post_type=wpcf7_contact_form --post_title="Contact Form" --post_content="$CF7_FORM" --post_status=publish --porcelain 2>/dev/null || echo "")
if [ -n "$CF7_ID" ]; then
    echo "Contact Form 7 created: $CF7_ID"
    if [ -n "$CONTACT_ID" ]; then
        $WP post update $CONTACT_ID --post_content="$(echo "$CONTACT_CONTENT" | sed "s/\[contact-form-7 id=\"\" title=\"Contact Form\"\]/[contact-form-7 id=\"$CF7_ID\" title=\"Contact Form\"]/")" 2>/dev/null || true
    fi
fi

echo ""
echo "========================================="
echo " I-Dot Infra WordPress Setup Complete!"
echo " Site URL: $SITE_URL"
echo " Admin: $SITE_URL/wp-admin"
echo " Username: $ADMIN_USER"
echo " Password: $ADMIN_PASS"
echo "========================================="
echo ""
echo "Next: Create projects via WP Admin or WP-CLI"
