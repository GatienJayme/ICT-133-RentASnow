<?php
/*  Program: Rent a snow model
    Author: Gatien Jayme
    Date: 16.01.2020
    Version: 1.0
*/

function getPDO()
{
    require '.const.php';
    $dbh = new PDO('mysql:host=' . $dbhost . ';dbname=' . $dbname, $user, $password);
    return $dbh;
}

// Traduit les données du news.json
function getNews()
{
    try {
        $dbh = getPDO();
        $query = 'SELECT news.title, news.text,news.date, users.firstname, users.lastname from
                    news inner join users on news.user_id=users.id';
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(); // execute query
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Traduit les données du listofsnowboard.json
function getSnows()
{
    try {
        $dbh = getPDO();
        $query = 'SELECT * FROM snowtypes';
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(); // execute query
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Traduit les données du Users.json
function getUsers()
{
    return json_decode(file_get_contents("model/dataStorage/Users.json"), true);
}

// Permet de trouver un utilisateur avec son username
function getoneuser($username)
{
    $users = getUsers();
    // Prends la valeur du nom et la stocke dans une variable
    foreach ($users as $user) {
        if ($user["username"] == $username) {
            return $user;
        }
    }
    return null;
}

// Trouver l'id du snowboard
function getonesnow($listsnow)
{
    $snows = getSnows();
    $listsnow['id'] = $_GET['listsnow'];
    foreach ($snows as $snow) {
        if ($snow["id"] == $listsnow['id']) {
            $listsnow = $snow;
        }
    }
    return $listsnow;
}

// Permet de modifier les informations d'un snowboard
function update()
{
    $snows = getSnows();
    $snows = json_decode(file_get_contents('Snows.json'), true);
    $snows[3]['modele'] = 'New K067'; // update
}

// Permet de supprimer toutes les informations du snowboard
function delete($id)
{
    $snows = getSnows();
    foreach ($snows as $key => $snow) {
        if ($snow['id'] == $id) {
            unset($snow[$key]);
        }
    }
    file_put_contents('model/dataStorage/listofsnowboard.json', json_encode($snows));
    return $snows;
}

// Permet d'ajouter un nouveau snowboard
function add($model, $marque, $details)
{
    $snows = getSnows();
    $snows[11] = ["id" => 11, "model" => $model, "marque" => $marque, "bigimage" => "K226.jpg", "smallimage" => "B126_small.jpg", "dateretour" => "2020.08.9", "disponible" => "Plus présent",
        "details" => $details];
    file_put_contents('model/dataStorage/listofsnowboard.json', json_encode($snows));
    return $snows;
}

?>
