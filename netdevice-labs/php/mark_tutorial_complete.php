<?php
/**
 * MARK TUTORIAL AS COMPLETE
 * Saves that user completed a specific OSI layer tutorial
 */

session_start();
header('Content-Type: application/json');
require_once 'config.php';

$response = array('success' => false, 'message' => '');

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    $response['message'] = 'Not logged in';
    echo json_encode($response);
    exit();
}

// Get JSON data
$json = file_get_contents('php://input');
$data = json_decode($json, true);

if (!$data || !isset($data['layer'])) {
    $response['message'] = 'Invalid data';
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];
$layer = (int)$data['layer'];

// Validate layer (must be 1-7 for OSI model)
if ($layer < 1 || $layer > 7) {
    $response['message'] = 'Invalid layer number';
    echo json_encode($response);
    exit();
}

// Check if already completed
$checkSql = "SELECT progress_id FROM user_progress 
             WHERE user_id = ? AND tutorial_id = ?";

if ($checkStmt = $link->prepare($checkSql)) {
    $checkStmt->bind_param('ii', $userId, $layer);
    $checkStmt->execute();
    $checkResult = $checkStmt->get_result();
    
    if ($checkResult->num_rows > 0) {
        // Already completed
        $response['success'] = true;
        $response['message'] = 'Already completed';
        $checkStmt->close();
        $link->close();
        echo json_encode($response);
        exit();
    }
    $checkStmt->close();
}

// Insert completion record
$sql = "INSERT INTO user_progress (user_id, tutorial_id, completed_date) 
        VALUES (?, ?, NOW())";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('ii', $userId, $layer);
    
    if ($stmt->execute()) {
        $response['success'] = true;
        $response['message'] = 'Tutorial marked as complete';
        
        // Update user statistics
        $updateSql = "UPDATE user_statistics 
                      SET tutorials_completed = (
                          SELECT COUNT(*) FROM user_progress 
                          WHERE user_id = ? AND tutorial_id BETWEEN 1 AND 7
                      )
                      WHERE user_id = ?";
        
        if ($updateStmt = $link->prepare($updateSql)) {
            $updateStmt->bind_param('ii', $userId, $userId);
            $updateStmt->execute();
            $updateStmt->close();
        }
    } else {
        $response['message'] = 'Database error: ' . $stmt->error;
    }
    
    $stmt->close();
} else {
    $response['message'] = 'Database error: ' . $link->error;
}

$link->close();
echo json_encode($response);
exit();
?>