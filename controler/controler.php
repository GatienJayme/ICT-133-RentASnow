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

function RealDetails($snowid)
{
    $Snow = getSnowsForRealById($snowid);
    $rents = getRentsOfSnow($snowid);
    require 'view/detailRealSnow.php';
}

function emptycart() {
    foreach ($_SESSION['cart'] as $snow)
    {
        cancel($snow['snowid']);
    }
    unset($_SESSION['cart']);
    $_SESSION['flashmessage'] = 'Votre location à bien été annulé';
    snows($id);
}

function putInCart($snowid)
{
    $Snow = getSnowsForRealById($snowid); // Prend les details des snows
    $_SESSION['cart'][] = $Snow;
    withdraw($snowid); // met le snow non disponible
    $_SESSION['flashmessage'] = 'Le snowboard a été mis dans le panier';
    return;
}

function viewCart($cartContent) {
    require_once 'view/cart.php';
}

function rentSnows($cartContent) {
    // Crée un enregistrment dans rents
    $rentid = createRent($_SESSION['user']['id']);

    foreach ($cartContent as $Snow) {
        addSnowToRent($Snow, $rentid); // Ajoute les snowboards dans rentsdetails
        }
    // Vider le panier
    unset($_SESSION['cart']);
    // message de confirmation
    $_SESSION['flashmessage'] = 'Votre location a été enregistré';
    // Retourne à la liste de snows
    snows($id);
}

function editDetailRealSnow($snowid)
{
    $Snow = getSnowsForRealById($snowid);
    require 'view/editDetailRealSnow.php';
}

// Redirige à la vue du login
function login()
{
    require_once 'view/login.php';
}

// Demande un nom d'utilisateur et un mot de passe s'ils sont corrects la session s'ouvre sinon le programme retourne rien
function connect($email, $password)
{
    // variable utiliser pour stocker les valeurs d'un user
    $theuser = getoneuserbyemail($email);
    if (password_verify($password, $theuser['password'])) {
            $_SESSION['user'] = $theuser;
            $_SESSION['flashmessage'] = 'Bienvenue '.$theuser['firstname'];
            home();
    } else {
        unset($_SESSION['user']);
        $_SESSION['flashmessage'] = "Ton mot de passe ou ton nom d'utilisateur est faux !!!";
        require_once 'view/login.php';
    }
}

// Permet de déconnecter la personne connecté à sa session
function disconnect()
{
    unset($_SESSION['user']);
    home();
}

function add($brand, $model) {
    $addsnowboard = addOneSnow($model, $brand);
    require_once 'view/addsnow.php';
}

function delete($snowid) {
    $deleteOneSnow = deleteSnow($snowid);
    unset($deleteOneSnow);
}

function update() {

}
?>
