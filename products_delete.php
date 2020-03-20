<?php
include_once 'includes/connect.php';

$deletedId = $_POST['id'];

$deleted = $conn->prepare("DELETE FROM `products` WHERE `id`='$deletedId'");
$deleted->execute();
echo json_encode($deletedId);
