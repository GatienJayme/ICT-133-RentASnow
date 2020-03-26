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
                <tr class="text-center">
                    <th>
                        Code
                    </th>
                    <th>
                        Longueur
                    </th>
                    <th>
                        Image
                    </th>
                    <th>
                        Etat
                    </th>
                    <th>
                        Disponible
                    </th>
                    <th>
                        Nouveau prix
                    </th>
                    <th>
                        Bon prix
                    </th>
                    <th>
                        Ancien prix
                    </th>
                </tr>
                <tr>
                    <td>
                        <div class="col-2"><?= $listofdetailsnow['code'] ?></div>
                    </td>
                    <td>
                        <div class="col-2"><?= $listofdetailsnow['length'] ?></div>
                    </td>
                    <td>
                        <div class="col-lg-10 col-md-5"><img src="view/images/<?= $listofdetailsnow['photo'] ?>">
                        </div>
                    </td>
                    <td>
                        <div class="col-2"<?= $listofdetailsnow['state'] ?>></div>
                    </td>
                    <td>
                        <!-- opérateur ternaire booleen-->
                        <div class="col-2"><?= ($listofdetailsnow['available'] == 1) ? 'Oui' : 'Non' ?></div>
                    </td>
                    <td>
                        <div class="col-2"><?= $listofdetailsnow['pricenew'] ?></div>
                    </td>
                    <td>
                        <div class="col-2"><?= $listofdetailsnow['pricegood'] ?></div>
                    </td>
                    <td>
                        <div class="col-2"><?= $listofdetailsnow['priceold'] ?></div>
                    </td>
                    <td>
                        <div>
                            <?php if(count($snows) > 0) { ?>
                                <h4>Nous avons <?= count($snows) ?> de snows de ce type</h4>
                            <?php } else {?>
                                <h4>Nous n'avons malheureusement aucun snow de ce type</h4>
                            <?php}?>
                        </div>
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
