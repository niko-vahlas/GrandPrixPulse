<?php
function findgap(){
    // Will report errors if there are any
    ini_set('display_errors', 1);
    ini_set('display_startup_errors', 1);
    error_reporting(E_ALL);

    $servername = "localhost";
    $username = "root";
    $password = ""; 
    $dbname = "f1_database";

    // This creates our connection to the server, we can view the server using the myPHPAdmin link in XAMP
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Checks if we're connected
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

// Retrieve the points gap input
$points_gap = mysqli_real_escape_string($conn, $_POST['points_gap']);

$sql = "SELECT p1.year AS year,
p1.name AS winner_name,
p2.name AS loser_name,
(p1.points - p2.points) AS gap
FROM Team1 p1, Team1 p2
WHERE p1.year = p2.year AND p1.points > p2.points
GROUP BY p1.year
HAVING gap = max(gap) AND gap > $points_gap;;";


$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>Year</th><th>Winning Team</th><th>Runner-Up</th><th>Points Gap</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["year"] . "</td><td>" . $row["winner_name"] . "</td><td>" . $row["loser_name"] . "</td><td>" . $row["gap"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "No data found.";
}

}
findgap();
?>