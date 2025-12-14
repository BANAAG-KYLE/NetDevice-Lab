<?php
/**
 * GET USER STATISTICS - FIXED VERSION
 * Returns user's quiz scores, progress, study time
 */
session_start();
header('Content-Type: application/json');
require_once 'config.php';

$response = array(
    'success' => false,
    'stats' => array(),
    'recent_activity' => array()
);

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    $response['message'] = 'Not logged in';
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];

// Calculate statistics directly from quiz_results table
$sql = "SELECT 
            COUNT(*) as total_quizzes,
            AVG(percentage) as avg_score,
            SUM(time_taken) as total_study_time
        FROM quiz_results
        WHERE user_id = ?";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('i', $userId);
    $stmt->execute();
    $result = $stmt->get_result();
    
    if ($result->num_rows > 0) {
        $data = $result->fetch_assoc();
        $response['stats'] = array(
            'total_quizzes' => (int)$data['total_quizzes'],
            'avg_score' => round((float)$data['avg_score'], 2),
            'total_study_time' => (int)$data['total_study_time']
        );
    } else {
        // No quiz results yet - return defaults
        $response['stats'] = array(
            'total_quizzes' => 0,
            'avg_score' => 0.0,
            'total_study_time' => 0
        );
    }
    $stmt->close();
}

// Get completed tutorials count
$tutorialSql = "SELECT COUNT(*) as count FROM user_progress WHERE user_id = ?";
if ($tutorialStmt = $link->prepare($tutorialSql)) {
    $tutorialStmt->bind_param('i', $userId);
    $tutorialStmt->execute();
    $tutorialResult = $tutorialStmt->get_result();
    $tutorialData = $tutorialResult->fetch_assoc();
    $response['stats']['tutorials_completed'] = (int)$tutorialData['count'];
    $tutorialStmt->close();
}

// Get recent quiz results (last 5)
$recentSql = "SELECT difficulty, category, score, total_questions, percentage, date_taken
              FROM quiz_results
              WHERE user_id = ?
              ORDER BY date_taken DESC
              LIMIT 5";

if ($recentStmt = $link->prepare($recentSql)) {
    $recentStmt->bind_param('i', $userId);
    $recentStmt->execute();
    $recentResult = $recentStmt->get_result();
    
    while ($row = $recentResult->fetch_assoc()) {
        $response['recent_activity'][] = array(
            'type' => 'Quiz',
            'description' => ucfirst($row['difficulty']) . ' ' . ucfirst($row['category']) . 
                           ' - Scored ' . $row['score'] . '/' . $row['total_questions'] . 
                           ' (' . round($row['percentage']) . '%)',
            'date' => date('M j, Y g:i A', strtotime($row['date_taken']))
        );
    }
    $recentStmt->close();
}

// Get recent tutorial completions (last 5)
$tutorialActivitySql = "SELECT tutorial_id, completed_date
                        FROM user_progress
                        WHERE user_id = ?
                        ORDER BY completed_date DESC
                        LIMIT 5";

if ($tutorialActivityStmt = $link->prepare($tutorialActivitySql)) {
    $tutorialActivityStmt->bind_param('i', $userId);
    $tutorialActivityStmt->execute();
    $tutorialActivityResult = $tutorialActivityStmt->get_result();
    
    while ($row = $tutorialActivityResult->fetch_assoc()) {
        $layerNames = array(
            1 => 'Physical Layer',
            2 => 'Data Link Layer',
            3 => 'Network Layer',
            4 => 'Transport Layer',
            5 => 'Session Layer',
            6 => 'Presentation Layer',
            7 => 'Application Layer'
        );
        
        $layerName = isset($layerNames[$row['tutorial_id']]) ? 
                     $layerNames[$row['tutorial_id']] : 
                     'Tutorial ' . $row['tutorial_id'];
        
        $response['recent_activity'][] = array(
            'type' => 'Tutorial',
            'description' => 'Completed ' . $layerName,
            'date' => date('M j, Y g:i A', strtotime($row['completed_date']))
        );
    }
    $tutorialActivityStmt->close();
}

// Sort recent activity by date (most recent first)
usort($response['recent_activity'], function($a, $b) {
    return strtotime($b['date']) - strtotime($a['date']);
});

// Keep only 5 most recent activities
$response['recent_activity'] = array_slice($response['recent_activity'], 0, 5);

$response['success'] = true;
$link->close();

echo json_encode($response);
exit();
?>