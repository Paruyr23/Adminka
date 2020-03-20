<?php
session_start();
require "includes/connect.php";

$id = $_SESSION['id'];
$select = $conn->query("SELECT * FROM `users` WHERE `id` = '$id'");
$arr = $select->fetchAll(PDO::FETCH_ASSOC);
$cookie_key = $arr[0]['cookie_key'];

if(isset( $_SESSION["name"]) &&  $_SESSION["auth"] = true){
    ?>
        <?php include "includes/admin_page.php"?>
    <?php
}elseif (!empty($_COOKIE["cookie_key"])){
    if ($_COOKIE["cookie_key"] == $cookie_key){
        ?>
            <?php include "includes/admin_page.php"?>
        <?php
    }
    else{
        header("Location:login.php");
    }
}else{
    header("Location:login.php");
}
?>

