<?php
/**
 * SAVE TOPOLOGY
 * Saves network topology to database
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

if (!$data || !isset($data['name']) || !isset($data['devices']) || !isset($data['connections'])) {
    $response['message'] = 'Invalid data';
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];
$name = trim($data['name']);
$devices = json_encode($data['devices']);
$connections = json_encode($data['connections']);

// Insert into database
$sql = "INSERT INTO network_topologies (user_id, topology_name, device_data, connection_data, created_at) 
        VALUES (?, ?, ?, ?, NOW())";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('isss', $userId, $name, $devices, $connections);
    
    if ($stmt->execute()) {
        $response['success'] = true;
        $response['message'] = 'Topology saved successfully';
        $response['topology_id'] = $stmt->insert_id;
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