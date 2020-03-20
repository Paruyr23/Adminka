<?php
    session_start();
    include_once "includes/connect.php"
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign In</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Trade+Winds&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-md bg-light navbar-light">
        <!-- Brand -->
        <a class="navbar-brand" href="#">Adminka</a>

        <!-- Toggler/collapsibe Button -->
    <!--    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">-->
    <!--        <span class="navbar-toggler-icon"></span>-->
    <!--    </button>-->

    <!--     Navbar links -->
    <!--    <div class="collapse navbar-collapse" id="collapsibleNavbar">-->
    <!--        <ul class="navbar-nav">-->
    <!--            <li class="nav-item">-->
    <!--                <a class="nav-link" href="#">Link</a>-->
    <!--            </li>-->
    <!--            <li class="nav-item">-->
    <!--                <a class="nav-link" href="#">Link</a>-->
    <!--            </li>-->
    <!--            <li class="nav-item">-->
    <!--                <a class="nav-link" href="#">Link</a>-->
    <!--            </li>-->
    <!--        </ul>-->
    <!--    </div>-->
    </nav>
    <div class="container main">
        <form action="valid_login.php" method="post" enctype="multipart/form-data">
            <h2>Sign in</h2>
            <div class="form-group">
                <label for="name">Login:</label>
                <input type="text" class="form-control" name="login" id="name" placeholder="<?php if (isset($_SESSION["login"])) echo $_SESSION["login"]; ?>">
                <p class="errorText"><?php if (isset($_SESSION["error_in_name"])) echo $_SESSION["error_in_name"]; ?></p>
            </div>
            <div class="form-group">
                <label for="pwd">Password:</label>
                <input type="password"  name="password" class="form-control" id="pwd" placeholder="<?php if (isset($_SESSION["login"])) echo $_SESSION["login"]; ?>">
                <p class="errorText"><?php if (isset($_SESSION["error_in_password"])) echo $_SESSION["error_in_password"]; ?></p>
            </div>
            <div class="checkbox">
                <label><input type="checkbox" name="checkbox"> Remember me</label>
            </div>
            <input type="submit" name="click" class="btn btn-dark" value="LogIn">
            <p class="errorText"><?php if (isset($_SESSION["no_exist"])) echo $_SESSION["no_exist"]; ?></p>
        </form>
    </div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>
</html>

<?php
    session_unset();
    session_destroy();
?>