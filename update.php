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
            <li>
              <a class="nav--link__anchor" href="update.php">
                Update
              </a>
            </li>
          </ul>
        </div>
      </nav>
    </section>

    <div class="container">
      <div class="row">
        <form action="./update.php" method="post" class="f1-form">
          Update engine manufacturer attributes - enter engine model key: <br>
          <input
            type="text"
            id="model"
            name="model"
            class="textbox"
          />
          <br><br>Leave text box empty to preserve previous value
        <label for="table">Enter new model: </label>
          <input
            type="text"
            id="model_new"
            name="model_new"
            class="textbox"
          />
          <label for="attributes">Enter new company name: </label>
          <input
            type="text"
            id="company_name"
            name="company_name"
            class="textbox"
          />
          <input type="submit" value="Submit">
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

          $sql = "UPDATE engine_manufacturer SET ";
          if (isset($_POST['model_new'])) {
            $sql = $sql . "model = '" . $_POST['model_new'] . "'";
            if (isset($_POST['company_name'])) {
              $sql = $sql . ', ';
            }
          }
          if (isset($_POST['company_name'])) {
            $sql = $sql . "company_name = '" . $_POST['company_name'] . "'";
          }

          $sql = $sql . " WHERE model = '" . $_POST['model'] . "';";

          try {
            $result = $conn->query($sql);
          } catch (mysqli_sql_exception $e) {
            echo "Invalid input: " . $e->getMessage();
            exit;
          }

          //closes our connection
          $conn->close();

          ?>
        </div>
      </div>
    </div>
  </body>
</html>