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

    <div class="container">
      <div class="row">
        <form action="./selection.php" method="post" class="f1-form">
        <label>Select attributes to show for race car engine manufacturer</label>
          <label for="model">Model: </label>
          <input
            type="checkbox"
            id="model"
            name="model"
            value="checked"
          />
          <label for="company_name">Company Name: </label>
          <input
            type="checkbox"
            id="company_name"
            name="company_name"
            value="checked"
          />
          <label for="engine_model">Filter by engine model: </label>
          <select id="engine_model" name="engine_model" class="textbox">
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

          $sql = "SELECT model FROM Engine_Manufacturer"; // Adjust the query to match your database schema
          $result = $conn->query($sql);
          if ($result->num_rows > 0) {
              while($row = $result->fetch_assoc()) {
                  echo '<option value="' . $row["model"] . '">' . $row["model"] . '</option>';
              }
          } else {
              echo '<option value="">No engine models found</option>';
          }
          ?>
          <input type="submit" value="Submit" class="btn">
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

          if (array_key_exists('engine_model', $_POST) && $_POST['engine_model'] != "") {
            $empty = true;
            $sql = 'SELECT ';
            if (isset($_POST['model']) && $_POST['model'] == 'checked') {
              $sql = $sql . 'model ';
              $empty = false;
              if (isset($_POST['company_name']) && $_POST['company_name'] == 'checked') {
                $sql = $sql . ', ';
              }
            }

            if (isset($_POST['company_name']) && $_POST['company_name'] == 'checked') {
              $sql = $sql . 'company_name';
              $empty = false;
            }

            if (!$empty) {
              $sql = $sql . " FROM engine_manufacturer WHERE model = '" . $_POST['engine_model'] . "'";
              $result = $conn->query($sql);
              $attribute = $result -> fetch_fields();
    
              echo "<table><tr>";
              foreach ($attribute as $val) {
                echo "<td>" . $val -> name . "</td>";
              }
              echo "</tr>";
    
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
          }
          //closes our connection
          $conn->close();

          ?>
        </div>
          <br><br>

        <form action="./selection.php" method="post" class="f1-form">
        <label>Select attributes to show for safety car engine manufacturer</label>
          <label for="model">Model: </label>
          <input
            type="checkbox"
            id="model"
            name="model"
            value="checked"
          />
          <label for="manufacturer">Company Name: </label>
          <input
            type="checkbox"
            id="manufacturer"
            name="manufacturer"
            value="checked"
          />
          <label for="engine_model">Filter by engine model: </label>
          <select id="engine_model" name="engine_model" class="textbox">
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

          $sql = "SELECT model FROM safety_car"; // Adjust the query to match your database schema
          $result = $conn->query($sql);
          if ($result->num_rows > 0) {
              while($row = $result->fetch_assoc()) {
                  echo '<option value="' . $row["model"] . '">' . $row["model"] . '</option>';
              }
          } else {
              echo '<option value="">No engine models found</option>';
          }
          ?>
          <input type="submit" value="Submit" class="btn">
        </form><br><br>
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

          if (array_key_exists('engine_model', $_POST) && $_POST['engine_model'] != "") {
            $empty = true;
            $sql = 'SELECT ';
            if (isset($_POST['model']) && $_POST['model'] == 'checked') {
              $sql = $sql . 'model ';
              $empty = false;
              if (isset($_POST['manufacturer']) && $_POST['manufacturer'] == 'checked') {
                $sql = $sql . ', ';
              }
            }

            if (isset($_POST['manufacturer']) && $_POST['manufacturer'] == 'checked') {
              $sql = $sql . 'manufacturer';
              $empty = false;
            }

            if (!$empty) {
              $sql = $sql . " FROM safety_car WHERE model = '" . $_POST['engine_model'] . "'";
              $result = $conn->query($sql);
              $attribute = $result -> fetch_fields();
    
              echo "<table><tr>";
              foreach ($attribute as $val) {
                echo "<td>" . $val -> name . "</td>";
              }
              echo "</tr>";
    
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
          }
          //closes our connection
          $conn->close();

          ?>
        </div>
      </div>
    </div>
  </body>
</html>