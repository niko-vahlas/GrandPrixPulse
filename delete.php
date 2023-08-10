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
?>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="style.css" />
    <script
      src="https://kit.fontawesome.com/f45ab8657f.js"
      crossorigin="anonymous"
    ></script>
    <title>Delete</title>
    <script
      async
      src="https://unpkg.com/es-module-shims@1.6.3/dist/es-module-shims.js"
    ></script>

    <script type="importmap">
      {
        "imports": {
          "three": "https://unpkg.com/three@v0.155.0/build/three.module.js",
          "three/addons/": "https://unpkg.com/three@v0.155.0/examples/jsm/"
        }
      }
    </script>

    <script type="module" src="./main.js"></script>
  </head>
  <body>
    <canvas
      class="render-canvas"
      id="render-canvas"
      style="z-index: 0"
    ></canvas>

    <section id="about-us">
    <nav id="navbar">
        <div class="navbar--container">
          <a class="personal--logo" href="index.html">F1 Records</a>
          <ul class="navbar--list">
            <li>
              <a class="nav--link__anchor" href="delete.php">Delete</a>
            </li>
            <li>
              <a class="nav--link__anchor" href="insert.php">Insert</a>
            </li>
            <li>
              <a class="nav--link__anchor" href="hardcodedqueries.php"
                >Optional Hardcode
              </a>
            </li>
            <li>
              <a class="nav--link__anchor" href="projection.php">
                Projection
              </a>
            </li>
            <li>
              <a class="nav--link__anchor" href="selection.php"> Selection </a>
            </li>
            <li>
              <a class="nav--link__anchor" href="update.php">
                Update
              </a>
            </li>
            <li>
              <a class="nav--link__anchor" href="join.php">
                Join
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </section>

    <?php
    $sql = "SELECT model FROM Engine_Manufacturer"; 
    $result = $conn->query($sql);
    ?>

    <div class="container">
      <div class="row">
        <form action="delete2.php" method="post" class="f1-form">
        <label for="engine_model">Enter the model of the Engine Model to delete:</label>
      <select id="engine_model" name="engine_model" class="textbox">
        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                echo '<option value="' . $row["model"] . '">' . $row["model"] . '</option>';
            }
        } else {
            echo '<option value="">No engines found</option>';
        }
        ?>
      </select>
          <input type="submit" value="Delete" class="btn" />
        </form>
      </div>
    </div>
  </body>
</html>
