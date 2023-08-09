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
              <a class="nav--link__anchor" href="delete.html">Delete</a>
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
          </ul>
        </div>
      </nav>
    </section>

    <div class="container">
      <div class="row">
        <form action="./selection.php" method="post" class="f1-form">
        <label for="table">Enter table name: </label>
          <input
            type="text"
            id="table"
            name="table"
            class="textbox"
            required
          />
          <label for="attributes">Enter attribute names separated by commas: </label>
          <input
            type="text"
            id="attributes"
            name="attributes"
            class="textbox"
          />
          <label for="conditions">Enter conditions: </label>
          <input
            type="text"
            id="conditions"
            name="conditions"
            class="textbox"
          />
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
          
          // construct query using input
          if (!isset($_POST['attributes']) || !isset($_POST['table']) || !isset($_POST['conditions'])) {
            exit;
          }
          $sql = 'SELECT ' . $_POST['attributes'] . ' FROM ' . $_POST['table'] . ' WHERE ' . $_POST['conditions'];

          try {
            $result = $conn->query($sql);
          } catch (mysqli_sql_exception $e) {
            echo "Invalid input: " . $e->getMessage();
            exit;
          }

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

          //closes our connection
          $conn->close();

          ?>
        </div>
      </div>
    </div>
  </body>
</html>