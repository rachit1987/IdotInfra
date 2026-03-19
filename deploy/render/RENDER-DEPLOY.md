# Deploy IdotInfra to Render

## Prerequisites

| Requirement | Details |
|---|---|
| **Render account** | <https://render.com> — Starter plan ($7/month) needed for the persistent disk |
| **External MySQL database** | Render doesn't offer MySQL. Use one of the free-tier providers below |
| **Git repo pushed to GitHub/GitLab** | Render deploys from a connected repo |

### Recommended MySQL Providers (free tier)

| Provider | Free Tier | Link |
|---|---|---|
| **PlanetScale** | 5 GB, 1 billion row reads/mo | <https://planetscale.com> |
| **Aiven** | 5 GB MySQL | <https://aiven.io> |
| **Railway** | $5 free credit/mo | <https://railway.app> |
| **TiDB Cloud** | 5 GB, Serverless | <https://tidbcloud.com> |

---

## Step 1 — Create the MySQL Database

1. Sign up at one of the providers above.
2. Create a MySQL database (name it `idotinfra`).
3. Note down these values — you'll need them in Step 3:
   - **Host** (e.g. `aws.connect.psdb.cloud`)
   - **Port** (usually `3306`)
   - **Database name**
   - **Username**
   - **Password**

> **PlanetScale note:** Enable "Connect with MySQL client" and use the provided
> credentials. PlanetScale uses TLS by default — WordPress handles this
> automatically.

---

## Step 2 — Deploy on Render

### Option A: Blueprint (recommended)

1. Push the repo to GitHub.
2. Go to <https://dashboard.render.com/blueprints> → **New Blueprint Instance**.
3. Connect your repo and select the branch.
4. Render reads `render.yaml` and creates the web service automatically.
5. Fill in the environment variables when prompted (see Step 3).

### Option B: Manual setup

1. Go to <https://dashboard.render.com> → **New** → **Web Service**.
2. Connect your GitHub/GitLab repo.
3. Settings:
   - **Name:** `idotinfra`
   - **Runtime:** Docker
   - **Dockerfile Path:** `./Dockerfile`
   - **Plan:** Starter ($7/month)
4. Under **Disks**, add a persistent disk:
   - **Name:** `wp-uploads`
   - **Mount Path:** `/var/www/html/wp-content/uploads`
   - **Size:** 1 GB
5. Add environment variables (see Step 3).
6. Click **Create Web Service**.

---

## Step 3 — Environment Variables

Set these in the Render dashboard under your service's **Environment** tab:

| Variable | Example Value | Required |
|---|---|---|
| `WORDPRESS_DB_HOST` | `aws.connect.psdb.cloud` | Yes |
| `WORDPRESS_DB_PORT` | `3306` | Yes |
| `WORDPRESS_DB_NAME` | `idotinfra` | Yes |
| `WORDPRESS_DB_USER` | `your_db_user` | Yes |
| `WORDPRESS_DB_PASSWORD` | `your_db_password` | Yes |
| `WORDPRESS_TABLE_PREFIX` | `wp_` | Yes |
| `WP_ADMIN_USER` | `admin` | Yes |
| `WP_ADMIN_PASSWORD` | *(strong password)* | Yes |
| `WP_ADMIN_EMAIL` | `admin@idotinfra.com` | Yes |

> `RENDER_EXTERNAL_URL` is set automatically by Render (e.g.
> `https://idotinfra.onrender.com`). The startup script uses it to configure
> WordPress URLs.

---

## Step 4 — First Deploy

1. Render will build the Docker image and start the container.
2. On the first boot, the startup script:
   - Waits for the database to be reachable
   - Installs WordPress core, Astra theme, and Contact Form 7
   - Activates the `idotinfra-theme` child theme
   - Imports `db-export.sql` if the database is empty
   - Configures site URLs to match the Render URL
3. Watch the deploy logs in the Render dashboard to confirm success.

---

## Step 5 — Post-Deploy

1. Visit `https://idotinfra.onrender.com` (your Render URL).
2. Log in at `https://idotinfra.onrender.com/wp-admin` with the admin
   credentials you set.
3. Verify:
   - Theme is active (Appearance → Themes)
   - Projects display correctly
   - Contact Form 7 works
   - Media uploads persist across deploys (stored on the persistent disk)

### Custom Domain (optional)

1. In Render dashboard → your service → **Settings** → **Custom Domains**.
2. Add your domain (e.g. `www.idotinfra.com`).
3. Update DNS:  add a `CNAME` record pointing to `idotinfra.onrender.com`.
4. Render provisions a free TLS certificate automatically.
5. After DNS propagates, update WordPress URLs:
   ```
   wp option update siteurl "https://www.idotinfra.com"
   wp option update home "https://www.idotinfra.com"
   ```
   Or change them in **Settings → General** in WP Admin.

---

## File Overview

| File | Purpose |
|---|---|
| `Dockerfile` | Builds the WordPress image with the custom theme, WP-CLI, and setup scripts |
| `render.yaml` | Render Blueprint — defines the web service, disk, and env vars |
| `deploy/render/start.sh` | Container entrypoint: configures Apache port, copies theme, runs first-time setup |

---

## Troubleshooting

| Issue | Fix |
|---|---|
| **503 / health check failing** | Check deploy logs. The DB might not be reachable — verify `WORDPRESS_DB_HOST` and that the provider allows external connections. |
| **"Error establishing a database connection"** | Double-check all `WORDPRESS_DB_*` variables. If using PlanetScale, ensure the branch is not sleeping. |
| **Uploads lost after redeploy** | Make sure the persistent disk is attached at `/var/www/html/wp-content/uploads`. |
| **Theme not showing** | Check deploy logs for the `cp -r` step. Verify the theme files are committed in `wp-content/themes/idotinfra-theme/`. |
| **Slow cold starts** | Render Starter plan spins down after 15 min of inactivity. Upgrade to Standard ($25/month) to keep the service always on. |
