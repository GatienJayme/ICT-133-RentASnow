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

// Trouver un utilisateur avec son username
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

function update()
{
    $snows = getSnows();
    $snows = json_decode(file_get_contents('Snows.json'), true);
    $snows[3]['modele'] = 'New K067'; // update
}

//
function delete()
{
    $snows = getSnows();
    unset($snows[2]); // delete
    $snows[2] = ["id" => 2, "modele" => "B126", "marque" => "Free Thinker", "bigimage" => "B126.jpg", "smallimage" => "B126_small.jpg", "dateretour" => "2020-01-09", "disponible" => "Plus présent",
    "details" => "Suberbe planche flexible et belle avec des flammes dessus"];
    file_put_contents('Snows.json', json_encode($snows));
}

function getRent() {
    $snows = getSnows();
    // if()    $snows['disponible'] =
        require_once "view/details.php";
}
?>
