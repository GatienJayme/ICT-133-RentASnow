<?php
session_start();
$_SESSION['username'] = 'GJE';

require "controler/controler.php";

$action = $_GET['action'];

switch ($action) {
    case 'displaySnows':
        snows();
        break;
    case 'detailsnow':
        details();
        break;
    case 'connect':
        login();
        break;
    default:
        home();
}

?>
