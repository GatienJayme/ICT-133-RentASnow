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













function details($snowid)
{
    $snow['id'] = $snowid;
    $listsnows = getSnows();
    if (isset($_GET['id']) == true) {
        $snowid = $_GET['id'];
    }
    require_once 'view/details.php';
}



function detailsproductsshow()
{
    $listproducts = getProducts();
    if (isset($_GET['model']) == true) {
        $modelesnow = $_GET['model'];
        $title = "Détails de $modelesnow";
        $description = "Et vous pouvez ensuite louer !";
    }

    require_once 'view/detailsproducts.php';
}











// La fonction login est utilisée pour simplement renvoyer a la vue du login
function login()
{
    require_once 'view/login.php';
}

// La fonction connect est utilisée pour se connecter avec un utilisateur dans le site rent a snow et renvoyer
// l'utilisateur connecter à la page home avec le require
function connect()
{
    // Le isset utilisé ici sert a cacher le mot de passe et l'utilisateur donné dans la query string
    if (isset($_POST['envoyer'])) {
        $username = $_POST['pseudo'];
        $password = $_POST['mdp'];
    }
    // Cette boucle sert a donné quel nom est utilisé pour se connecter avec quel mot de passe et aucun nom d'utilisateur
    // ou mot de passe autre que celui donnée ne laissera connecté quelqu'un
    if ($username == 'Gatien' && $password == '1234567') {
        $_SESSION['username'] = $username;
    } else {
        require_once 'view/login.php';
    }
    require_once 'view/home.php';
}

// La fonction disconnect est utilitée pour se déconnecter de notre compte et revenir au login avec le require
function disconnect()
{
    unset($_SESSION['username']);
    require_once 'view/login.php';
}

?>
