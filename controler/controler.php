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
function snows($id)
{
    $snows = getSnows();

    // Rechercher le nom de l'image puis enregistre la valeur dans chaque snow
    foreach ($snows as $i => $snow) {
        $photo = $snow['photo']; // B126.jpg
        $point = '.';
        $pospoint = strpos($photo, $point); // pos du point
        $extractphoto = substr($photo, 0, $pospoint); // B126
        $extractsmallphoto = $extractphoto . "_small" . ".jpg";
        $snows[$i]['smallphoto'] = $extractsmallphoto;
    }
    require_once 'view/snows.php';
}


// Va chercher les données dans le model les stockent dans une variable et renvoit à la vue des détails
function details($id)
{
    $Snows = getSnowsOfType($id);
    $listofdetailsnow = getSnowsForAbstract($id);
    require 'view/details.php';
}

function RealDetails($id)
{
    $Snow = getSnowsForRealById($id);
    require 'view/detailRealSnow.php';
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
    $theuser = getoneuserbyusername($username);
    if (password_verify($password, $theuser['password'])) {
            $_SESSION['username'] = $theuser['firstname'];
            $_SESSION['flashmessage'] = 'Bienvenue '.$theuser['firstname'];
            home();
    } else {
        unset($_SESSION['username']);
        $_SESSION['flashmessage'] = "Ton mot de passe ou ton nom d'utilisateur est faux !!!";
        require_once 'view/login.php';
    }
}

// Permet de déconnecter la personne connecté à sa session
function disconnect()
{
    unset($_SESSION['username']);
    home();
}

// redirige à la vue détails
function louer()
{
    require_once "view/details.php";
}

// ajoute un snowboard
function addsnow($model, $marque, $details)
{
    $addsnowboard = add($model, $marque, $details);
    require_once 'view/add.php';
}

// supprime un snowboard
function deletesnowboard($id)
{
    $supprimer = delete($id);
    louer();
}

// modifie un snowboard
function updatesnowboard()
{
    $modifier = update();
    louer();
}

?>
