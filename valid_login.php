<?php
session_start();
include_once "includes/connect.php";

$chek = $_POST['checkbox'];
$ccVal='';
if ($_POST['click'] && isset($_POST['click'])) {
    if (!empty($_POST['login'] && $_POST['password'])) {
        $login = trim(filter_var($_POST['login'], FILTER_SANITIZE_STRING));
        $pass = trim(filter_var($_POST['password'], FILTER_SANITIZE_STRING));


        if (strlen($login) < 2 || strlen($login) > 10) {
            $_SESSION['error_in_name'] = "*Login incorrect length min 2 max 10!<br/>";
            header("Location:login.php");
        }
        if (strlen($pass) < 4 || strlen($pass) > 20) {
            $_SESSION['error_in_password'] = "*Password incorrect length min 4 max 20!<br/>";
            header("Location:login.php");
        }

        $select = $conn->query("SELECT * FROM `users` WHERE `login` = '$login'");
        $arr = $select->fetchAll(PDO::FETCH_ASSOC);
        $result = $arr[0]['password'];
        $name = $arr[0]['login'];
        $id = $arr[0]['id'];

        if ($result == $pass) {
            for ($i = 0; $i <= 25; $i++) {
                if ($i % 2 == 0) {
                    $ccVal .= chr(mt_rand(97,122));
                } else {
                    $ccVal .= mt_rand(0,99);
                }
            }

            $_SESSION["name"] = $_POST['login'];
            $_SESSION["id"] = $id;
            $_SESSION["cookie"] = $ccVal;
            $_SESSION["auth"] = true;

            if ($chek == "on") {
                setcookie('cookie_key', $ccVal, time() + 86400, "/");
                setcookie('name', $login, time() + 86400, "/");

                $sql = "UPDATE `users` SET `cookie_key` = '$ccVal' WHERE `id` = {$id}";
                $stmt = $conn->prepare($sql);
                $stmt->execute();
            }else{
                echo "false";
            }

           header("Location:admin.php");
        } else {
            $_SESSION["no_exist"] = "*This user does not exist!";
            header("Location:login.php");
        }


    } else {
        $_SESSION['login'] = "*Please fill in the empty fields!";
        header("Location:login.php");
    }
}