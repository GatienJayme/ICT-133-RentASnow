<?php
/*  Program: Rent a snow view Real details
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Details";
?>
<!-- ________ details _____________-->
<div class="span12">
    <h1>Le détail d'un snowboard</h1>
    <div class="row mt-4">
        <table class="table-bordered">
            <tr class="text-center">
                <td>
                    <div class="col-lg-10 col-md-5"><img src="view/images/<?= $Snow['photo'] ?>">
                    </div>
                </td>
                <td>
                    <?php if ($_SESSION['employe'] == true) { ?>
                        <br> <br>
                        <button><a href="index.php?action=delete">Supprimer</a></button>
                        <br> <br>
                        <button><a href="index.php?action=update">Modifier</a></button>
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
<div>
    <br>
    <table class="table">
        <tr>
            <th>Code</th>
            <th><?= $Snow['code'] ?></th>
        </tr>
        <tr>
            <th>Taille</th>
            <th><?= $Snow['length'] ?></th>
        </tr>
        <tr>
            <th>Etat</th>
            <th><?= getTextState($Snow['state']) ?></th>
        </tr>
        <tr>
            <th>Disponible</th>
            <th><?= ($Snow['available'] == 1) ? 'Oui' : 'Non' ?></th>
        </tr>
    </table>
    <a href="?action=editSnowDetails&snowid=<?= $snowid ?>" class="btn btn-primary text-center">Modifier</a>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
