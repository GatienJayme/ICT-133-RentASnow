<?php
/*  Program: Rent a snow
    Author: Gatien Jayme
    Date: 09.01.2020
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
            <br><div class="col-2"><?= $detail['brand']?></div>
            <div class="col-2"><?= $detail['model'] ?></div>
            <div class="col-2"><?= $detail['details']?></div>
            <div class="col-2"><?= $detail['image']?></div>
        </div>
    <?php } ?>
</div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>
