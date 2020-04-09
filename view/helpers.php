<?php

function getFlashMessage()
{
    if (isset($_SESSION['flashmessage'])) {
        $message = $_SESSION['flashmessage'];
        unset($_SESSION['flashmessage']);
        return "<div class='alert alert-info'>$message</div>";
    }
    return null;
}

function getTextState($state)
{
    $state += 0;
    switch ($state) {
        case 1:
            return 'Neuf';
            break;
        case 2:
            return 'Usagé';
            break;
        case 3:
            return 'Vieux';
            break;
        case 4:
            return 'Mort';
            break;
        default:
            return '???';
            break;
    }
}

function cartButton()
{
    if (!isset($_SESSION['cart'])) {
        return "<a class='disabled'>Panier</a>";
    } else {
        return "<a href='?action=viewCart'>Panier</a>";
    }
}

?>