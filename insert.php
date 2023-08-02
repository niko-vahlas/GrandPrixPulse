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

// Retrieve the driver name from the form data
$driver_name = mysqli_real_escape_string($conn, $_POST['driver_name']);

// Retrieve the teamname from the form data
$team_name = mysqli_real_escape_string($conn, $_POST['team_name']);

// Retrieve the year from the form data
$year = mysqli_real_escape_string($conn, $_POST['year']);

// Retrieve the sponsor name from the form data
$sponsor_name = mysqli_real_escape_string($conn, $_POST['sponsor_name']);

// Retrieve the race circuit name from the form data
$race_circuit_name = mysqli_real_escape_string($conn, $_POST['race_circuit_name']);

// Retrieve the safety car from the form data
$safety_car = mysqli_real_escape_string($conn, $_POST['safety_car']);

// Retrieve the principal name from the form data
$principal_name = mysqli_real_escape_string($conn, $_POST['principal_name']);

// Retrieve the car model from the form data
$car_model = mysqli_real_escape_string($conn, $_POST['car_model']);

// Retrieve the engine model from the form data
$engine_model = mysqli_real_escape_string($conn, $_POST['engine_model']);



// Redirect to index.html once we are done with deletion
if ($conn->query($sql) === TRUE) {
  header("Location: index.html"); 
  exit;
} else {
  echo "Error deleting record: " . $conn->error;
}

//closes our connection
$conn->close();

?>
