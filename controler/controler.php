<?php
/*  Program: Rent a snow controller
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
require_once 'model/model.php';

// This file contains nothing but functions

// La fonction home est utilisé pour aller chercher les données dans le model, ses données sont stockées dans une variable
// $news et elles seront envoyer à la vue home avec le require
function home()
{
    $news = getNews();
    require_once 'view/home.php';
}

// La fonction snows est utilisé pour aller chercher les données dans le model, ses données sont stockées dans une variable
// $snows et elles seront envoyer à la vue snows avec le require
function snows()
{
    $snows = getSnows();
    require_once 'view/snows.php';
}

// Cette fonction fait exactement la même chose que la fonction snows mais les données seront renvoyés à la vue details grace au require
function details()
{
    $thesnow = getonesnow($listsnow);
    require_once 'view/details.php';
}

// Redirige à la vue du login
function login()
{
    require_once 'view/login.php';
}

// La fonction connect est utilisée pour se connecter avec un utilisateur dans le site rent a snow et renvoyer
// l'utilisateur connecter à la page home avec le require
function connect($username, $password)
{
    // variable utiliser pour stocker les valeurs d'un user
    $theuser = getoneuser($username);
    $hash = password_hash($password,PASSWORD_DEFAULT);
    if (password_verify($password, $hash)) {
        // Cette boucle connecte le user utilisé si le nom d'utilisateur et le mot de passe corresspond au fichier
        if ($theuser['username'] == $username) {
            $_SESSION['username'] = $theuser['username'];
            require_once "view/home.php";
        } else {
            $username = null;
            require_once 'view/login.php';
        }
    }
}

// La fonction disconnect est utilitée pour se déconnecter de notre compte et revenir au login avec le require
function disconnect()
{
    unset($_SESSION['username']);
    require_once 'view/login.php';
}

?>
