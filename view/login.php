<?php
/*  Program: Rent a snow view login
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Login";
?>

    <!-- ________ Login _____________-->
    <div class="span12">
        <h1>Page de connexion</h1>
            <div class="row mt-4">
                <table>
                    <tr>
                        <td><label for="Votre identifiant">Votre identifiant</label></td>
                        <td><input type="text" name="pseudo"/></td>
                    </tr>

                    <tr>
                        <td><label for="mdp"></label>Mot de passe</td>
                        <td><input type="password" name="mot de passe"/></td>
                    </tr>
                    <tr>
                    <td><label for="mdp"></label>Confirmation du mot de passe</td>
                        <td><input type="password" name="confirmation du mot de passe"/></td>
                    </tr>
                    <tr>
                        <td><button><a href="index.php?action=connect>">Se connecter</a></button></td>
                    </tr>
                </table>
            </div>
    </div>

<?php
$content = ob_get_clean();
require "gabarit.php";
?>