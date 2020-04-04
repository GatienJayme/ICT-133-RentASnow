<?php
/*  Program: Rent a snow view Edit details
    Author: Gatien Jayme
    Date: 03.04.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Details";
?>
<!-- ________ details _____________-->
<div class="span12">
    <h1>Modification d'un snowboard</h1>
    <div class="row mt-4">
        <td>
            <div class="col-lg-10 col-md-5"><img src="view/images/<?= $Snow['photo'] ?>"></div>
        </td>
    </div>
</div>
<div>
    <br>
    <form method="POST" action="?action=saveSnowDetails">
        <table class="table">
            <tr>
                <th>Code</th>
                <th><input type="text" name="code" value="<?= $Snow['code'] ?>"></th>
            </tr>
            <tr>
                <th>Taille</th>
                <th><input type="number" name="length" value="<?= $Snow['length'] ?>"></th>
            </tr>
            <tr>
                <th>Etat</th>
                <td>
                    <select name="state">
                        <?php for($i=1;$i<=4;$i++) { ?>
                            <option value="<?= $i ?>>" <?= ($Snow['state'] == $i) ? "selected" : "" ?>><?= getTextState($i)?></option>
                        <?php } ?>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Disponible</th>
                <th><input type="checkbox" name="available" value="<?= ($Snow['available'] == 1) ? 'checked' : '' ?>">
                </th>
            </tr>
        </table>
        <input type="hidden" name="snowid" value="<?= $snowid ?>">
        <button type="submit" class="btn btn-success text-center">Enregistrer</button>
    </form>
</div>
<?php
$content = ob_get_clean();
require "gabarit.php";
?>
