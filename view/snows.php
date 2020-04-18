<?php
/*  Program: Rent a snow view snows
    Author: Gatien Jayme
    Date: 09.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Snowboards";
?>

<!-- ________ Snowboards _____________-->
<h1>Les Snowboards</h1>
<button><a href="index.php?action=add">Ajouter</a></button>
<?php foreach ($snows as $snow) { ?>
    <table class="table">
        <tr class="text-center">
            <th>
                Modele
            </th>
            <th>
                Marque
            </th>
            <th>
                Image
            </th>
        </tr>
        <tr>
            <td class="text-center">
                <?= $snow['model'] ?>
            </td>
            <td>
                <?= $snow['brand'] ?>
            </td>
            <td>
                <img src="view/images/<?= $snow['smallphoto'] ?>">
            </td>
            <td>
                <button><a href="index.php?action=detailSnow&id=<?= $snow['id'] ?>">Détails</a></button>
            </td>
        <tr>
    </table>
<?php } ?>


<?php
$content = ob_get_clean();
require_once "gabarit.php";
?>