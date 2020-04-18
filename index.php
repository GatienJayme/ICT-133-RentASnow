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
extract($_POST); // $email, $password

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
    case 'removeCart':
        emptycart();
        break;
    case 'putInCart':
        $snowid = $_GET['snowid'];
        putInCart($snowid);
        snows($id);
        break;
    case 'viewCart':
        $cartContent = $_SESSION['cart'];
        viewCart($cartContent);
        break;
    case 'rentASnows' :
        $cartContent = $_SESSION['cart'];
        rentSnows($cartContent);
        break;
    case 'editSnowDetails':
        $snowid = $_GET['snowid'];
        editDetailRealSnow($snowid);
        break;
    case 'saveSnowDetails':
        updateSnow($_POST);
        $_SESSION['flashmessage'] = 'Le changement a bien été réalisé';
        $snowid = $_POST['snowid'];
        RealDetails($snowid);
        break;
    case'connect':
        if (isset($email, $password)) {
            connect($email, $password);
        }
        break;
    case 'logout':
        disconnect();
        break;
    case 'login':
        login();
        break;
    default:
        home();
}

?>
