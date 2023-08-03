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
              <a class="nav--link__anchor" href="#Languages">Selection</a>
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
      <div class="row"></div>
      <h2>
        <?php
          include 'max-points.php';
          if (isset($_GET['max-points-submit'])) {
            echo getMaxPoints(); 
          }
          
      ?>
      </h2>

      <form action="" name="max-points-submit" method="get">
        <input
          type="submit"
          value="Press here to display the max points "
          class="btn"
        />
      </form>
    </div>
  </body>
</html>
