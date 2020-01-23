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
                    <button><a href="index.php?action=detailsnow">Louer</a></button>
                </td>
            </tr>
        </table>
    </div>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
