<?php
/*  Program: Rent a snow controller
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
require_once 'model/model.php';

// Va chercher les données dans le model les stockent dans une variable et renvoit à la vue home
function home()
{
    $news = getNews();
    require_once 'view/home.php';
}

// Va chercher les données dans le model les stockent dans une variable et renvoit à la vue des snowboards
function snows()
{
    $snows = getSnows();
    require_once 'view/snows.php';
}

// Va chercher les données dans le model les stockent dans une variable et renvoit à la vue des détails
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

// Demande un nom d'utilisateur et un mot de passe s'ils sont corrects la session s'ouvre sinon le programme retourne rien
function connect($username, $password)
{
    // variable utiliser pour stocker les valeurs d'un user
    $theuser = getoneuser($username);
    // Permet de hacher le mot de passe
    $hash = password_hash($password, PASSWORD_DEFAULT);
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

// Permet de déconnecter la personne connecté à sa session
function disconnect()
{
    unset($_SESSION['username']);
    require_once 'view/login.php';
}

// redirige à la vue détails
function louer() {
    require_once "view/details.php";
}
?>
