<?php
/*  Program: Rent a snow model
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/

// Traduit les données du news.json
function getNews()
{
    return json_decode(file_get_contents("model/dataStorage/news.json"), true);
}

// Traduit les données du listofsnowboard.json
function getSnows()
{
    return json_decode(file_get_contents("model/dataStorage/listofsnowboard.json"), true);
}

// Traduit les données du Users.json
function getUsers()
{
    return json_decode(file_get_contents("model/dataStorage/Users.json"), true);
}

// Permet de trouver un utilisateur avec son username
function getoneuser($username)
{
    $users = getUsers();
    // Prends la valeur du nom et la stocke dans une variable
    foreach ($users as $user) {
        if ($user["username"] == $username) {
            return $user;
        }
    }
    return null;
}

// Trouver l'id du snowboard
function getonesnow($listsnow)
{
    $snows = getSnows();
    $listsnow['id'] = $_GET['listsnow'];
    foreach ($snows as $snow) {
        if ($snow["id"] == $listsnow['id']) {
            $listsnow = $snow;
        }
    }
    return $listsnow;
}

// Permet de modifier les informations d'un snowboard
function update()
{
    $snows = getSnows();
    $snows = json_decode(file_get_contents('Snows.json'), true);
    $snows[3]['modele'] = 'New K067'; // update
}

// Permet de supprimer toutes les informations du snowboard
function delete()
{
    $snows = getSnows();
    unset($snows[2]); // delete
}

// Permet d'ajouter un nouveau snowboard
function addsnow() {
    $snows[11] = ["id" => 2, "modele" => "D423", "marque" => "Torta", "bigimage" => "B126.jpg", "smallimage" => "B126_small.jpg", "dateretour" => "2020.08.9", "disponible" => "Plus présent",
        "details" => "Suberbe planche flexible et belle avec des flammes dessus"];
    file_put_contents('Snows.json', json_encode($snows));
}

// Redirige à la vue détails
function getRent() {
        require_once "view/details.php";
}
?>
