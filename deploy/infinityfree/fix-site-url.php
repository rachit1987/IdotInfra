<?php
/**
 * ONE-TIME FIX: Fix site URL for idotinfra.infinityfree.me
 *
 * UPLOAD this file to htdocs/ (same folder as wp-config.php)
 * Visit: http://idotinfra.infinityfree.me/fix-site-url.php
 * Then DELETE this file!
 */

$CORRECT_URL = 'http://idotinfra.infinityfree.me';

// Don't run if wp-config doesn't exist (wrong folder)
if (!file_exists(__DIR__ . '/wp-config.php')) {
    die('Upload this file to htdocs/ (where wp-config.php is) and try again.');
}

// Read DB credentials from wp-config.php
$config = file_get_contents(__DIR__ . '/wp-config.php');
preg_match("/define\s*\(\s*['\"]DB_NAME['\"]\s*,\s*['\"]([^'\"]+)['\"]/", $config, $m);
$DB_NAME = $m[1] ?? '';
preg_match("/define\s*\(\s*['\"]DB_USER['\"]\s*,\s*['\"]([^'\"]+)['\"]/", $config, $m);
$DB_USER = $m[1] ?? '';
preg_match("/define\s*\(\s*['\"]DB_PASSWORD['\"]\s*,\s*['\"]([^'\"]*)['\"]/", $config, $m);
$DB_PASS = $m[1] ?? '';
preg_match("/define\s*\(\s*['\"]DB_HOST['\"]\s*,\s*['\"]([^'\"]+)['\"]/", $config, $m);
$DB_HOST = $m[1] ?? '';

if (!$DB_NAME || !$DB_USER || !$DB_HOST) {
    die('Could not read DB credentials from wp-config.php');
}

// Get table prefix
$table_prefix = 'wp_';
if (preg_match('/\$table_prefix\s*=\s*[\'"]([^\'"]+)[\'"]/', $config, $m)) {
    $table_prefix = $m[1];
}

$options_table = $table_prefix . 'options';

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html>
<head><title>Fix Site URL</title>
<style>
body{font-family:-apple-system,sans-serif;max-width:600px;margin:40px auto;padding:20px;background:#f5f5f5}
.box{background:#fff;border-radius:8px;padding:30px;box-shadow:0 2px 8px rgba(0,0,.1)}
h1{color:#1B3A5C;margin-top:0}
.ok{color:#28a745;font-weight:700}
.fail{color:#dc3545}
.warn{background:#fff3cd;padding:12px;border-radius:6px;margin:16px 0}
</style>
</head>
<body><div class="box">
<h1>I-Dot Infra — Fix Site URL</h1>
<?php
try {
    $pdo = new PDO(
        "mysql:host=$DB_HOST;dbname=$DB_NAME;charset=utf8mb4",
        $DB_USER, $DB_PASS,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );

    // Update siteurl and home
    $stmt = $pdo->prepare("UPDATE $options_table SET option_value = ? WHERE option_name = ?");
    $stmt->execute([$CORRECT_URL, 'siteurl']);
    $siteurlUpdated = $stmt->rowCount();
    $stmt->execute([$CORRECT_URL, 'home']);
    $homeUpdated = $stmt->rowCount();

    echo '<p class="ok">✓ Done! Site URL is now: <strong>' . htmlspecialchars($CORRECT_URL) . '</strong></p>';
    echo '<p>Rows updated: siteurl=' . $siteurlUpdated . ', home=' . $homeUpdated . '</p>';
    echo '<p><a href="' . $CORRECT_URL . '" style="display:inline-block;background:#F37021;color:#fff;padding:12px 24px;border-radius:6px;text-decoration:none;font-weight:700">Visit your site</a></p>';
    echo '<div class="warn"><strong>IMPORTANT:</strong> Delete this file (fix-site-url.php) from File Manager now!</div>';
} catch (PDOException $e) {
    echo '<p class="fail">Database error: ' . htmlspecialchars($e->getMessage()) . '</p>';
    echo '<p>Check that wp-config.php has the correct DB credentials from your InfinityFree cPanel.</p>';
}
?>
</div></body></html>
