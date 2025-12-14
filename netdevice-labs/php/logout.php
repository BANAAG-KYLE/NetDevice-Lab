<?php
/**
 * USER LOGOUT
 * Destroys session and redirects to home
 */

// Start session
session_start();

// Destroy all session data
session_destroy();

// Delete remember me cookie if exists
if (isset($_COOKIE['netdevice_remember'])) {
    setcookie('netdevice_remember', '', time() - 3600, '/');
}

// Redirect to home page
header('Location: ../index.html');
exit();
?>