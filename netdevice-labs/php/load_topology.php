<?php
/**
 * LOAD TOPOLOGY
 * Loads a specific topology by ID
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

// Get topology ID
$topologyId = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($topologyId <= 0) {
    $response['message'] = 'Invalid topology ID';
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];

// Get topology data
$sql = "SELECT device_data, connection_data 
        FROM network_topologies 
        WHERE topology_id = ? AND user_id = ?";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('ii', $topologyId, $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        $response['success'] = true;
        $response['devices'] = json_decode($row['device_data'], true);
        $response['connections'] = json_decode($row['connection_data'], true);
    } else {
        $response['message'] = 'Topology not found';
    }
    
    $stmt->close();
} else {
    $response['message'] = 'Database error';
}

$link->close();
echo json_encode($response);
exit();
?>