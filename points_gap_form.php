<?php
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
$threshold = mysqli_real_escape_string($conn, $_POST['threshold']);

$sql = "SELECT t1.name AS team_name,
SUM(t1.points) AS total_points
FROM Team1 t1
GROUP BY t1.name
HAVING total_points > $threshold;
";


$result = $conn->query($sql);

if ($result->num_rows > 0) {
    echo "<table border='1'><tr><th>Team</th><th>Total Points</th></tr>";
    while ($row = $result->fetch_assoc()) {
        echo "<tr><td>" . $row["team_name"] . "</td><td>" . $row["total_points"] . "</td></tr>";
    }
    echo "</table>";
} else {
    echo "No data found.";
}

?>