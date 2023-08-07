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

// Retrieve the year from the form data
$year = mysqli_real_escape_string($conn, $_POST['year']);

// Retrieve the lap time from the form data
$time = mysqli_real_escape_string($conn, $_POST['time']);

// Retrieve the race circuit name from the form data
$race_circuit_name = mysqli_real_escape_string($conn, $_POST['circuit_name']);



$query = "INSERT INTO Lap_Record_Set (time, circuit_name, driver_name, year) VALUES ('$time', '$race_circuit_name', '$driver_name', $year)";

if (mysqli_query($conn, $query)) {
    echo "New record created successfully";
} else {
    echo "Error: " . $query . "<br>" . mysqli_error($conn);
}

//closes our connection
$conn->close();

?>
