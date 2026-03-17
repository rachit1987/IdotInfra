<?php
/**
 * I-Dot Infra -- Extract All Parts
 * 
 * Upload ALL zip files + this PHP file to htdocs/ via File Manager.
 * Then visit: http://idotinfra.infinityfreeapp.me/extract-all.php
 */
set_time_limit(300);
?>
<!DOCTYPE html>
<html>
<head><title>IdotInfra Extraction</title>
<style>
body{font-family:sans-serif;max-width:700px;margin:40px auto;padding:20px;background:#f5f5f5}
.card{background:white;border-radius:8px;padding:30px;box-shadow:0 2px 8px rgba(0,0,0,0.1)}
h1{color:#1B3A5C}
.ok{color:#28a745;font-weight:bold}
.fail{color:#dc3545;font-weight:bold}
.btn{display:inline-block;background:#F37021;color:white;padding:12px 24px;border-radius:6px;text-decoration:none;font-weight:bold;border:none;cursor:pointer;font-size:16px;margin-top:15px}
.step{padding:8px 0;border-bottom:1px solid #eee}
</style>
</head>
<body><div class="card">
<h1>I-Dot Infra -- Extract Files</h1>
<?php
if (!isset($_GET['run'])) {
    $zips = glob(__DIR__ . '/part*.zip');
    echo '<p>Found <strong>' . count($zips) . '</strong> zip parts to extract:</p><ul>';
    foreach ($zips as $z) echo '<li>' . basename($z) . ' (' . round(filesize($z)/1024/1024, 1) . ' MB)</li>';
    echo '</ul>';
    echo '<form method="get"><input type="hidden" name="run" value="1">';
    echo '<button type="submit" class="btn">Extract All</button></form>';
    echo '</div></body></html>';
    exit;
}

$zips = glob(__DIR__ . '/part*.zip');
sort($zips);
$ok = 0;

foreach ($zips as $zipFile) {
    $name = basename($zipFile);
    echo '<div class="step">Extracting ' . $name . '... ';
    $zip = new ZipArchive;
    if ($zip->open($zipFile) === TRUE) {
        $zip->extractTo(__DIR__);
        $zip->close();
        echo '<span class="ok">OK</span> (' . $zip->numFiles . ' files)';
        unlink($zipFile);
        $ok++;
    } else {
        echo '<span class="fail">FAILED</span>';
    }
    echo '</div>';
    flush();
}

echo '<h2>Extracted ' . $ok . '/' . count($zips) . ' parts</h2>';

if ($ok === count($zips) || $ok > 0) {
    echo '<p class="ok">Files extracted! Now run the database setup:</p>';
    echo '<p><a class="btn" href="/idotinfra-setup.php">Run Database Setup</a></p>';
} else {
    echo '<p class="fail">Extraction failed. Check file permissions.</p>';
}
?>
</div></body></html>
