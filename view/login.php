<?php
/*  Program: Rent a snow view login
    Author: Gatien Jayme
    Date: 26.04.2020
    Version: 1.0
*/
ob_start();
$title = "RentASnow - Login";
?>

<!-- ________ Login _____________-->
<div class="span12">
    <h1>Connexion</h1>
    <div class="row mt-4">
        <form action="index.php?action=connect" method="post">
            <table id="compte">
                <tr>
                    <td><label for="Votre email">Votre email</label></td>
                    <td><input type="text" name="email" required/></td>
                </tr>
                <tr>
                    <td><label for="mdp"></label>Mot de passe</td>
                    <td><input type="password" name="password" required/></td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" name="envoyer">Se connecter</button>
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
