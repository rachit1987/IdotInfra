# GitHub Secrets for Auto-Deploy

Add these in **GitHub → Your repo → Settings → Secrets and variables → Actions**:

| Secret | Where to find | Example |
|--------|---------------|---------|
| `FTP_SERVER` | InfinityFree → Accounts → FTP Details | `ftpupload.net` |
| `FTP_USERNAME` | Same as cPanel username | `if0_41412021` |
| `FTP_PASSWORD` | Your cPanel / account password | (your password) |
| `FTP_REMOTE_DIR` | Optional, web root folder | `htdocs/` |
| `DB_HOST` | cPanel → MySQL Databases | `sql100.infinityfree.com` |
| `DB_NAME` | Your database name | `if0_41412021_wordpress` |
| `DB_USER` | Database username | `if0_41412021` |
| `DB_PASSWORD` | Database password | (your DB password) |
| `SITE_URL` | Your live site URL | `http://idotinfra.infinityfree.me` |
| `DEPLOY_KEY` | Any random string (keeps deploy-db.php safe) | `mySecretKey123` |

## To deploy

1. Add all secrets above
2. Go to **Actions** tab → **Deploy to InfinityFree** → **Run workflow**
3. Wait 2–3 minutes
4. Visit your site

The workflow will run automatically on push to `main` when `deploy/`, `wp-content/`, or `db-export.sql` changes.
