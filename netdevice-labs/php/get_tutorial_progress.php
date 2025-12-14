<?php
/**
 * GET TUTORIAL PROGRESS
 * Returns which OSI layer tutorials the user has completed
 */

session_start();
header('Content-Type: application/json');
require_once 'config.php';

$response = array(
    'success' => false,
    'completed' => array()
);

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];

// Get completed tutorials (OSI layers 1-7)
$sql = "SELECT tutorial_id FROM user_progress 
        WHERE user_id = ? AND tutorial_id BETWEEN 1 AND 7";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    while ($row = $result->fetch_assoc()) {
        $response['completed'][] = (int)$row['tutorial_id'];
    }
    
    $response['success'] = true;
    $stmt->close();
}

$link->close();
echo json_encode($response);
exit();
?>