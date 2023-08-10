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

    <title>Harcoded Queries</title>
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
    <canvas class="render-canvas" id="render-canvas" style="z-index: -1;"></canvas>

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

    <div class="container">
      <div class="row">
        <!--Aggregation with group by-->
      <form method="post" class="f1-form">
      <input type="hidden" name="form_name" value="get_drivers_form">
        <div> 
          <?php if($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['form_name'] == 'get_drivers_form'){ require 'drivers_per_team.php'; } ?>
        </div>
        <input type="submit" value="Calculate unqiue driver count per team" class="btn">
    </form>
<!--Aggregation with having-->
    <form method="post" class="f1-form">
      <input type="hidden" name="form_name" value="points_gap_form">
        <label for="points_gap">Points gap between first and second:</label>
          <input
            type="text"
            id="points_gap"
            name="points_gap"
            class="textbox"
          />
          <div> 
          <?php if($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['form_name'] == 'points_gap_form'){ require 'points_gap_form.php'; } ?>
        </div>
        <input type="submit" value="Find dominant winners" class="btn">
    </form>
      <!--divison-->
      <form method="post" class="f1-form">
      <input type="hidden" name="form_name" value="unique_teams_form">
        <label for="unique_teams">Find teams that have raced in every season:</label>
          <div> 
          <?php if($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['form_name'] == 'unique_teams_form'){ require 'unique_teams.php'; } ?>
        </div>
        <input type="submit" value="Get teams" class="btn">
    </form>
    </div>
      <!--Nested Aggregation with group by-->
      <form method="post" class="f1-form">
          <input type="hidden" name="form_name" value="non_top3_winners.php">
          <label for="non_top3">Enter year to view drivers who didn't win the championship that season but won a race without qualifying in the top 3:</label>

          <input type="text" class="textbox" name="year" id="year" required>
          <div> 
              <?php if ($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['form_name'] == 'non_top3_winners.php') { require 'non_top3_winners.php'; } ?>
          </div>
          <input type="submit" value="Find driver counts for entered year" class="btn">
      </form>
    </div>
  </body>
</html>
