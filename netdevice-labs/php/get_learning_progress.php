<?php
/**
 * GET LEARNING PROGRESS
 * Returns user's progress in learning modules
 */

session_start();
header('Content-Type: application/json');
require_once 'config.php';

$response = array(
    'success' => false,
    'tutorials_completed' => 0,
    'topologies_saved' => 0
);

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];

// Get completed tutorials count
$tutorialSql = "SELECT COUNT(*) as count FROM user_progress WHERE user_id = ?";
if ($stmt = $link->prepare($tutorialSql)) {
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();
    $response['tutorials_completed'] = $data['count'];
    $stmt->close();
}

// Get saved topologies count
$topoSql = "SELECT COUNT(*) as count FROM network_topologies WHERE user_id = ?";
if ($stmt = $link->prepare($topoSql)) {
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = $result->fetch_assoc();
    $response['topologies_saved'] = $data['count'];
    $stmt->close();
}

$response['success'] = true;
$link->close();

echo json_encode($response);
exit();
?>