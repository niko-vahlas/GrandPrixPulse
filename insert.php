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
              <a class="nav--link__anchor" href="update.php"> Update </a>
            </li>
            <li>
              <a class="nav--link__anchor" href="join.php"> Join </a>
            </li>
          </ul>
        </div>
      </nav>
    </section>

    <div class="container">
      <div class="row">
        <form action="insert2.php" method="post" class="f1-form">
          <label for="name">Enter the name of the driver who set the record:</label>
          <select id="name" name="name" class="textbox">
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

          $sql = "SELECT name FROM driver"; 
          $result = $conn->query($sql);
          if ($result->num_rows > 0) {
              while($row = $result->fetch_assoc()) {
                echo '<option value="' . $row["name"] . '">' . $row["name"] . '</option>';
              }
          } 
          ?>
          </select>

          <label for="circuit_name">Enter the name of the circuit:</label>
          <input
            type="text"
            id="circuit_name"
            name="circuit_name"
            class="textbox"
          />

          <label for="time">Enter the lap time (00:00:000):</label>
          <input type="text" id="time" name="time" class="textbox" />

          <label for="year">Enter the year:</label>
          <input type="text" id="year" name="year" class="textbox" />

          <input type="submit" value="Insert" class="btn" />
        </form>
      </div>
    </div>
  </body>
</html>
