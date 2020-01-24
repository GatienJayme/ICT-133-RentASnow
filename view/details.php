<?php
/*  Program: Rent a snow view details
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Details";
?>
<?php
?>
<!-- ________ details _____________-->
<div class="span12">
    <h1>Les détails des snowboards</h1>
    <div class="row mt-4">
        <table border="1px">
            <tr>
                <td>
                    <div class="col-2"><?= $thesnow['modele'] ?></div>
                </td>
                <td>
                    <div class="col-2"><?= $thesnow['marque'] ?></div>
                </td>
                <td>
                    <div class="col-lg-10 col-md-5"><img src="view/images/<?= $thesnow['bigimage'] ?>"></div>
                </td>
                <td>
                    <div class="col-2"><?= $thesnow['dateretour'] ?></div>
                </td>
                <td>
                    <div class="col-2"><?= $thesnow['disponible'] ?></div>
                </td>
                <td>
                    <div class="col-2"><?= $thesnow['details'] ?></div>
                </td>
                <td>
                    <?php if ($_SESSION['employe'] == true) { ?>


                        <br> <br>
                        <button><a href="index.php? action=delete">Supprimer</a></button>

                        <br> <br>
                        <button><a href="index.php? action=update">Modifier</a></button>

                        <br> <br> <br> <br>
                    <?php } ?>
                    <label for="Rent">Louer</label>
                    <input type="checkbox" name="rent">
                    <br> <br>
                    <label for="calendar">Date de retour</label>
                    <br>
                    <input type="date" name="dateretour">
                    <br> <br>
                    <button name="cmdlouer"><a href="index.php?action=click">Louer</a></button>
                </td>
            </tr>
        </table>
    </div>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
