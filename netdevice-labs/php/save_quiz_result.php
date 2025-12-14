<?php
/**
 * SAVE QUIZ RESULT
 * Saves quiz score and updates user statistics
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

if (!$data) {
    $response['message'] = 'Invalid data';
    echo json_encode($response);
    exit();
}

$userId = $_SESSION['user_id'];
$difficulty = $data['difficulty'];
$category = $data['category'];
$score = (int)$data['score'];
$totalQuestions = (int)$data['total_questions'];
$percentage = (float)$data['percentage'];
$timeTaken = (int)$data['time_taken'];

// Insert quiz result
$sql = "INSERT INTO quiz_results (user_id, difficulty, category, score, total_questions, percentage, time_taken, date_taken)
        VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('issiddi', $userId, $difficulty, $category, $score, $totalQuestions, $percentage, $timeTaken);
    
    if ($stmt->execute()) {
        $response['success'] = true;
        $response['message'] = 'Quiz result saved';
        
        // Update user statistics
        updateUserStatistics($link, $userId);
    } else {
        $response['message'] = 'Error saving result: ' . $stmt->error;
    }
    
    $stmt->close();
} else {
    $response['message'] = 'Database error: ' . $link->error;
}

$link->close();
echo json_encode($response);
exit();

/**
 * Update user statistics (total quizzes, average score)
 */
function updateUserStatistics($link, $userId) {
    // Calculate total quizzes and average score
    $statsSql = "SELECT COUNT(*) as total_quizzes, AVG(percentage) as avg_score, SUM(time_taken) as total_time
                 FROM quiz_results
                 WHERE user_id = ?";
    
    if ($statsStmt = $link->prepare($statsSql)) {
        $statsStmt->bind_param('i', $userId);
        $statsStmt->execute();
        $result = $statsStmt->get_result();
        $stats = $result->fetch_assoc();
        
        $totalQuizzes = $stats['total_quizzes'];
        $avgScore = round($stats['avg_score'], 2);
        $totalTime = $stats['total_time'];
        
        // Update or insert into user_statistics
        $updateSql = "INSERT INTO user_statistics (user_id, total_quizzes, avg_score, total_study_time)
                      VALUES (?, ?, ?, ?)
                      ON DUPLICATE KEY UPDATE
                      total_quizzes = ?,
                      avg_score = ?,
                      total_study_time = ?";
        
        if ($updateStmt = $link->prepare($updateSql)) {
            $updateStmt->bind_param('iidiiid', $userId, $totalQuizzes, $avgScore, $totalTime,
                                             $totalQuizzes, $avgScore, $totalTime);
            $updateStmt->execute();
            $updateStmt->close();
        }
        
        $statsStmt->close();
    }
}
?>