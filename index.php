<?php
/*  Program: Rent a snow index
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
session_start();

require "controler/controler.php";

$action = $_GET['action'];
extract($_POST); // $username, $password

// Fonction déclancher selon l'action faite
switch ($action) {
    case 'displaySnows':
        snows();
        break;
    case 'detailsnow':
        details();
        break;
    case'connect':
        if(isset($username,$password)) {
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
    default:
        home();
}

?>
