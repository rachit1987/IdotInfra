# Oracle Cloud Free Tier - Setup Guide

## Step 1: Create Oracle Cloud Account (5 minutes)

1. Go to https://www.oracle.com/cloud/free/
2. Click "Start for free"
3. Fill in your details. **Home Region**: pick the one closest to your audience
   - For India: **AP Mumbai 1 (ap-mumbai-1)** or **AP Hyderabad 1 (ap-hyderabad-1)**
4. You'll need a credit card for identity verification -- **Oracle will NOT charge it**
5. Complete email verification

## Step 2: Create the ARM VM (5 minutes)

1. Log into https://cloud.oracle.com
2. Click the hamburger menu (top-left) > **Compute** > **Instances**
3. Click **Create Instance**
4. Configure:
   - **Name**: `web-server`
   - **Image**: Ubuntu 22.04 (click "Change Image" > Ubuntu > 22.04)
   - **Shape**: Click "Change Shape" > Ampere (ARM) > VM.Standard.A1.Flex
     - **OCPUs**: 4
     - **Memory**: 24 GB
   - **Networking**: Keep defaults (creates a VCN automatically)
   - **SSH Key**: Click "Save Private Key" -- save the `.key` file somewhere safe
5. Click **Create**
6. Wait 2-3 minutes until status shows **RUNNING**
7. Copy the **Public IP Address** shown on the instance details page

## Step 3: Open Firewall Ports (2 minutes)

1. On the instance details page, click the **Subnet** link (under "Primary VNIC")
2. Click the **Security List** (Default Security List)
3. Click **Add Ingress Rules** and add these two rules:
   - **Rule 1**: Source CIDR: `0.0.0.0/0`, Destination Port: `80`, Protocol: TCP
   - **Rule 2**: Source CIDR: `0.0.0.0/0`, Destination Port: `443`, Protocol: TCP
4. Click "Add Ingress Rules"

## Step 4: SSH into the server and run the setup script

```bash
# Make your SSH key usable
chmod 400 /path/to/your-ssh-key.key

# SSH into the server
ssh -i /path/to/your-ssh-key.key ubuntu@YOUR_PUBLIC_IP

# Once inside the server, run:
git clone https://github.com/rachit1987/IdotInfra.git
cd IdotInfra/oracle-setup
chmod +x setup-server.sh
sudo ./setup-server.sh
```

The script will:
- Install Docker and Docker Compose
- Set up Nginx Proxy Manager (for managing domains + auto SSL)
- Deploy WordPress + MariaDB
- Import the database and uploads
- Set up keep-alive cron (prevents Oracle from reclaiming idle resources)
- Set up nightly database backups

## Step 5: Upload your data

After the setup script finishes, it will tell you to upload two files. From your LOCAL machine:

```bash
cd /path/to/IdotInfra
scp -i /path/to/your-ssh-key.key db-export.sql ubuntu@YOUR_PUBLIC_IP:~/IdotInfra/oracle-setup/
scp -i /path/to/your-ssh-key.key wp-uploads.tar.gz ubuntu@YOUR_PUBLIC_IP:~/IdotInfra/oracle-setup/
```

Then back on the server:

```bash
cd ~/IdotInfra/oracle-setup
chmod +x import-data.sh
sudo ./import-data.sh YOUR_PUBLIC_IP
```

## Step 6: Access your site

- **WordPress**: `http://YOUR_PUBLIC_IP`
- **Nginx Proxy Manager**: `http://YOUR_PUBLIC_IP:81`
  - Default login: admin@example.com / changeme
  - Change this immediately on first login

## Adding a Custom Domain Later

1. Buy your domain (~600 INR/year from GoDaddy, Namecheap, etc.)
2. In your domain's DNS settings, add an A record pointing to YOUR_PUBLIC_IP
3. Open Nginx Proxy Manager (`http://YOUR_PUBLIC_IP:81`)
4. Add a Proxy Host:
   - Domain: yourdomain.com
   - Forward to: wordpress (port 80)
   - Enable SSL (Let's Encrypt, auto-renew)
5. Update WordPress URL:
   ```bash
   cd ~/IdotInfra/oracle-setup
   sudo ./update-domain.sh yourdomain.com
   ```

## Adding More Sites

To add another WordPress site, just run:
```bash
cd ~/IdotInfra/oracle-setup
sudo ./add-site.sh sitename
```
This creates a new WordPress + database instance. Then add a proxy host in Nginx Proxy Manager.
