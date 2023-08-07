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
$points_gap = mysqli_real_escape_string($conn, $_POST['points_gap']);

$sql = "SELECT t1.name AS team_name
FROM Team1 t1
WHERE NOT EXISTS (
    SELECT s.year
    FROM Season s
    WHERE NOT EXISTS (
        SELECT *
        FROM Team1 t2
        WHERE t2.name = t1.name AND t2.year = s.year
    )
)
GROUP BY t1.name;";


$result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "Team: " . $row["team_name"] . "<br>";
    }
} else {
    echo "No data found.";
}

?>