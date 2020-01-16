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
<div class="span12">
    <h1>Les Snowboards</h1>
    <?php foreach ($snows as $snow) { ?>
        <div class="row mt-4">
            <div class="col-2"><?= $snow['model']?></div>
            <div class="col-2"><?= $snow['marque'] ?></div>
            <div class="col-4"><img src="view/images/<?= $snow['smallimage']?>"></div>
            <div class="col-2"><?= $snow['dateretour'] ?></div>
            <div class="col-2"><?= $snow['disponible'] ?></div>
            <button><a href="index.php?action=detailsnow&snow=<?= $snow['id']?>">Details</a></button>
        </div>
    <?php } ?>
</div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>
