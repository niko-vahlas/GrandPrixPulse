<?php
// Connect to your database. Replace dbname, host, username and password with your real info
$dbh = new PDO('mysql:dbname=f1_database;host=localhost', 'root', 'root');

// if ($_SERVER['REQUEST_METHOD'] === 'POST') {
//     // Prepare delete statement
//     $stmt = $dbh->prepare("DELETE FROM Engine_Manufacturer WHERE model = :model");
    
//     // Bind the user input to the statement and execute
//     $stmt->bindParam(':model', $_POST['engine_model']);
//     $stmt->execute();
    
//     echo "Engine Manufacturer deleted successfully";
?>