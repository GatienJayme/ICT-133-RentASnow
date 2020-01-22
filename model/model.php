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

/*function getaffuser() {
    $users['id'] = $_GET['user'];
    foreach ($users as $user) {
        if ($users["id"] == $user['id']) {
            $users = [
                "username" => $username,
                "password" => $password,
                "birthdate" => $birthdate,
                "wantnews" => $wantnews,
                "date-inscription" => $dateinscr,
                "employe" => $employe
            ];
        }
    }
}*/

/*function getdetails() {
    foreach ($snows as $snow) {
        if ($snow["id"] == $listsnow['id']) {
            $listsnow = [
                "modele" => $snow['modele'],
                "marque" => $snow['marque'],
                "bigimage" => $snow['bigimage'],
                "smallimage" => $snow['smallimage'],
                "dateretour" => $snow['dateretour'],
                "disponible" => $snow['disponible'],
                "details" => $snow['details']
            ];
        }
    }
}*/
?>
