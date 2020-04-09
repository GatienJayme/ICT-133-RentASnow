<?php
/*  Program: Rent a snow index
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
session_start();

require 'view/helpers.php';
require "controler/controler.php";

extract($_GET); // $action, $id, $snowid
extract($_POST); // $username, $password

// Fonction déclancher selon l'action faite
switch ($action) {
    case 'displaySnows':
        snows($id);
        break;
    case 'detailSnow':
        details($id);
        break;
    case 'detailRealSnow':
        RealDetails($id);
        break;
    case 'putInCart':
        $snowid = $_GET['snowid'];
        putInCart($snowid);
        snows($id);
        break;
    case 'viewCart':
        $cartContent = $_SESSION['cart'];
        require_once 'view/cart.php';
        break;
    case 'rentSnows' :
        $cartContent = $_SESSION['cart'];
        rentSnows($cartContent);
        break;
    case 'editSnowDetails':
        $snowid = $_GET['snowid'];
        editDetailRealSnow($snowid);
        break;
    case 'saveSnowDetails':
        $_SESSION['flashmessage'] = 'OK';
        updateSnow($_POST);
        $snowid = $_POST['snowid'];
        RealDetails($snowid);
        break;
    case'connect':
        if (isset($username, $password)) {
            connect($username, $password);
        }
        break;
    case 'logout':
        disconnect();
        break;
    case 'login':
        login();
        break;
    case 'click':
        louer();
        break;
    case 'delete':
        $id = $_GET['id'];
        deletesnowboard($id);
        break;
    case 'update':
        updatesnowboard();
        break;
    case 'add':
        $model = $_GET['snows'];
        $marque = $_GET['snows'];
        $details = $_GET['snows'];
        addsnow($model, $marque, $details);
        break;
    default:
        home();
}

?>
