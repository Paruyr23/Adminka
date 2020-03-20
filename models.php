<?php
require "includes/connect.php";

$limit = 10;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$start = ($page - 1) * $limit;

$models_category = $conn->query("SELECT `models`.*, `categories`.`categories_name` as `categories_name`
FROM `models` AS `models`
         LEFT JOIN `categories` AS `categories`
                   ON `models`.`categories_id` = `categories`.`id` ORDER BY `id` DESC LIMIT $start, $limit");
$models_category->execute();
$models_arr = $models_category->fetchAll(PDO::FETCH_ASSOC);

$select_categories = $conn->query("SELECT * FROM `categories`");
$categories_arr = $select_categories->fetchAll(PDO::FETCH_ASSOC);


$result = $conn->query("SELECT count(id) AS id FROM `models`");
$custCount = $result->fetchAll( PDO::FETCH_ASSOC);
$total = $custCount[0]['id'];
$pages = ceil( $total / $limit );

$Previous = $page - 1;
$Next = $page + 1;
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
    <a class="navbar-brand" href="#">Adminka</a>
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
                    <input type="submit" name="categories" class="categoriesBtn" value="CATEGORIES">
                    <?php
                    if(isset($_POST['categories'])){
                        header("Location:categories.php");
                    }
                    ?>
                </div>
                <div class="categoriesBlock">
                    <input type="submit" name="models" class="categoriesBtn" value="MODELS">
                    <?php
                    if(isset($_POST['models'])){
                        header("Location:models.php");
                    }
                    ?>
                </div>
                <div class="categoriesBlock">
                    <input type="submit" name="products" class="categoriesBtn" value="PRODUCTS">
                    <?php
                    if(isset($_POST['products'])){
                        header("Location:products.php");
                    }
                    ?>
                </div>
            </form>
        </div>
    </div>
    <div class="forContent col-xl-9">
        <h1>MODELS</h1>
        <form action="" class="form1" method="post" enctype="multipart/form-data">
            <input type="text" name="add_name" placeholder="Enter a model name">
            <select name="select">
                <option>All categories</option>
                <?php foreach ($categories_arr as $item): ?>
                    <option value="<?= $item['id']; ?>"><?= $item['categories_name']; ?></option>
                <?php endforeach; ?>
            </select>
            <input type="submit" name="insert" class="insert" value="ADD MODEL">
        </form>
        <?php
            if (isset($_POST['insert'])) {
                if (!empty($_POST['add_name']) && !empty($_POST['select'])) {

                    $name = $_POST['add_name'];
                    $select = $_POST['select'];

                    $insert = $conn->prepare("INSERT INTO `models` (`models_name`, `categories_id`, `pubdate`, `update_date`) VALUES ('$name', '$select', now(), now())");
                    $insert->execute();

                    header('Location:models.php');
                    exit();
                }
            }
        ?>
        <form action="" method="POST" enctype="multipart/form-data"  class="search">
            <lablel for="search">Search:</lablel>
            <input type="text" name="search" id="search" placeholder="Enter search query">
        </form>
        <table class="table" id="modelsTable">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Categories Name</th>
                <th>Publication Time</th>
                <th>Update Time</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($models_arr as $value): ?>
                <tr>
                    <th><?= $value['id'] ?></th>
                    <td><?= $value['models_name'] ?></td>
                    <td><?= $value['categories_name'] ?></td>
                    <td><?= $value['pubdate'] ?></td>
                    <td><?= $value['update_date'] ?></td>
                    <td>
                        <a href="models_update_page.php?id=<?= $value['id']?>&categories_id=<?= $value['categories_id'] ?>" class="pencil"><i class="fa fa-pencil" aria-hidden="true" style="color: green;font-size: 30px; margin: 0 5px;"></i></a>
                        <a href="#" class="models_trash"><i class="fa fa-trash-o" aria-hidden="true" style="color: red;font-size: 30px; margin: 0 5px;"></i></a>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
        <div class="forPagination">
            <ul class="pagination">
                <li class="page-item <?php if($_GET['page'] <= 1){ echo 'disabled'; } ?>"><a class="page-link" href="models.php?page=<?= $Previous; ?>">&laquo;Prev</a></li>
                <?php for($i = 1; $i <= $pages; $i++) : ?>
                    <li class="page-item <?php if($i == $page){ echo 'active'; } ?>"><a class="page-link" href="models.php?page=<?= $i; ?>"><?= $i; ?></a></li>
                <?php endfor; ?>
                <li class="page-item <?php if($page >= $pages){ echo 'disabled'; } ?>"><a class="page-link" href="models.php?page=<?= $Next; ?>">Next&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $("#search").keyup(function(){
            var searchValue = $(this).val();
            if (searchValue != ''){
                $.ajax({
                    url:'models_search.php',
                    method:'post',
                    data:{query:searchValue},
                    success:function(response){
                        $("#modelsTable").html(response);
                    }
                });
            }
            else{
                $("#modelsTable").html('')
            }
        });
    })
</script>
</body>
</html>
