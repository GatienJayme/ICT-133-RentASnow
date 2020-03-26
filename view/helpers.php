<?php
function gettextstatte()
{
    switch ($state) {
        case 1:
            'Neuf';
            break;
        case 2:
            'Usage';
            break;
        case 3:
            'Vieux';
            break;
        case 4:
            'Mort';
            break;
        default :
            'Null';
    }
}

?>