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
    <canvas class="render-canvas" id="render-canvas"></canvas>

    <section id="about-us">
    <nav id="navbar">
        <div class="navbar--container">
          <a class="personal--logo" href="index.html">F1 Records</a>
          <ul class="navbar--list">
            <li>
              <a class="nav--link__anchor" href="delete.php">Delete</a>
            </li>
            <li>
              <a class="nav--link__anchor" href="insert.html">Insert</a>
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
              <a class="nav--link__anchor" href="selection.php">
                Selection
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

    <div class="container">
      <div class="row">
        <form action="join.php" method="post" class="f1-form">
            <label>Display race car engines and safety cars from the same manufacturer</label>
            <label for="name">Manufacturer name: </label>
            <select id="manufacturer" name="manufacturer" class="textbox">
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

            $elements = array();

            $empty = true;
            $sql = "SELECT company_name FROM Engine_Manufacturer"; 
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                  if (!in_array($row["company_name"], $elements)) {
                    array_push($elements, $row["company_name"]);
                    echo '<option value="' . $row["company_name"] . '">' . $row["company_name"] . '</option>';
                  }
                }
                $empty = false;
            } 

            $sql = "SELECT manufacturer FROM safety_car";
            $result = $conn->query($sql);
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                  if (!in_array($row["manufacturer"], $elements)) {
                    array_push($elements, $row["manufacturer"]);
                    echo '<option value="' . $row["manufacturer"] . '">' . $row["manufacturer"] . '</option>';
                  }
                }
                $empty = false;
            }
            if ($empty) {
                echo '<option value="">No engines found</option>';
            }
            ?>
            </select>
            <input type="submit" value="Get Attributes" class="btn" />
        </form>
        <br><br>
        <div style="color: white">
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

          
          if (array_key_exists('manufacturer', $_POST) && $_POST['manufacturer'] != "") {
            $empty = true;
            $sql = "SELECT c.model, c.company_name, s.model, s.manufacturer FROM safety_car s, engine_manufacturer c WHERE c.company_name = s.manufacturer and s.manufacturer = '" . $_POST['manufacturer'] . "'";
            $result = $conn->query($sql);

            echo "<table><tr><td>Race car engine model</td><td>Race car company</td></td><td>Safety car model</td></td><td>Safety car manufacturer</td></tr>";
            
            while($row = mysqli_fetch_row($result)){ 
                // mysqli_fetch_row fetches one row at a time, loop thru all rows of result
                echo "<tr>";
                foreach ($row as $element) {
                  echo "<td>" . $element . "</td>";
                }
                echo "</tr>";
            }

            echo "</table>";
          }

          //closes our connection
          $conn->close();

          ?>
        </div>
      </div>
    </div>
  </body>
</html>