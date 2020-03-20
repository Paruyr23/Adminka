<?php
require "includes/connect.php";

$id = $_GET['id'];
$categories_id = $_GET['categories_id'];
$models_id = $_GET['models_id'];

$select_categories = $conn->query("SELECT * FROM `categories`");
$select_categories->execute();
$categories_arr = $select_categories->fetchAll(PDO::FETCH_ASSOC);

$models_category = $conn->query("SELECT * FROM `models`");
$models_category->execute();
$models_arr = $models_category->fetchAll(PDO::FETCH_ASSOC);

$products_category = $conn->query("SELECT * FROM `products` WHERE `id`='$id'");
$products_category->execute();
$products_arr = $products_category->fetchAll(PDO::FETCH_ASSOC);


if (isset($_POST['update'])) {
    if (!empty($_POST['categories_select']) && !empty($_POST['models_select'])) {

        $name = $_POST['update_name'];
        $categories_select = $_POST['categories_select'];
        $models_select = $_POST['models_select'];
        $img_path = $_POST['add_img_path'];
        $desc = $_POST['desc'];
        $price = $_POST['added_price'];


        $update = $conn->prepare("UPDATE `products` SET `products_name`='$name',`categories_id`='$categories_select',`models_id`='$models_select',`img_path`='$img_path',`description`='$desc',`price`='$price' WHERE `id`='$id'");
        $update->execute();
        header('Location:products.php');
    }
}
if (isset($_POST['cancel'])) {
    header('Location: products.php');
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
    <!--     Brand-->
    <a class="navbar-brand" href="#">Adminka</a>

    <!--     Toggler/collapsibe Button-->
    <!--        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">-->
    <!--            <span class="navbar-toggler-icon"></span>-->
    <!--        </button>-->
    <!---->
    <!--         Navbar links-->
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
        <h1>UPDATE PRODUCT</h1>
        <form action="" method="post" enctype="multipart/form-data">
            <input type="text" name="update_name" placeholder="Enter a product name" value="<?= $products_arr[0]['products_name'] ?>"><br><br>
            <select name="categories_select">
                <option>All categories</option>
                <?php foreach ($categories_arr as $item): ?>
                    <option value="<?= $item['id']; ?>" <?php if ($item['id'] == $categories_id) { ?> selected <?php } ?>><?= $item['categories_name']; ?></option>
                <?php endforeach; ?>
            </select><br><br>
            <select name="models_select">
                <option>All models</option>
                <?php foreach ($models_arr as $value): ?>
                    <option value="<?= $value['id']; ?>" <?php if ($value['id'] == $models_id) { ?> selected <?php } ?>><?= $value['models_name']; ?></option>
                <?php endforeach; ?>
            </select><br><br>
            <input type="text" name="add_img_path" placeholder="Enter a image path" value="<?= $products_arr[0]['img_path'] ?>"><br><br>
            <textarea id="desc" rows="4" cols="20" placeholder="Describe this product" name="desc"><?= $products_arr[0]['description'] ?></textarea><br><br>
            <input type="text" name="added_price" placeholder="Enter product price" value="<?= $products_arr[0]['price'] ?>"><br><br>
            <input type="submit" name="update" class="insert" value="UPDATE">
            <input type="submit" name="cancel" class="insert" value="CANCEL">
        </form>
    </div>
</div>
</body>
</html>