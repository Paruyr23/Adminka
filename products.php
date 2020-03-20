<?php
include_once 'includes/connect.php';

$limit = 10;
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$start = ($page - 1) * $limit;

$products = $conn->query("SELECT `products`.*, `categories`.`categories_name`,`models`.`models_name` 
                                        FROM `products`
                                            LEFT JOIN `categories` ON products.categories_id=categories.id
                                            LEFT JOIN `models` ON products.models_id=models.id ORDER BY `id` DESC LIMIT $start, $limit");
$products->execute();
$products_arr = $products->fetchAll(PDO::FETCH_ASSOC);


$result = $conn->query("SELECT count(id) AS id FROM `products`");
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
                        header("Location:");
                    }
                    ?>
                </div>
            </form>
        </div>
    </div>
    <div class="forContent col-xl-9">
        <h1>PRODUCTS</h1>
        <form action=""  class="form1" method="post" enctype="multipart/form-data">
            <input type="submit" name="add" class="insert" value="ADD PRODUCT">
        </form>
        <?php
        if (isset($_POST['add'])){
            header("Location:product_add_page.php");
        }
        ?>
        <form action="" method="POST" enctype="multipart/form-data"  class="search">
            <lablel for="search">Search:</lablel>
            <input type="text" name="search" id="products_search" placeholder="Enter search query">
        </form>
        <table class="table" id="modelsTable">
            <thead>
            <tr>
                <th>#</th>
                <th>Name</th>
                <th>Categories Name</th>
                <th>Models Name</th>
                <th>Images</th>
                <th>New OR Not New</th>
                <th>Description</th>
                <th>Price</th>
                <th>Publication Time</th>
                <th>Update Time</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <?php foreach ($products_arr as $value): ?>
                <tr>
                    <th><?= $value['id'] ?></th>
                    <td><?= $value['products_name'] ?></td>
                    <td><?= $value['categories_name'] ?></td>
                    <td><?= $value['models_name'] ?></td>
                    <td><?= $value['img_path'] ?><!--<img src="" alt="Not found" width="30px" height="30px">--></td>
                    <td><?= $value['isNew'] ?></td>
                    <td><?= $value['description'] ?></td>
                    <td><?= $value['price'] ?></td>
                    <td><?= $value['pubdate'] ?></td>
                    <td><?= $value['update_date'] ?></td>
                    <td>
                        <a href="products_update_page.php?id=<?= $value['id']?>&categories_id=<?= $value['categories_id'] ?>&models_id=<?= $value['models_id'] ?>" class="pencil"><i class="fa fa-pencil" aria-hidden="true" style="color: green;font-size: 30px; margin: 0 5px;"></i></a>
                        <a href="#" class="products_trash"><i class="fa fa-trash-o" aria-hidden="true" style="color: red;font-size: 30px; margin: 0 5px;"></i></a>
                    </td>
                </tr>
            <?php endforeach; ?>
            </tbody>
        </table>
        <div class="forPagination">
            <ul class="pagination">
                <li class="page-item <?php if($_GET['page'] <= 1){ echo 'disabled'; } ?>"><a class="page-link" href="products.php?page=<?= $Previous; ?>">&laquo;Prev</a></li>
                <?php for($i = 1; $i <= $pages; $i++) : ?>
                    <li class="page-item <?php if($i == $page){ echo 'active'; } ?>"><a class="page-link" href="products.php?page=<?= $i; ?>"><?= $i; ?></a></li>
                <?php endfor; ?>
                <li class="page-item <?php if($page >= $pages){ echo 'disabled'; } ?>"><a class="page-link" href="products.php?page=<?= $Next; ?>">Next&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>
<!--<script>-->
<!--    $(document).ready(function(){-->
<!--        $("#products_search").keyup(function(){-->
<!--            var searchValue = $(this).val();-->
<!--            if (searchValue != ''){-->
<!--                $.ajax({-->
<!--                    url:'products_search.php',-->
<!--                    method:'post',-->
<!--                    data:{query:searchValue},-->
<!--                    success:function(response){-->
<!--                        $("#modelsTable").html(response);-->
<!--                    }-->
<!--                });-->
<!--            }-->
<!--            else{-->
<!--                $("#modelsTable").html('')-->
<!--            }-->
<!--        });-->
<!--    })-->
<!--</script>-->
</body>
</html>