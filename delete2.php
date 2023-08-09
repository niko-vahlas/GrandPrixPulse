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

// Retrieve the engine model from the form data
$engine_model = mysqli_real_escape_string($conn, $_POST['engine_model']);

// SQL query to delete the engine model
$sql = "DELETE FROM Engine_Manufacturer WHERE model = '$engine_model'";

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
