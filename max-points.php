<?php
function getMaxPoints(){
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

    $sql = "SELECT MAX(career_points) FROM Driver";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
            echo $row["MAX(career_points)"];
        
    } else {
        echo "0 results";
    }
    $conn->close();
}

getMaxPoints();
?>
