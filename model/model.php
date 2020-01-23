<?php
/*  Program: Rent a snow model
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/

// La fonction getNews est simplement le but de traduire les données du json dans le site
function getNews()
{
    return json_decode(file_get_contents("model/dataStorage/news.json"), true);
}

// La fonction getSnows est simplement le but de traduire les données du json dans le site
function getSnows()
{
    return json_decode(file_get_contents("model/dataStorage/listofsnowboard.json"), true);
}

// La fonction getUsers est simplement le but de traduire les données du json dans le site
function getUsers()
{
    return json_decode(file_get_contents("model/dataStorage/Users.json"), true);
}

// Trouver un utilisateur avec son username
function getoneuser($username) {
    $users = getUsers();
    //
    foreach ($users as $user) {
        if ($user["username"] == $username) {
            return $user;
        }
    }
    return null;
}

//
function getonesnow($listsnow) {
    $snows = getSnows();
    $listsnow['id'] = $_GET['listsnow'];
    foreach ($snows as $snow) {
        if ($snow["id"] == $listsnow['id']) {
            $listsnow = $snow;
        }
    }
    return $listsnow;
}
?>
