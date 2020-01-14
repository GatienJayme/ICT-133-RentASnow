<?php

function getNews()
{
    return json_decode(file_get_contents("model/dataStorage/news.json"),true);
}

function getSnows()
{
    return json_decode(file_get_contents("model/dataStorage/listofsnowboard.json"),true);
}

function getdetails()
{
    return json_decode(file_get_contents("model/dataStorage/details.json"),true);
}

?>
