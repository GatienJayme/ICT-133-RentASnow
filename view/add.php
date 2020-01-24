<?php
/*  Program: Rent a snow view login
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Login";
?>
    <div class="span12">
        <h1>Ajouter un snowboard</h1>
        <div class="row mt-4">
            <form action="index.php?action=add" method="get">
                <table>
                    <tr>
                        <td><label for="model"></label>model</td>
                        <td><input type="text" name="model" required/></td>
                        <?= $addsnowboard['modele'] ?>
                    </tr>
                    <tr>
                        <td><label for="marque"></label>marque</td>
                        <td><input type="text" name="marque" required/></td>
                        <?= $addsnowboard['marque'] ?>
                    </tr>
                    <tr>
                    <tr>
                        <td><label for="details"></label>details</td>
                        <td><input type="text" name="details" required/></td>
                        <?= $addsnowboard['details'] ?>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" name="add">add</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>