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

// Permet d'afficher les news avec le nom de l'auteur
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

// Permet d'afficher la liste de snowboard
function getSnows()
{
    try {
        $dbh = getPDO();
        $query = 'SELECT snowtypes.brand, snowtypes.model, snowtypes.photo FROM snowtypes';
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

function getSnow($id)
{
    try {
        $dbh = getPDO();
        $query = 'SELECT * FROM snowtypes where id='.$id;
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(); // execute query
        $queryResult = $statement->fetch(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Retourne le bon user s'il a le bon email et mdp par rapport a son email ou il retourne null
function getUsers()
{
    // TODO Ecrire le code pour récupérer les users dans un tableau de tableaux associatifs
    try {
        $dbh = getPDO();
        $query = 'SELECT * FROM users';
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

function updatePassword()
{
    $users = getUsers();
    foreach ($users as $user) {
        $hash = password_hash($user['firstname'], PASSWORD_DEFAULT);
        //echo $user['firstname']." => $hash \n";
        // TODO Ecrire le code pour mettre à jour le mot de passe dans la base de données avec $hash

        $id = $user['id'];
        try {
            $dbh = getPDO();
            $query = "UPDATE users SET password ='$hash' WHERE id = $id";
            $statement = $dbh->prepare($query);
            $statement->execute();
            $queryResult = $statement->fetchAll();
            var_dump($queryResult);
            $dbh = null;
        } catch (PDOException $e) {
            print 'Error!:' . $e->getMessage() . '<br/>';
            return null;
        }
    }
}

// Permet de trouver un utilisateur avec son username
function getoneuser($username)
{
    $users = getUsers();
    // Prends la valeur du nom et la stocke dans une variable
    foreach ($users as $user) {
        if ($user["firstname"] == $username) {
            return $user;
        }
    }
    return null;
}

// Permet de rechercher la liste de snowboards concrets identifiés par le model
function getSnowsOfTheModel($model)
{
    try {
        $dbh = getPDO();
        $query = 'SELECT snows.code, snows.length, snows.state, snows.available, snowtypes.model
                    FROM snows
                    LEFT JOIN snowtypes 
                    ON snows.snowtype_id = snowtypes.id
				    WHERE snowtypes.model=:model';
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(['model' => $model]); // execute query
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Retourne les types d'une liste pour chaque snowboards
function getSnowType($tri)
{
    try {
        $dbh = getPDO();
        // pas correcte
        $query = 'SELECT snowtypes.brand, COUNT(id), snowtypes.description, snowtypes.pricenew, 
                    snowtypes.pricegood, snowtypes.priceold
                    from snowtypes
                    GROUP BY model';
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(); // execute query
        $queryResult = $statement->fetch(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Retourne la liste des snows d'un type donné
function getSnowsOfType($id)
{
    try {
        $dbh = getPDO();
        $query = 'SELECT * from snows where snowtypes_id=:id and state in (1,2,3) order by length';
        $statement = $dbh->prepare($query); // prepare query
        // execute(['tid' => $type]);
        $statement->execute(); // execute query
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
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
