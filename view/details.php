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
    <?php foreach ($details as $detail) { ?>
        <div class="row mt-4">
            <div class="col-2"><?= $detail['model']?></div>
            <div class="col-2"><?= $detail['marque']?></div>
            <div class="col-lg-10 col-md-5"><img src="view/images/<?= $detail['bigimage']?>"></div>
            <div class="col-2"><?= $detail['dateretour']?></div>
            <div class="col-2"><?= $detail['disponible']?></div>
            <div class="col-2"><?= $detail['details']?></div>
            <div class="col-2"><?= $detail['image']?><img src="view/images"></div>

        </div>
    <?php } ?>
</div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>
