<?php
/*  Program: Rent a snow
    Author: Gatien Jayme
    Date: 09.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Snowboards";
?>

<!-- ________ Snowboards _____________-->
<div class="span12">
    <h1>Les Snowboards</h1>
    <?php foreach ($snows as $snow) { ?>
        <div class="row mt-4">
            <div class="col-2"><?= $snow['brand']?></div>
            <div class="col-2"><?= $snow['model'] ?></div>
            <button><a href="index.php?action=detailsnow">Details</a></button>
        </div>
    <?php } ?>
</div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>
