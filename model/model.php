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

// Permet de rechercher la liste de snowboard
function getSnows()
{
    try {
        $dbh = getPDO();
        $query = 'SELECT snowtypes.id, snowtypes.brand, snowtypes.model, snowtypes.photo FROM snowtypes';
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

function cancel($snowid) {
    try {
        $dbh = getPDO();
        $query = 'DELETE snows';
        $statement = $dbh->prepare($query);
        $statement->execute(['snowid' => $snowid]);
        $dbh = null;
        return true;
    } catch (PDOException $e) {
        print 'Error!:' . $e->getMessage() . '<br/>';
        $_SESSION['flashmessage'] = "Erreur lors de l'enregistrement";
        return null;
    }
}

function withdraw($snowid) {
    try {
        $dbh = getPDO();
        $query = 'UPDATE snows SET available = false WHERE id= :snowid';
        $statement = $dbh->prepare($query);
        $statement->execute(['snowid' => $snowid]);
        $dbh = null;
        return true;
    } catch (PDOException $e) {
        print 'Error!:' . $e->getMessage() . '<br/>';
        $_SESSION['flashmessage'] = "Erreur lors de l'enregistrement";
        return null;
    }
}

function getRentsOfSnow($id) {
    try {
        $dbh = getPDO();
        $query = 'SELECT firstname, lastname, start_on, nbDays, rents.status 
                    FROM snows
                    INNER JOIN rentsdetails ON snow_id=snows.id
                    INNER JOIN rents ON rent_id = rents.id
                    INNER JOIN users ON user_id=users.id
                    WHERE snows.id=:id';
        $statement = $dbh->prepare($query);
        $statement->execute(['id' => $id]);
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC);
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print 'Error!:' . $e->getMessage() . '<br/>';
        $_SESSION['flashmessage'] = "Erreur lors de l'enregistrement";
        return null;
    }
}

function createRent($userid) {
    try {
        $dbh = getPDO();
        $query = 'INSERT INTO rents (status, start_on, user_id) VALUES (:status, :date, :userid)';
        $statement = $dbh->prepare($query);
        $statement->execute(["status" => 'open', "date" => '2020-02-02', "userid" => $userid]);
        return $dbh->lastInsertId();
    } catch (PDOException $e) {
        print 'Error!:' . $e->getMessage() . '<br/>';
        $_SESSION['flashmessage'] = "Erreur lors de l'enregistrement";
        return null;
    }
}

function addSnowToRent($Snow, $rentid) {
    try {
        $dbh = getPDO();
        $query = 'INSERT INTO rentsdetails (snow_id, rent_id, nbDays, status) VALUES (:snow_id, :rent_id, :nbDays, :status)';
        $statement = $dbh->prepare($query);
        $statement->execute(["snow_id" => $Snow['snowid'], "rent_id" => $rentid, "nbDays" => 30, "status" => 'open']);
        return $dbh->lastInsertId();
    } catch (PDOException $e) {
        print 'Error!:' . $e->getMessage() . '<br/>';
        $_SESSION['flashmessage'] = "Erreur lors de l'enregistrement";
        return null;
    }
}

// Permet de trouver un utilisateur avec son username
function getoneuserbyusername($username)
{
    try {
        $dbh = getPDO();
        $query = 'SELECT * FROM users WHERE firstname=:username';
        $statement = $dbh->prepare($query);
        $statement->execute(['username' => $username]);
        $queryResult = $statement->fetch(PDO::FETCH_ASSOC);
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print 'Error!:' . $e->getMessage() . '<br/>';
        return null;
    }
}

// Permet de rechercher la liste de snowboards concrets identifiés par l'id
function getSnowsForRealById($id)
{
    require '.const.php';
    try {
        $dbh = getPDO();
        $query = 'SELECT *, snows.id as snowid FROM snows 
                    INNER JOIN snowtypes
                    ON snowtype_id = snowtypes.id 
                    WHERE snows.id=:id';
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(['id' => $id]); // execute query
        $queryResult = $statement->fetch(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        if ($debug) var_dump($queryResult);
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Retourne les types d'une liste pour chaque snowboards
function getSnowsForAbstract($id)
{
    try {
        $dbh = getPDO();
        $query = 'SELECT snowtypes.brand, snowtypes.model, COUNT(snows.available), snows.available, snowtypes.pricenew, 
                    snowtypes.pricegood, snowtypes.priceold, snowtypes.photo
                    FROM snowtypes
                    INNER JOIN snows
                    ON snows.snowtype_id = snowtypes.id
                    where snowtypes.id =:id
                    GROUP BY snows.available';
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(['id' => $id]); // execute query
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
        $query = 'SELECT * from snows where snowtype_id=:id and state in (1,2,3) order by length';
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute(['id' => $id]);
        $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC); // prepare result for client
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Retourne la liste des snows d'un type donné
function updateSnow($snowdata)
{
    if(isset($snowdata['available'])) {
        $snowdata['available'] = 1;
    }
    else {
        $snowdata['available'] = 0;
    }
    try {
        $dbh = getPDO();
        $query = "UPDATE snows SET code= :code, length= :length, state= :state, available= :available where id= :snowid";
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute($snowdata); // execute query
        $dbh = null;
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
