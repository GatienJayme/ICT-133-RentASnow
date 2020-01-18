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
?>
