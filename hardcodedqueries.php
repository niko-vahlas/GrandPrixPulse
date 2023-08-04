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
          </ul>
        </div>
      </nav>
    </section>

    <div class="container">
      <div class="row"></div>
      <form method="post">
      <input type="hidden" name="form_name" value="get_drivers_form">
        <div> 
          <?php if($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['form_name'] == 'get_drivers_form'){ require 'drivers_per_team.php'; } ?>
        </div>
        <input type="submit" value="Calculate unqiue driver count per team" class="btn">
    </form>
    </div>
  </body>
</html>