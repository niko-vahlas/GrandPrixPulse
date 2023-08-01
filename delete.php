<?php

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$servername = "localhost";
$username = "root";
$password = ""; 
$dbname = "f1_database";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

// Retrieve the engine model from the form data
$engine_model = mysqli_real_escape_string($conn, $_POST['engine_model']);

// SQL query to delete the record
$sql = "DELETE FROM Engine_Manufacturer WHERE model = '$engine_model'";

if ($conn->query($sql) === TRUE) {
  header("Location: index.html"); // Redirect to index.html
  exit;
} else {
  echo "Error deleting record: " . $conn->error;
}

$conn->close();

?>
