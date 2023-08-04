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
  </head>
  <body>
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
                >Hardcoded Queries
              </a>
            </li>
            <li>
              <a class="nav--link__anchor" href="#Languages">Projection</a>
            </li>
            <li>
              <a class="nav--link__anchor" href="#Languages">Join</a>
            </li>
          </ul>
        </div>
      </nav>
    </section>

    <div class="container">
      <div class="row">
        <form action="projSel.php" method="post" class="f1-form">
            <label>Check the attributes to retrieve from teams: </label>
            <label for="name">Team name</label>
            <input
            type="checkbox"
            id="name"
            name="name"
            value="checked"
            />
            <label for="name">Year</label>
            <input
            type="checkbox"
            id="year"
            name="year"
            value="checked"
            />
            <label for="name">Constructor Points</label>
            <input
            type="checkbox"
            id="points"
            name="points"
            value="checked"
            />
            <label for="name">Car model</label>
            <input
            type="checkbox"
            id="car_model"
            name="car_model"
            value="checked"
            />
            <label for="name">Team Principal Name</label>
            <input
            type="checkbox"
            id="principal_name"
            name="principal_name"
            value="checked"
            />
          <input type="submit" value="Get Attributes" class="btn" />
        </form>
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

          echo "<table><tr>";
          
          // check which boxes are checked and construct query
          $empty = true;
          $sql = 'SELECT ';
          if (isset($_POST['name']) && $_POST['name'] == 'checked') {
            $sql = $sql . "name, ";
            $empty = false;
            echo "<th>Team name: </th>";
          }
          if (isset($_POST['year']) && $_POST['year'] == 'checked') {
            $sql = $sql . "year, ";
            $empty = false;
            echo "<th>Year: </th>";
          }
          if (isset($_POST['points']) && $_POST['points'] == 'checked') {
            $sql = $sql . "points, ";
            $empty = false;
            echo "<th>Points: </th>";
          }
          if (isset($_POST['car_model']) && $_POST['car_model'] == 'checked') {
            $sql = $sql . "car_model, ";
            $empty = false;
            echo "<th>Car Model: </th>";
          }
          if (isset($_POST['principal_name']) && $_POST['principal_name'] == 'checked') {
            $sql = $sql . "principal_name, ";
            $empty = false;
            echo "<th>Team Principal Name: </th>";
          }

          echo "</tr>";

          if ($empty) {
            exit;
          }

          $sql = substr($sql, 0, -2) . ' FROM team1';
          $result = $conn->query($sql);
          
          while($row = mysqli_fetch_array($result)){ 
              // mysqli_fetch_array fetches one row at a time, loop thru all rows of result
              echo "<tr>";
              if (isset($_POST['name']) && $_POST['name'] == 'checked') {
                echo "<td>" . htmlspecialchars($row['name']) . "</td>";
              }
              if (isset($_POST['year']) && $_POST['year'] == 'checked') {
                echo "<td>" . htmlspecialchars($row['year']) . "</td>";
              }
              if (isset($_POST['points']) && $_POST['points'] == 'checked') {
                echo "<td>" . htmlspecialchars($row['points']) . "</td>";
              }
              if (isset($_POST['car_model']) && $_POST['car_model'] == 'checked') {
                echo "<td>" . htmlspecialchars($row['car_model']) . "</td>";
              }
              if (isset($_POST['principal_name']) && $_POST['principal_name'] == 'checked') {
                echo "<td>" . htmlspecialchars($row['principal_name']) . "</td>";
              }
              echo "</tr>";
          }

          // Redirect to index.html once we are done
          // header("Location: index.html"); 

          //closes our connection
          $conn->close();

          ?>
        </div>
      </div>
    </div>
  </body>
</html>