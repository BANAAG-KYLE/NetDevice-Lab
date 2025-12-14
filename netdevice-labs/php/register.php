<?php
/**
 * USER REGISTRATION BACKEND
 * Handles user registration requests from register.html
 * Validates input and saves to database
 */

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
$fullName = isset($_POST['fullName']) ? trim($_POST['fullName']) : '';
$username = isset($_POST['username']) ? trim($_POST['username']) : '';
$email = isset($_POST['email']) ? trim($_POST['email']) : '';
$password = isset($_POST['password']) ? $_POST['password'] : '';

// Validate inputs are not empty
if (empty($fullName) || empty($username) || empty($email) || empty($password)) {
    $response['message'] = 'All fields are required';
    echo json_encode($response);
    exit();
}

// Validate full name length
if (strlen($fullName) < 2) {
    $response['message'] = 'Full name must be at least 2 characters';
    echo json_encode($response);
    exit();
}

// Validate username length
if (strlen($username) < 3) {
    $response['message'] = 'Username must be at least 3 characters';
    echo json_encode($response);
    exit();
}

// Validate username format (only letters, numbers, underscore)
if (!preg_match('/^[a-zA-Z0-9_]+$/', $username)) {
    $response['message'] = 'Username can only contain letters, numbers, and underscores';
    echo json_encode($response);
    exit();
}

// Validate email format
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $response['message'] = 'Invalid email address';
    echo json_encode($response);
    exit();
}

// Validate password length
if (strlen($password) < 6) {
    $response['message'] = 'Password must be at least 6 characters';
    echo json_encode($response);
    exit();
}

// Hash the password securely
$passwordHash = password_hash($password, PASSWORD_BCRYPT);

// Prepare SQL statement to prevent SQL injection
$sql = "INSERT INTO users (username, email, password, created_at) VALUES (?, ?, ?, NOW())";

// Create prepared statement
if ($stmt = $link->prepare($sql)) {
    
    // Bind parameters
    $stmt->bind_param('sss', $username, $email, $passwordHash);
    
    // Execute statement
    if ($stmt->execute()) {
        $response['success'] = true;
        $response['message'] = 'Registration successful! Please log in.';
        
        // Get the newly created user ID
        $userId = $stmt->insert_id;
        
        // Create user statistics entry
        $statsSql = "INSERT INTO user_statistics (user_id, total_quizzes, avg_score, total_study_time) VALUES (?, 0, 0.0, 0)";
        if ($statsStmt = $link->prepare($statsSql)) {
            $statsStmt->bind_param('i', $userId);
            $statsStmt->execute();
            $statsStmt->close();
        }
        
    } else {
        // Check if username or email already exists
        if (strpos($stmt->error, 'Duplicate entry') !== false) {
            if (strpos($stmt->error, 'username') !== false) {
                $response['message'] = 'Username already exists. Please choose another.';
            } else {
                $response['message'] = 'Email already registered. Please use another email or login.';
            }
        } else {
            $response['message'] = 'Registration failed: ' . $stmt->error;
        }
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