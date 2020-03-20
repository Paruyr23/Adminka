<?php
$host = 'mysql:host=localhost; dbname=db_users';
$username = 'root';
$password = '';
$error = [PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION];

try {
    $conn = new PDO($host, $username, $password, $error);
} catch (PDOException $e) {
    echo $e->getMessage();
}

$table = "CREATE TABLE IF NOT EXISTS `users` (
id INT(5) UNSIGNED AUTO_INCREMENT PRIMARY KEY ,
login VARCHAR(255) NOT NULL ,
password VARCHAR(255) NOT NULL ,
cookie_key VARCHAR(255) 
)";

$conn->exec($table);



$categories = "CREATE TABLE IF NOT EXISTS `categories` (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
categories_name VARCHAR(255) NOT NULL , 
pubdate DATETIME , 
update_date TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP 
)";

$conn->exec($categories);

//$insert_in_categories = $conn->prepare("INSERT INTO `categories` (`name`, `pubdate`, `update_date`) VALUES ('Ships', now(), now())");
//$insert_in_categories->execute();



$models = "CREATE TABLE IF NOT EXISTS `models` (
id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY ,
models_name VARCHAR(255) NOT NULL , 
categories_id INT(11) ,
pubdate DATETIME , 
update_date TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP 
)";

$conn->exec($models);

//$insert_in_categories = $conn->prepare("INSERT INTO `models` (`name`, `categories_id`, `pubdate`, `update_date`) VALUES ('Mare', 2, now(), now())");
//$insert_in_categories->execute();

$products = "CREATE TABLE IF NOT EXISTS `products`(
id INT(11) AUTO_INCREMENT PRIMARY KEY ,
products_name VARCHAR(255) NOT NULL ,
categories_id INT(11) ,
models_id INT(11) ,
img_path VARCHAR(255) ,
isNew TINYINT(3) ,
description TEXT ,
price INT(11) ,
pubdate DATETIME ,
update_date TIMESTAMP NULL ON UPDATE CURRENT_TIMESTAMP
)";
$conn->exec($products);

$alter_tables = "ALTER TABLE `models`
ADD FOREIGN KEY (categories_id) REFERENCES categories(id)";
$conn->exec($alter_tables);

$alter_cat = "ALTER TABLE `products`
ADD FOREIGN KEY (categories_id) REFERENCES categories(id)";
$conn->exec($alter_cat);

$alter_mod = "ALTER TABLE `products`
ADD FOREIGN KEY (models_id) REFERENCES models(id)";
$conn->exec($alter_mod);
