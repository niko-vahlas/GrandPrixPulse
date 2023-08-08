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

    $year = mysqli_real_escape_string($conn, $_POST['year']);
    

    $sql = "
    SELECT r.p1 AS driver, COUNT(*) as wins_without_top3_qualification
FROM Race1 r
WHERE r.p1 NOT IN (r.qp1, r.qp2, r.qp3)
AND r.year = $year
AND r.p1 NOT IN (
    SELECT sc.driver_name
    FROM Season_Champion sc
    WHERE sc.year = $year
)
GROUP BY r.p1;

";


$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "Driver: " . $row['driver'] . " - Wins without Top 3 Qualification: " . $row['wins_without_top3_qualification'] . "<br>";
    }
} else {
    echo "0 results";
}


$conn->close();

?>
