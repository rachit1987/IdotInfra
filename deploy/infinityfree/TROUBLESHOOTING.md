# InfinityFree Troubleshooting Guide — idotinfra.infinityfree.me

Use this guide when your site has "all folders installed but not working."

---

## Quick Checklist

| Check | Where to Look | Fix |
|-------|---------------|-----|
| **1. Correct site URL** | Database: `wp_options` (siteurl, home) | Must be `http://idotinfra.infinityfree.me` (or `https://` if SSL) |
| **2. Database connection** | `wp-config.php` | DB credentials must match your InfinityFree MySQL settings |
| **3. .htaccess exists** | `htdocs/.htaccess` | Should have WordPress rewrite rules |
| **4. Permalinks** | WP Admin → Settings → Permalinks | Set to "Post name" and **Save** |
| **5. Theme active** | `wp_options` (stylesheet, template) | stylesheet = `idotinfra-theme`, template = `astra` |
| **6. index.php** | `htdocs/index.php` | Must exist (WordPress bootstrap) |

---

## Common Issues

### "Error establishing a database connection"

**Cause:** `wp-config.php` has wrong DB host, name, user, or password.

**Fix:**
1. Log into InfinityFree → Control Panel → **MySQL Databases**
2. Note: **Host**, **Database name**, **Username**, **Password**
3. Edit `htdocs/wp-config.php` and update:
   ```php
   define('DB_NAME', 'your_actual_db_name');
   define('DB_USER', 'your_actual_db_user');
   define('DB_PASSWORD', 'your_actual_db_password');
   define('DB_HOST', 'sqlXXX.infinityfree.com');  // from cPanel
   ```
4. Save the file.

---

### Site URL mismatch (redirects to wrong domain / blank page)

**Cause:** Database has `siteurl` / `home` pointing to a different URL (e.g. `idotinfra.infinityfreeapp.me` instead of `idotinfra.infinityfree.me`).

**Fix via phpMyAdmin:**
1. cPanel → phpMyAdmin → select your WordPress database
2. Open the `wp_options` table
3. Find rows where `option_name` = `siteurl` and `home`
4. Set `option_value` to: `http://idotinfra.infinityfree.me` (or `https://` if using SSL)
5. Save

**Or run this SQL:**
```sql
UPDATE wp_options SET option_value = 'http://idotinfra.infinityfree.me' WHERE option_name IN ('siteurl', 'home');
```

---

### Blank white page (no error message)

**Causes:** PHP fatal error, memory limit, or missing files.

**Fix:**
1. Enable debug: in `wp-config.php` add before "That's all":
   ```php
   define('WP_DEBUG', true);
   define('WP_DEBUG_LOG', true);
   define('WP_DEBUG_DISPLAY', false);
   ```
2. Reload the site and check `wp-content/debug.log` for errors
3. Or check cPanel → Errors / Error Log for PHP errors

---

### "Not Found" or 404 on pages

**Cause:** Permalinks not configured or `.htaccess` missing.

**Fix:**
1. Go to `http://idotinfra.infinityfree.me/wp-admin/`
2. **Settings → Permalinks**
3. Select **Post name**
4. Click **Save Changes** (this regenerates `.htaccess`)

If `.htaccess` is missing, create it in `htdocs/` with:
```
# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
```

---

### Theme not showing / broken layout

**Fix:**
1. In WP Admin: **Appearance → Themes**
2. Install **Astra** if missing
3. Activate **I-Dot Infra Theme**
4. Ensure `htdocs/wp-content/themes/idotinfra-theme/` exists with `style.css` inside

---

### Images not loading

**Fix:**
1. Confirm `htdocs/wp-content/uploads/` has your images (e.g. `2026/02/`)
2. In DB, image URLs should use `http://idotinfra.infinityfree.me` not `localhost:8082`
3. Run in phpMyAdmin:
   ```sql
   UPDATE wp_posts SET post_content = REPLACE(post_content, 'http://localhost:8082', 'http://idotinfra.infinityfree.me');
   UPDATE wp_postmeta SET meta_value = REPLACE(meta_value, 'http://localhost:8082', 'http://idotinfra.infinityfree.me');
   ```

---

## If You Used the github-installer.php

The installer is configured for specific values. If your domain is `idotinfra.infinityfree.me`, you must use an installer that has:

- `$SITE_URL = 'http://idotinfra.infinityfree.me';`
- Your actual InfinityFree DB credentials (from cPanel)

Your database ID (e.g. `if0_41412021`) is unique per account. If you created a new account, you must update the installer with your DB host, name, user, and password before running it.

---

## Manual Deployment (if installer fails)

Follow **DEPLOY-GUIDE.md** step-by-step:

1. Install WordPress via Softaculous
2. Prepare DB: `./prepare-db.sh idotinfra.infinityfree.me`
3. Import `db-import-ready.sql` in phpMyAdmin
4. Update `wp-config.php` with your DB credentials
5. Upload theme ZIP to `wp-content/themes/` and extract
6. Upload `wp-uploads.zip` to `wp-content/` and extract
7. Activate Astra and I-Dot Infra Theme
8. Set Permalinks to Post name

---

## Still Not Working?

1. **Verify folder structure** in cPanel File Manager:
   - `htdocs/index.php` ✓
   - `htdocs/wp-config.php` ✓
   - `htdocs/wp-content/themes/idotinfra-theme/style.css` ✓
   - `htdocs/.htaccess` ✓

2. **Test wp-admin**: Can you reach `http://idotinfra.infinityfree.me/wp-admin/`? If yes, the issue is likely theme or permalinks.

3. **InfinityFree limits**: Free hosting has execution time limits. If the installer times out, use the manual DEPLOY-GUIDE.md instead.
