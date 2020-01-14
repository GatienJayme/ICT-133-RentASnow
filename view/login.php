<?php
/*  Program: Rent a snow
    Author: Gatien Jayme
    Date: 09.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Login";
?>

    <!-- ________ Login _____________-->
    <div class="span12">
        <h1>Les Snowboards</h1>
        <?php foreach ($logins as $login) { ?>
            <div class="row mt-4">
                <div class="col-2"><?= $login[''] ?></div>
                <div class="col-2"><?= $login[''] ?></div>
            </div>
        <?php } ?>
    </div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>