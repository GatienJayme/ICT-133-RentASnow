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
        <h1>Page de connexion</h1>
        <?php foreach ($logins as $login) { ?>
            <div class="row mt-4">
                <table>
                    <tr>
                        <?= $login ?>
                        <td><label for="Votre identifiant">Votre identifiant</label></td>
                        <td><input type="text" name="pseudo"/></td>
                        <td><label for="mdp"></label>Mot de passe</td>
                        <td><input type="password" name="mot de passe"/></td>
                        <td><input type="password" name="confirmation du mot de passe"/></td>
                    </tr>
                </table>
            </div>
        <?php } ?>
    </div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>