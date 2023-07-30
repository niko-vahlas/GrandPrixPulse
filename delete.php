<?php
// Connect to your database. Replace dbname, host, username and password with your real info
$dbh = new PDO('mysql:unix_socket=/Applications/XAMPP/xamppfiles/var/mysql/mysql.sock;dbname=f1_database', 'root', '');



if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Prepare delete statement
    $stmt = $dbh->prepare("DELETE FROM Engine_Manufacturer WHERE model = :model");
    
    // Bind the user input to the statement and execute
    $stmt->bindParam(':model', $_POST['engine_model']);
    $stmt->execute();
    
    echo "Engine Manufacturer deleted successfully";
}
?>