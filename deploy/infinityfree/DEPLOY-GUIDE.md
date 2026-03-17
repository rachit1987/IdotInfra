# Deploy IdotInfra to InfinityFree -- Step by Step

## What You Need

- An InfinityFree account (free, sign up at https://www.infinityfree.com)
- The files in this directory:
  - `idotinfra-theme.zip` -- your custom WordPress theme
  - `wp-uploads.zip` -- all project images
  - `prepare-db.sh` -- script to prepare the database for import

---

## Step 1: Create InfinityFree Account and Hosting (3 minutes)

1. Go to https://www.infinityfree.com and click **Sign Up**
2. Verify your email
3. In the **Client Area**, click **Create Account**
4. Choose **Free Subdomain** and type a name (e.g., `idotinfra`)
   - Your site URL will be something like `idotinfra.infinityfreeapp.com`
   - (You can add a custom domain later)
5. Set a password for cPanel
6. Click **Create** and wait for it to provision (1-2 minutes)
7. **Write down** your:
   - cPanel username (e.g., `if0_38XXXXXX`)
   - Free subdomain URL
   - MySQL host (shown in account details, usually something like `sqlXXX.infinityfree.com`)

---

## Step 2: Install WordPress via Softaculous (2 minutes)

1. In the Client Area, click **Control Panel** next to your account
2. Scroll down to **Softaculous Apps Installer** and click it
3. Find **WordPress** and click **Install**
4. Fill in:
   - **Choose Protocol**: `http://`
   - **Choose Domain**: your subdomain
   - **In Directory**: leave BLANK (installs to root)
   - **Site Name**: `I-Dot Infra`
   - **Site Description**: `Trust, Opportunity, Dreams, Innovation`
   - **Admin Username**: pick one (e.g., `admin`)
   - **Admin Password**: pick a strong password
   - **Admin Email**: your email
5. Click **Install**
6. Wait for installation to complete

---

## Step 3: Prepare Your Database File (1 minute)

On your **local machine**, open Terminal and run:

```bash
cd ~/Desktop/Personal/Rachit/IdotInfra/deploy/infinityfree
./prepare-db.sh YOUR_SUBDOMAIN.infinityfreeapp.com
```

Replace `YOUR_SUBDOMAIN.infinityfreeapp.com` with your actual InfinityFree URL.

This creates `db-import-ready.sql` with all URLs updated.

---

## Step 4: Import the Database (3 minutes)

1. In InfinityFree cPanel, go to **phpMyAdmin**
2. In the left sidebar, click on your WordPress database (the name shown during Softaculous setup, usually something like `if0_38XXXXXX_wp1`)
3. Click **Select All** (checkbox at bottom of table list) to select all existing tables
4. From the dropdown at the bottom, choose **Drop** and confirm
   - This removes the fresh WordPress tables so we can import your existing data
5. Click the **Import** tab at the top
6. Click **Choose File** and select `db-import-ready.sql` from the `deploy/infinityfree/` folder
7. Click **Go** to import

**Important:** After import, the database tables will have the prefix `wp_`. If InfinityFree's Softaculous used a different prefix, you may need to update `wp-config.php` (see Troubleshooting below).

---

## Step 5: Update wp-config.php Database Credentials (2 minutes)

The imported database expects specific credentials. You need to make sure `wp-config.php` matches.

1. In cPanel, open **File Manager**
2. Navigate to `htdocs/`
3. Right-click `wp-config.php` and click **Edit**
4. Find and verify these lines match your InfinityFree database details:
   ```php
   define('DB_NAME', 'your_if_database_name');
   define('DB_USER', 'your_if_database_user');
   define('DB_PASSWORD', 'your_if_database_password');
   define('DB_HOST', 'sqlXXX.infinityfree.com');
   ```
   (These values are shown in cPanel under **MySQL Databases**)
5. Make sure the table prefix matches:
   ```php
   $table_prefix = 'wp_';
   ```
6. Save the file

---

## Step 6: Upload the Theme (2 minutes)

1. In cPanel **File Manager**, navigate to `htdocs/wp-content/themes/`
2. Click **Upload** in the top bar
3. Upload `idotinfra-theme.zip` from the `deploy/infinityfree/` folder
4. Once uploaded, go back to the file list
5. Select `idotinfra-theme.zip` and click **Extract**
6. Extract to the current directory
7. You should now see a `wp-content/themes/idotinfra-theme/` folder inside the extracted path
8. **Move the files**: If the extraction created `wp-content/themes/idotinfra-theme/` inside a nested folder, move the `idotinfra-theme` folder so it sits directly at `htdocs/wp-content/themes/idotinfra-theme/`
9. Delete the ZIP file after extraction

---

## Step 7: Upload Project Images (2 minutes)

1. In File Manager, navigate to `htdocs/wp-content/`
2. If an `uploads` folder already exists, you can keep it
3. Click **Upload** and upload `wp-uploads.zip`
4. Select the uploaded ZIP and click **Extract**
5. Extract to the current directory (`htdocs/wp-content/`)
6. This creates/merges the `uploads/2026/02/` folder with all project images
7. Delete the ZIP file after extraction

---

## Step 8: Install Astra Parent Theme (1 minute)

1. Go to your WordPress admin: `http://YOUR_SUBDOMAIN.infinityfreeapp.com/wp-admin/`
2. Log in with the admin credentials from the database (same as your local site)
   - If you forgot, the default from setup.sh was likely `admin` / check your local site
3. Go to **Appearance > Themes**
4. Click **Add New**, search for **Astra**
5. Click **Install**, then go back
6. You should see **I-Dot Infra Theme** listed -- click **Activate**

---

## Step 9: Install Contact Form 7 Plugin (1 minute)

1. In WordPress admin, go to **Plugins > Add New**
2. Search for **Contact Form 7**
3. Click **Install Now**, then **Activate**

---

## Step 10: Verify Your Site

Open `http://YOUR_SUBDOMAIN.infinityfreeapp.com` in your browser. Check:

- [ ] Homepage loads with hero, projects, USPs, footer
- [ ] Projects page shows all 4 projects
- [ ] About Us page has company info
- [ ] Contact Us page has the form
- [ ] Individual project pages load with images
- [ ] Navigation menu works
- [ ] Images load properly

---

## Troubleshooting

### "Error establishing a database connection"
- Check `wp-config.php` has the correct InfinityFree database credentials
- Make sure the table prefix in `wp-config.php` matches `wp_`

### Images not showing
- Verify files exist at `htdocs/wp-content/uploads/2026/02/`
- Check file permissions in File Manager (should be 644)

### Theme not showing up
- Make sure `idotinfra-theme` folder is at `htdocs/wp-content/themes/idotinfra-theme/`
- Check that `style.css` is directly inside that folder (not nested deeper)

### "Not Found" errors on pages
- Go to WordPress admin > **Settings > Permalinks**
- Select **Post name** and click **Save Changes** (this regenerates `.htaccess`)

### Login credentials
- Your local WordPress admin password was imported. Use the same login as localhost:8082/wp-admin
- If you can't remember, use phpMyAdmin to check the `wp_users` table

---

## Adding a Custom Domain Later

1. Buy a domain (~600 INR/year from GoDaddy, Namecheap, Hostinger)
2. In the domain registrar's DNS settings, change the **nameservers** to InfinityFree's:
   - `ns1.byet.org`
   - `ns2.byet.org`
   - `ns3.byet.org`
   - `ns4.byet.org`
   - `ns5.byet.org`
3. In InfinityFree Client Area, go to your account and add the domain as an **Addon Domain**
4. Update WordPress URLs:
   - In phpMyAdmin, run:
     ```sql
     UPDATE wp_options SET option_value = 'http://yourdomain.com' WHERE option_name IN ('siteurl', 'home');
     ```
5. InfinityFree provides **free SSL** -- enable it in cPanel under **SSL/TLS**

---

## Keeping Local and Live in Sync

Your local Docker site at `http://localhost:8082` continues to work independently. When you make theme changes locally:

1. Edit files in `wp-content/themes/idotinfra-theme/`
2. Test locally at `http://localhost:8082`
3. `git add`, `git commit`, `git push` to GitHub
4. Upload the changed files to InfinityFree via File Manager

The database (content, pages, projects) is managed separately on each environment.
