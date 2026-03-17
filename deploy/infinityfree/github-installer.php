<?php
/**
 * I-Dot Infra - Self-Installing WordPress from GitHub
 * 
 * CREATE THIS FILE in InfinityFree File Manager:
 *   1. Open File Manager > htdocs
 *   2. Click "New File" > name it "install.php"
 *   3. Paste this ENTIRE code
 *   4. Save
 *   5. Visit: http://idotinfra.infinityfreeapp.me/install.php
 */

set_time_limit(600);
error_reporting(E_ALL);
ini_set('display_errors', 1);

$GITHUB_BASE = 'https://raw.githubusercontent.com/rachit1987/IdotInfra/main/deploy/infinityfree/upload-parts/';
$DB_HOST = 'sql100.infinityfree.com';
$DB_NAME = 'if0_41412021_wordpress';
$DB_USER = 'if0_41412021';
$DB_PASS = 'Tarang2026';
$SITE_URL = 'http://idotinfra.infinityfreeapp.me';

$PARTS = [
    'part1-core.zip',
    'part2-includes-php.zip',
    'part3-includes-js1.zip',
    'part4-includes-js2.zip',
    'part5-includes-css-blocks.zip',
    'part6-themes.zip',
    'part7-uploads.zip',
    'part8-plugins.zip',
];

function download($url, $dest) {
    $ch = curl_init($url);
    $fp = fopen($dest, 'w');
    curl_setopt($ch, CURLOPT_FILE, $fp);
    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
    curl_setopt($ch, CURLOPT_TIMEOUT, 120);
    curl_setopt($ch, CURLOPT_USERAGENT, 'IdotInfra-Installer/1.0');
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    $ok = curl_exec($ch);
    $code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    $err = curl_error($ch);
    curl_close($ch);
    fclose($fp);
    if (!$ok || $code !== 200) {
        @unlink($dest);
        return "HTTP $code - $err";
    }
    return true;
}
?>
<!DOCTYPE html>
<html>
<head><title>I-Dot Infra Installer</title>
<style>
body{font-family:-apple-system,sans-serif;max-width:750px;margin:40px auto;padding:20px;background:#f5f5f5}
.c{background:#fff;border-radius:8px;padding:30px;box-shadow:0 2px 8px rgba(0,0,0,.1)}
h1{color:#1B3A5C;margin-top:0}
.ok{color:#28a745;font-weight:700}
.fail{color:#dc3545;font-weight:700}
.s{padding:8px 0;border-bottom:1px solid #eee}
.btn{display:inline-block;background:#F37021;color:#fff;padding:12px 24px;border-radius:6px;text-decoration:none;font-weight:700;border:none;cursor:pointer;font-size:16px;margin:8px 4px}
</style>
</head>
<body><div class="c">
<h1>I-Dot Infra Installer</h1>
<?php
$step = isset($_GET['step']) ? (int)$_GET['step'] : 0;

if ($step === 0) {
    echo '<p>This will automatically:</p><ol>';
    echo '<li>Download WordPress + theme + images from GitHub</li>';
    echo '<li>Extract all files</li>';
    echo '<li>Import the database</li>';
    echo '<li>Configure your site</li></ol>';
    echo '<p><strong>Site:</strong> ' . $SITE_URL . '</p>';
    echo '<p><strong>Database:</strong> ' . $DB_NAME . ' @ ' . $DB_HOST . '</p>';
    echo '<form method="get"><input type="hidden" name="step" value="1">';
    echo '<button type="submit" class="btn">Start Installation</button></form>';
    echo '</div></body></html>';
    exit;
}

if ($step === 1) {
    echo '<h2>Step 1: Downloading from GitHub...</h2>';
    $allOk = true;
    foreach ($PARTS as $part) {
        echo '<div class="s">' . $part . ' ... ';
        flush(); ob_flush();
        $result = download($GITHUB_BASE . $part, __DIR__ . '/' . $part);
        if ($result === true) {
            $size = round(filesize(__DIR__ . '/' . $part) / 1048576, 1);
            echo '<span class="ok">OK</span> (' . $size . ' MB)';
        } else {
            echo '<span class="fail">FAILED: ' . htmlspecialchars($result) . '</span>';
            $allOk = false;
        }
        echo '</div>';
        flush(); ob_flush();
    }

    // Also download the DB SQL
    echo '<div class="s">idotinfra-db.sql ... ';
    flush(); ob_flush();
    $dbUrl = 'https://raw.githubusercontent.com/rachit1987/IdotInfra/main/db-export.sql';
    $result = download($dbUrl, __DIR__ . '/idotinfra-db.sql');
    if ($result === true) {
        echo '<span class="ok">OK</span>';
    } else {
        echo '<span class="fail">FAILED: ' . htmlspecialchars($result) . '</span>';
        $allOk = false;
    }
    echo '</div>';

    if ($allOk) {
        echo '<p class="ok">All files downloaded!</p>';
        echo '<form method="get"><input type="hidden" name="step" value="2">';
        echo '<button type="submit" class="btn">Next: Extract Files</button></form>';
    } else {
        echo '<p class="fail">Some downloads failed. Check errors above and try again.</p>';
        echo '<form method="get"><input type="hidden" name="step" value="1">';
        echo '<button type="submit" class="btn">Retry Downloads</button></form>';
    }
    echo '</div></body></html>';
    exit;
}

if ($step === 2) {
    echo '<h2>Step 2: Extracting files...</h2>';
    $ok = 0;
    foreach ($PARTS as $part) {
        $file = __DIR__ . '/' . $part;
        if (!file_exists($file)) {
            echo '<div class="s">' . $part . ' <span class="fail">NOT FOUND</span></div>';
            continue;
        }
        echo '<div class="s">' . $part . ' ... ';
        $zip = new ZipArchive;
        if ($zip->open($file) === TRUE) {
            $zip->extractTo(__DIR__);
            $count = $zip->numFiles;
            $zip->close();
            @unlink($file);
            echo '<span class="ok">OK</span> (' . $count . ' files)';
            $ok++;
        } else {
            echo '<span class="fail">EXTRACT FAILED</span>';
        }
        echo '</div>';
        flush(); ob_flush();
    }
    echo '<p>Extracted ' . $ok . '/' . count($PARTS) . ' parts.</p>';
    echo '<form method="get"><input type="hidden" name="step" value="3">';
    echo '<button type="submit" class="btn">Next: Setup Database</button></form>';
    echo '</div></body></html>';
    exit;
}

if ($step === 3) {
    echo '<h2>Step 3: Setting up database...</h2>';
    $stepsOk = 0;

    // Connect
    echo '<div class="s">Connecting to database... ';
    try {
        $pdo = new PDO("mysql:host=$DB_HOST;dbname=$DB_NAME;charset=utf8mb4", $DB_USER, $DB_PASS, [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION
        ]);
        echo '<span class="ok">OK</span>';
        $stepsOk++;
    } catch (PDOException $e) {
        echo '<span class="fail">FAILED: ' . htmlspecialchars($e->getMessage()) . '</span>';
        echo '</div><p class="fail">Cannot continue. Check database credentials.</p></div></body></html>';
        exit;
    }
    echo '</div>';

    // Drop existing tables
    echo '<div class="s">Clearing old tables... ';
    try {
        $pdo->exec("SET FOREIGN_KEY_CHECKS=0");
        $tables = $pdo->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
        foreach ($tables as $t) $pdo->exec("DROP TABLE IF EXISTS `$t`");
        $pdo->exec("SET FOREIGN_KEY_CHECKS=1");
        echo '<span class="ok">OK</span> (dropped ' . count($tables) . ')';
        $stepsOk++;
    } catch (PDOException $e) {
        echo '<span class="fail">' . htmlspecialchars($e->getMessage()) . '</span>';
    }
    echo '</div>';

    // Import
    echo '<div class="s">Importing database... ';
    $sqlFile = __DIR__ . '/idotinfra-db.sql';
    if (!file_exists($sqlFile)) {
        echo '<span class="fail">idotinfra-db.sql not found!</span></div>';
    } else {
        try {
            $sql = file_get_contents($sqlFile);
            $sql = str_replace('http://localhost:8082', $SITE_URL, $sql);
            $pdo->exec("SET FOREIGN_KEY_CHECKS=0");
            $statements = preg_split('/;\s*\n/', $sql);
            $exec = 0; $skip = 0;
            foreach ($statements as $s) {
                $s = trim($s);
                if (empty($s) || substr($s, 0, 2) === '--' || substr($s, 0, 2) === '/*') continue;
                try { $pdo->exec($s); $exec++; } catch (PDOException $e) { $skip++; }
            }
            $pdo->exec("SET FOREIGN_KEY_CHECKS=1");
            echo '<span class="ok">OK</span> (' . $exec . ' executed, ' . $skip . ' skipped)';
            $stepsOk++;
        } catch (Exception $e) {
            echo '<span class="fail">' . htmlspecialchars($e->getMessage()) . '</span>';
        }
    }
    echo '</div>';

    // Update URLs
    echo '<div class="s">Setting site URL... ';
    try {
        $pdo->exec("UPDATE wp_options SET option_value='$SITE_URL' WHERE option_name='siteurl'");
        $pdo->exec("UPDATE wp_options SET option_value='$SITE_URL' WHERE option_name='home'");
        echo '<span class="ok">OK</span>';
        $stepsOk++;
    } catch (PDOException $e) {
        echo '<span class="fail">' . htmlspecialchars($e->getMessage()) . '</span>';
    }
    echo '</div>';

    // Set theme
    echo '<div class="s">Activating theme... ';
    try {
        $pdo->exec("UPDATE wp_options SET option_value='idotinfra-theme' WHERE option_name='stylesheet'");
        $pdo->exec("UPDATE wp_options SET option_value='astra' WHERE option_name='template'");
        echo '<span class="ok">OK</span>';
        $stepsOk++;
    } catch (PDOException $e) {
        echo '<span class="fail">' . htmlspecialchars($e->getMessage()) . '</span>';
    }
    echo '</div>';

    // Permalinks
    echo '<div class="s">Setting permalinks... ';
    try {
        $pdo->exec("UPDATE wp_options SET option_value='/%postname%/' WHERE option_name='permalink_structure'");
        echo '<span class="ok">OK</span>';
        $stepsOk++;
    } catch (PDOException $e) {
        echo '<span class="fail">' . htmlspecialchars($e->getMessage()) . '</span>';
    }
    echo '</div>';

    // Reset admin password
    echo '<div class="s">Setting admin credentials... ';
    try {
        if (file_exists(__DIR__ . '/wp-includes/class-phpass.php')) {
            require_once(__DIR__ . '/wp-includes/class-phpass.php');
            $hasher = new PasswordHash(8, true);
            $hash = $hasher->HashPassword('Tarang2026');
        } else {
            $hash = '$P$B' . md5('Tarang2026' . microtime());
        }
        $pdo->exec("UPDATE wp_users SET user_pass='$hash', user_login='admin', user_email='rachitdudhwewala@gmail.com' WHERE ID=1");
        echo '<span class="ok">OK</span>';
        $stepsOk++;
    } catch (Exception $e) {
        echo '<span class="fail">' . htmlspecialchars($e->getMessage()) . '</span>';
    }
    echo '</div>';

    // Activate plugins
    echo '<div class="s">Activating plugins... ';
    try {
        $plugins = serialize(['contact-form-7/wp-contact-form-7.php' => time()]);
        $pdo->exec("UPDATE wp_options SET option_value='a:1:{s:36:\"contact-form-7/wp-contact-form-7.php\";i:1;}' WHERE option_name='active_plugins'");
        echo '<span class="ok">OK</span>';
        $stepsOk++;
    } catch (PDOException $e) {
        echo '<span class="fail">' . htmlspecialchars($e->getMessage()) . '</span>';
    }
    echo '</div>';

    echo '<h2>Result: ' . $stepsOk . '/8 steps done</h2>';

    // Write wp-config.php
    $wpconfig = '<?php
define("DB_NAME","' . $DB_NAME . '");
define("DB_USER","' . $DB_USER . '");
define("DB_PASSWORD","' . $DB_PASS . '");
define("DB_HOST","' . $DB_HOST . '");
define("DB_CHARSET","utf8mb4");
define("DB_COLLATE","");
define("AUTH_KEY","G=-nWN_UzoWP5dRP02@g/eOv=)OD~^%+=C}FkG1@>1UHox?W~6KP*-{Z/)mvr&ZV");
define("SECURE_AUTH_KEY",",6{s$|lcoYG S1WU*{R|h-Ds&NLMd-$=Q9<wm|IEh:AYHPegfU+2OlVd;i`Z!r8>");
define("LOGGED_IN_KEY","N^-~/bcU7A#aT:I.p[PFa,@1!#nF)d$VM.-A9j8r>A1TGIZePBv@q%NTX5[jnDxE");
define("NONCE_KEY","LV.zs8<62|;WMBfkTKep&34#Q+l>9K=kb$p$rL@6leTP4GR<fjl+Gm%L0+wuhV:3");
define("AUTH_SALT","wuMr9{q={wJ>VRR!:L],EE/^+x@2[2|v9[yW)?LdIaAZ~[z|r+KX)}6^(IyR8sDp");
define("SECURE_AUTH_SALT","o-9|aC=KbGhLw.qy$uK%vjjnqyYNExpge|:es*xSNE^r=%f^z.UU4L,-i:($!NI:");
define("LOGGED_IN_SALT","Fbp G:&O%+9}eiejw<TGmBJ_d.)j87i88H+5f(BAp?As6-*Cu+Tke2cl[I?F91mc");
define("NONCE_SALT","r{<CU=P)Nl[uR0t-o(/c]hw)RAN]gx[`o4k>JC&Vfl0Td]?L>@b!Am-;5WYDW@|8");
$table_prefix="wp_";
define("WP_DEBUG",false);
if(!defined("ABSPATH"))define("ABSPATH",__DIR__."/");
require_once ABSPATH."wp-settings.php";';
    file_put_contents(__DIR__ . '/wp-config.php', $wpconfig);

    // Write .htaccess
    $htaccess = "# BEGIN WordPress\n<IfModule mod_rewrite.c>\nRewriteEngine On\nRewriteBase /\nRewriteRule ^index\\.php$ - [L]\nRewriteCond %{REQUEST_FILENAME} !-f\nRewriteCond %{REQUEST_FILENAME} !-d\nRewriteRule . /index.php [L]\n</IfModule>\n# END WordPress";
    file_put_contents(__DIR__ . '/.htaccess', $htaccess);

    // Cleanup
    @unlink(__DIR__ . '/idotinfra-db.sql');

    if ($stepsOk >= 6) {
        echo '<p class="ok">Installation complete!</p>';
        echo '<p><a class="btn" href="' . $SITE_URL . '">View Site</a>';
        echo ' <a class="btn" href="' . $SITE_URL . '/wp-admin/" style="background:#1B3A5C">WP Admin</a></p>';
        echo '<p><strong>Login:</strong> admin / Tarang2026</p>';
        echo '<hr><p style="color:#dc3545"><strong>SECURITY:</strong> Delete this install.php file from File Manager now!</p>';
    } else {
        echo '<p class="fail">Some steps failed. Check errors above. You may need to import the database manually via phpMyAdmin.</p>';
    }
    echo '</div></body></html>';
    exit;
}
?>
</div></body></html>
