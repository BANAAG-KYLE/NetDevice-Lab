<?php
/**
 * GET QUIZ QUESTIONS
 * Returns 10 random questions based on difficulty and category
 */

session_start();
header('Content-Type: application/json');
require_once 'config.php';

$response = array('success' => false, 'questions' => array());

// Check if user is logged in
if (!isset($_SESSION['user_id'])) {
    $response['message'] = 'Not logged in';
    echo json_encode($response);
    exit();
}

// Get parameters
$difficulty = isset($_GET['difficulty']) ? $_GET['difficulty'] : '';
$category = isset($_GET['category']) ? $_GET['category'] : '';

// Validate inputs
if (empty($difficulty) || empty($category)) {
    $response['message'] = 'Missing parameters';
    echo json_encode($response);
    exit();
}

// Get 10 random questions
$sql = "SELECT question_id, question_text, option_a, option_b, option_c, option_d, 
               correct_answer, explanation
        FROM quiz_questions
        WHERE difficulty = ? AND category = ?
        ORDER BY RAND()
        LIMIT 10";

if ($stmt = $link->prepare($sql)) {
    $stmt->bind_param('ss', $difficulty, $category);
    $stmt->execute();
    $result = $stmt->get_result();
    
    while ($row = $result->fetch_assoc()) {
        // Format options as array
        $question = array(
            'question_id' => $row['question_id'],
            'question_text' => $row['question_text'],
            'options' => array(
                $row['option_a'],
                $row['option_b'],
                $row['option_c'],
                $row['option_d']
            ),
            'correct_answer' => (int)$row['correct_answer'], // 0-3 for A-D
            'explanation' => $row['explanation']
        );
        
        $response['questions'][] = $question;
    }
    
    $response['success'] = true;
    $stmt->close();
} else {
    $response['message'] = 'Database error: ' . $link->error;
}

$link->close();
echo json_encode($response);
exit();
?>