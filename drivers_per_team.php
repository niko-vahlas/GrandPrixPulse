<?php
function getdrivers(){
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

    $sql = "SELECT team_name, COUNT(driver_name) as driver_count FROM Drives_For GROUP BY team_name";
    $result = $conn->query($sql);

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        echo "Team: " . $row["team_name"] . ", Driver count: " . $row["driver_count"] . "<br>";
    }
} else {
    echo "No data found.";
}
}

getdrivers();
?>
