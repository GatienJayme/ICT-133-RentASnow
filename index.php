<?php
/*  Program: Rent a snow index
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
session_start();

require "controler/controler.php";

extract($_GET); // $action, $id
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
