<?php
/*  Program: Rent a snow view Edit details
    Author: Gatien Jayme
    Date: 03.04.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Votre Panier";
?>
<!-- ________ Panier _____________-->
<div class="row-fluid">
<h1>Votre panier :</h1>
    <br>
        <table class="table table-striped">
            <tr>
                <th>Snowboard</th>
                <th>Code</th>
                <th>Taille</th>
            </tr>
            <?php foreach($cartContent as $Snow) {?>
            <tr>
                    <td><?= $Snow['brand'] ?> <?= $Snow['model'] ?></td>
                    <td><?= $Snow['code'] ?></td>
                    <td><?= $Snow['length'] ?></td>
            </tr>
            <?php }?>
        </table>
    <a href="?action=rentASnows" class="btn btn-success">Louer</a>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
