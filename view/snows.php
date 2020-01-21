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
            <th>
                Date du retour
            </th>
            <th>
                disponible
            </th>
        </tr>
        <tr>
            <td class="text-center">
                <?= $snow['modele'] ?>
            </td>
            <td>
                <?= $snow['marque'] ?>
            </td>
            <td>
                <img src="view/images/<?= $snow['smallimage'] ?>">
            </td>
            <td>
                <?= $snow['dateretour'] ?>
            </td>
            <td>
                <?= $snow['disponible'] ?>
            </td>
            <td>
                <button><a href="index.php?action=detailsnow&listsnow=<?= $snow['id'] ?>">Détails</a></button>
            </td>
            <td>
                <button><a href="index.php?action=detailsnow">Louer</a></button>
            </td>
        <tr>
    </table>

<?php } ?>


<?php
$content = ob_get_clean();
require_once "gabarit.php";
?>
