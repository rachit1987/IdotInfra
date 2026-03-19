# GitHub Secrets for Auto-Deploy

Add these in **GitHub → Your repo → Settings → Secrets and variables → Actions**:

| Secret | Where to find | Example |
|--------|---------------|---------|
| `FTP_SERVER` | InfinityFree → Accounts → FTP Details (FTP Hostname) | `ftpupload.net` or `ftp.epizy.com` |
| `FTP_USERNAME` | Same as cPanel username | `if0_41412021` or `epiz_xxxxx` |
| `FTP_PASSWORD` | Your cPanel / account password | (your password) |
| `FTP_REMOTE_DIR` | Optional, web root folder | `htdocs/` |
| `DB_HOST` | cPanel → MySQL Databases | `sql100.infinityfree.com` |
| `DB_NAME` | Your database name | `if0_41412021_wordpress` |
| `DB_USER` | Database username | `if0_41412021` |
| `DB_PASSWORD` | Database password | (your DB password) |
| `SITE_URL` | Your live site URL | `http://idotinfra.infinityfree.me` |
| `DEPLOY_KEY` | Any random string (keeps deploy-db.php safe) | `mySecretKey123` |
| `FTP_REMOTE_DIR` | Optional. Web root folder | `htdocs/` |
| `FTP_PROTOCOL` | Optional. Use `ftp` if `ftps` fails | `ftps` (default) |

## If FTP Deploy fails

1. **"Connection refused" / timeout**: Try `FTP_PROTOCOL: ftp` (add as secret)
2. **Wrong server**: Use the exact hostname from InfinityFree → FTP Details
3. **"550" / permission errors**: Ensure `FTP_REMOTE_DIR` is `htdocs/` (with trailing slash)
4. **Re-run**: Actions → Deploy to InfinityFree → Re-run failed jobs

## To deploy

1. Add all secrets above
2. Go to **Actions** tab → **Deploy to InfinityFree** → **Run workflow**
3. Wait 2–3 minutes
4. Visit your site

The workflow will run automatically on push to `main` when `deploy/`, `wp-content/`, or `db-export.sql` changes.
