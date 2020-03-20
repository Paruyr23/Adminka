<?php
session_start();
include_once "includes/connect.php";

$id = $_SESSION['id'];
$ccVal = $_SESSION["cookie"];
$sql = "UPDATE `users` SET `cookie_key` = NULL WHERE `id` = '$id'";
$stmt = $conn->prepare($sql);
$stmt->execute();

setcookie('cookie_key', $ccVal, time() - 86400, "/");

unset($_SESSION["login"]);
unset($_SESSION["password"]);

header("Location:login.php");
