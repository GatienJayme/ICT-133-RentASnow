<?php
require_once 'model/model.php';

// This file contains nothing but functions

function home()
{
    $news = getNews();
    require_once 'view/home.php';
}

function snows()
{
    $snows = getSnows();
    require_once 'view/snows.php';
}

function details(){
    $details = getdetails();
    require_once 'view/details.php';
}

function login() {
    $login = getlogin();
    require_once 'view/login.php';
}
?>
