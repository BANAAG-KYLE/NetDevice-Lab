<?php
// This line imports your settings. Without it, the code doesn't know what DB_NAME is.
require_once "config.php"; 

if($link){
    echo "<h1>✅ Connection Successful!</h1>";
    echo "<p>Connected to database: " . DB_NAME . "</p>";
} else {
    echo "<h1>❌ Connection Failed</h1>";
}
?>