<?php
/*  Program: Rent a snow model
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
function getNews()
{
    return json_decode(file_get_contents("model/dataStorage/news.json"), true);
}

function getSnows()
{
    return json_decode(file_get_contents("model/dataStorage/listofsnowboard.json"), true);
}

function getdetails()
{
    return json_decode(file_get_contents("model/dataStorage/details.json"), true);
}

function getlogin()
{
    require_once ('view/login.php');
}

?>
