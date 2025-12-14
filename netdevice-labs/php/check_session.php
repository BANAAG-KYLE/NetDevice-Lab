<?php
/**
 * CHECK SESSION
 * Returns whether user is logged in or not
 */

session_start();
header('Content-Type: application/json');

$response = array(
    'loggedIn' => false,
    'userId' => null,
    'username' => null,
    'email' => null
);

// Check if user_id exists in session
if (isset($_SESSION['user_id']) && !empty($_SESSION['user_id'])) {
    $response['loggedIn'] = true;
    $response['userId'] = $_SESSION['user_id'];
    $response['username'] = $_SESSION['username'] ?? 'User';
    $response['email'] = $_SESSION['email'] ?? '';
}

echo json_encode($response);
exit();
?>