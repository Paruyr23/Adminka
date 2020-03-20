<?php
include 'includes/connect.php';
$id = $_GET['id'];
$categories_id = $_GET['categories_id'];


$select_models = $conn->query("SELECT * FROM `models` WHERE `id`='$id'");
$models_arr = $select_models->fetchAll(PDO::FETCH_ASSOC);

$select_categories = $conn->query("SELECT * FROM `categories`");
$categories_arr = $select_categories->fetchAll(PDO::FETCH_ASSOC);


if (isset($_POST['update'])) {
    if (!empty($_POST['select'])) {

        $name = $_POST['name'];
        $select = $_POST['select'];


        $update = $conn->prepare("UPDATE `models` SET `models_name`='$name',`categories_id`='$select' WHERE `id`='$id'");
        $update->execute();
        header('Location:models.php');
    }
}
if (isset($_POST['cancel'])) {
    header('Location:models.php');
}

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Adminka</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Oxanium&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Trade+Winds&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/admin.css">
    <script src="javascript/jquery.js"></script>
    <script src="javascript/myscripts.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-md bg-light navbar-light">
    <!--     Brand -->
    <a class="navbar-brand" href="#">Adminka</a>

    <!--     Toggler/collapsibe Button -->
    <!--        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">-->
    <!--            <span class="navbar-toggler-icon"></span>-->
    <!--        </button>-->
    <!--         Navbar links -->
    <!--        <div class="collapse navbar-collapse" id="collapsibleNavbar">-->
    <!--            <ul class="navbar-nav">-->
    <!--                <li class="nav-item">-->
    <!--                    <a class="nav-link" href="#">Link</a>-->
    <!--                </li>-->
    <!--                <li class="nav-item">-->
    <!--                    <a class="nav-link" href="#">Link</a>-->
    <!--                </li>-->
    <!--                <li class="nav-item">-->
    <!--                    <a class="nav-link" href="#">Link</a>-->
    <!--                </li>-->
    <!--            </ul>-->
    <!--        </div>-->
</nav>
<div class="divForAllInfo">
    <div class="forLeftBlock col-xl-2">
        <div class="content">
            <img src="images/admin.jpg" alt="">
            <h2>Admin</h2>
            <form method="post" enctype="multipart/form-data">
                <a class="button"  href="logout.php">
                    <img src="images/admin.jpg">
                    <div class="logout">LOGOUT</div>
                </a>
            </form>
        </div>
        <div class="leftBlock">
            <form action="" method="post" enctype="multipart/form-data">
                <div class="categoriesBlock">
                    <a class="categoriesBtn">CATEGORIES</a>
                </div>
                <div class="categoriesBlock">
                    <a class="categoriesBtn">MODELS</a>
                </div>
                <div class="categoriesBlock">
                    <a class="categoriesBtn">PRODUCTS</a>
                </div>
            </form>
        </div>
    </div>
    <div class="forContent col-xl-9">
        <h1>UPDATE MODELS</h1>
        <form action="" method="post">
            <input type="text" name="name" value="<?= $models_arr[0]['models_name'] ?>">
            <select name="select">
                <option>All categories</option>
                <?php foreach ($categories_arr as $item): ?>
                    <option value="<?= $item['id']; ?>" <?php if ($item['id'] == $categories_id) { ?> selected <?php } ?>><?= $item['categories_name']; ?></option>
                <?php endforeach; ?>
            </select>
            <input type="submit" name="update" class="insert" value="UPDATE">
            <input type="submit" name="cancel" class="insert" value="CANCEL">
        </form>
    </div>
</div>
</body>
</html>