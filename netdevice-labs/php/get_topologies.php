<?php
/**
 * GET TOPOLOGIES
 * Returns list of user's saved topologies
 */

session_start();
header('Content-Type: application/json');
require_once 'config.php';

$response = array('success' => false, 'topologies' => array());

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];

// Get user's topologies
$sql = "SELECT topology_id, topology_name, created_at 
        FROM network_topologies 
        WHERE user_id = ? 
        ORDER BY created_at DESC";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    while ($row = $result->fetch_assoc()) {
        $row['created_at'] = date('M j, Y g:i A', strtotime($row['created_at']));
        $response['topologies'][] = $row;
    }
    
    $response['success'] = true;
    $stmt->close();
}

$link->close();
echo json_encode($response);
exit();
?>