<?php
/*  Program: Rent a snow index
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
session_start();
$_SESSION['username'] = 'GJE';

require "controler/controler.php";

$action = $_GET['action'];
$snowid = $_GET['id'];


switch ($action) {
    case 'displaySnows':
        snows();
        break;
    case 'detailsnow':
        details($snowid);
        break;
    case 'connect':
        login();
        break;
    default:
        home();
}

?>
