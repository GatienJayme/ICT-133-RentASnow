<?php
/*  Program: Rent a snow view details
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Details";
?>
<!-- ________ details _____________-->
<div class="span12">
    <h1>Les détails des snowboards</h1>
    <div class="row mt-4">
        <table class="table-bordered">
            <tr class="text-center">
                <th>
                    Image
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
                    <div class="col-lg-10 col-md-5"><img src="view/images/<?= $listofdetailsnow['photo'] ?>">
                    </div>
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
                    <?php if ($_SESSION['admin'] == true) { ?>
                        <br> <br>
                        <button><a href="index.php?action=delete">Supprimer</a></button>

                        <br> <br>
                        <button><a href="index.php?action=update">Modifier</a></button>

                        <br> <br> <br> <br>
                    <?php } ?>
                    <br> <br>
                </td>
            </tr>
        </table>
    </div>
</div>
<div>
    <br>
    <?php if(count($Snows) > 0) { ?>
        <h4>Nous avons <?= count($Snows) ?> de snows de ce type</h4>
        <table class="table">
            <tr>
                <th>Code</th>
                <th>Taille</th>
                <th>Etat</th>
                <th>Disponible</th>
            </tr>
            <?php foreach($Snows as $Snow) {?>
                <tr class="clickable" data-href="?action=detailRealSnow&id=<?= $Snow['id']?>">
                    <th><?= $Snow['code'] ?></th>
                    <th><?= $Snow['length'] ?></th>
                    <th><?= getTextState($Snow['state'])?></th>
                    <th><?= ($Snow['available'] == 1) ? 'Oui' : 'Non' ?></th>
                </tr>
            <?php }?>
        </table>
    <?php } else {?>
        <h4>Nous n'avons malheureusement aucun snow de ce type</h4>
    <?php }?>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
