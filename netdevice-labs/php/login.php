<?php
/**
 * USER LOGIN BACKEND
 * Handles login requests from login.html
 * Verifies credentials and creates session
 */

// Start session to store user data
session_start();

// Set header to return JSON
header('Content-Type: application/json');

// Import database configuration
require_once 'config.php';

// Initialize response array
$response = array(
    'success' => false,
    'message' => ''
);

// Check if form was submitted via POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    $response['message'] = 'Invalid request method';
    echo json_encode($response);
    exit();
}

// Get and trim input values
$username = isset($_POST['username']) ? trim($_POST['username']) : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';
$rememberMe = isset($_POST['rememberMe']) ? $_POST['rememberMe'] : '0';

// Validate inputs are not empty
if (empty($username) || empty($password)) {
    $response['message'] = 'Username and password are required';
    echo json_encode($response);
    exit();
}

// Prepare SQL statement to find user
// User can login with either username OR email
$sql = "SELECT user_id, username, email, password FROM users WHERE username = ? OR email = ?";

if ($stmt = $link->prepare($sql)) {
    
    // Bind parameters
    $stmt->bind_param('ss', $username, $username);
    
    // Execute statement
    $stmt->execute();
    
    // Get result
    $result = $stmt->get_result();
    
    // Check if user exists
    if ($result->num_rows === 1) {
        
        // Get user data
        $user = $result->fetch_assoc();
        
        // Verify password using password_verify (matches bcrypt hash)
        if (password_verify($password, $user['password'])) {
            
            // Password is correct! Create session
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['email'] = $user['email'];
            $_SESSION['login_time'] = time();
            
            // Update last login in database
            $updateSql = "UPDATE users SET created_at = NOW() WHERE user_id = ?";
            if ($updateStmt = $link->prepare($updateSql)) {
                $updateStmt->bind_param('i', $user['user_id']);
                $updateStmt->execute();
                $updateStmt->close();
            }
            
            // Optional: Set remember me cookie (30 days)
            if ($rememberMe === '1') {
                $cookieValue = $user['user_id'] . '|' . $user['username'];
                setcookie('netdevice_remember', $cookieValue, time() + (30 * 24 * 60 * 60), '/');
            }
            
            // Login successful
            $response['success'] = true;
            $response['message'] = 'Login successful!';
            $response['user_id'] = $user['user_id'];
            $response['username'] = $user['username'];
            
        } else {
            // Password is incorrect
            $response['message'] = 'Incorrect password. Please try again.';
        }
        
    } else {
        // User not found
        $response['message'] = 'Username or email not found. Please check or register.';
    }
    
    // Close statement
    $stmt->close();
    
} else {
    $response['message'] = 'Database error: ' . $link->error;
}

// Close database connection
$link->close();

// Return JSON response
echo json_encode($response);
exit();
?>