<?php

function getMaxPoints() {
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



// SQL query to get max career points
$sql = "SELECT MAX(career_points) AS max_points FROM Driver";
$results = $conn->query($sql);

//closes our connection
$conn->close();

return $results;



}

?>
