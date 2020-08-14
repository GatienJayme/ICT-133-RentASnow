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

// Refactorisation des fonctions selectMany et selectOne identifié par manyRecords pour avoir aucune répétition
function select($query, $params, $manyRecords)
{
    require '.const.php';
    $dbh = getPDO();
    try {
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute($params); // execute query
        if ($manyRecords) {
            $queryResult = $statement->fetchAll(PDO::FETCH_ASSOC); // prepare result for client
        } else {
            $queryResult = $statement->fetch(PDO::FETCH_ASSOC); // prepare result for client
        }
        $dbh = null;
        return $queryResult;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Refactorisation des fonctions Select avec fetchAll
function selectMany($query, $params)
{
    return select($query, $params, true);
}

// Permet d'afficher les news avec le nom de l'auteur
function getNews()
{
    return selectMany('SELECT news.title, news.text,news.date, users.firstname, users.lastname 
                                from news 
                                inner join users 
                                on news.user_id=users.id', []);
}

// Permet de rechercher la liste de snowboard
function getSnows()
{
    return selectMany('SELECT snowtypes.id, snowtypes.brand, snowtypes.model, snowtypes.photo 
                                FROM snowtypes', []);
}

// Retourne la liste des snows d'un type donné
function getSnowsOfType($id)
{
    return selectMany('SELECT * from snows 
                                where snowtype_id=:id 
                                and state in (1,2,3) 
                                order by length', ['id' => $id]);
}

// Retourne le bon user s'il a le bon email et mdp par rapport a son email ou il retourne null
function getUsers()
{
    return selectMany('SELECT * FROM users', []);
}

// Retourne les snows loué, identifié par l'id
function getRentsOfSnow($id)
{
    return selectMany('SELECT firstname, lastname, start_on, nbDays, rents.status 
                    FROM snows
                    INNER JOIN rentsdetails ON snow_id=snows.id
                    INNER JOIN rents ON rent_id = rents.id
                    INNER JOIN users ON user_id=users.id
                    WHERE snows.id=:id', ['id' => $id]);
}

// Refactorisation des fonctions Select avec fetch
function selectOne($query, $params)
{
    return select($query, $params, false);
}

// Retourne les types d'une liste pour chaque snowboards
function getSnowsForAbstract($id)
{
    return selectOne('SELECT snowtypes.brand, snowtypes.model, COUNT(snows.available), snows.available, snowtypes.pricenew, 
                    snowtypes.pricegood, snowtypes.priceold, snowtypes.photo
                    FROM snowtypes
                    INNER JOIN snows
                    ON snows.snowtype_id = snowtypes.id
                    where snowtypes.id =:id
                    GROUP BY snows.available', ['id' => $id]);
}

// Permet de rechercher la liste de snowboards concrets identifiés par l'id
function getSnowsForRealById($id)
{
    return selectOne('SELECT *, snows.id as snowid FROM snows 
                    INNER JOIN snowtypes
                    ON snowtype_id = snowtypes.id 
                    WHERE snows.id= :id', ['id' => $id]);
}

// Permet de trouver un utilisateur avec son username
function getoneuserbyemail($email)
{
    return selectOne('SELECT * FROM users WHERE email=:email', ['email' => $email]);
}

// Refactorisation des Update / delete pour qu'il n'y est plus de répétition
function execute($query, $params)
{
    require '.const.php';
    $dbh = getPDO();
    try {
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute($params); // execute query
        $dbh = null;
        return true;
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        return null;
    }
}

// Permet de prendre le firstname de la personne et le mettre comme code pour son login
function updatePassword()
{
    $users = getUsers();
    foreach ($users as $user) {
        $hash = password_hash($user['firstname'], PASSWORD_DEFAULT);
        $id = $user['id'];
        execute("UPDATE users SET password ='$hash' WHERE id = :id", ['id' => $id]);
    }
    return null;
}

// Permet de remettre un snow disponible
function cancel($snowid)
{
    return execute('UPDATE snows SET available = true WHERE id= :snowid', ['snowid' => $snowid]);
}

// Permet de prendre un snow pour qu'il ne soit plus disponible
function withdraw($snowid)
{
    return execute('UPDATE snows SET available = false WHERE id= :snowid', ['snowid' => $snowid]);
}

// Retourne la liste des snows d'un type donné
function updateSnow($snowdata)
{
    if (isset($snowdata['available'])) {
        $snowdata['available'] = 1;
    } else {
        $snowdata['available'] = 0;
    }
    return execute("UPDATE snows SET code= :code, length= :length, state= :state, available= :available where id= :snowid", $snowdata);
}

function deleteSnow($snowid) {
    execute("DELETE from snowtypes where id= :snowid", ['snowid' => $snowid]);
}

// Refactorisation des insert pour que le code ne se répète pas identifié par la query et le paramètre
function insert($query, $params)
{
    require '.const.php';
    $dbh = getPDO();
    try {
        $statement = $dbh->prepare($query); // prepare query
        $statement->execute($params); // execute query
        return $dbh->lastInsertId();
    } catch (PDOException $e) {
        print "Erreur !: " . $e->getMessage() . "<br/>";
        $_SESSION['flashmessage'] = "Erreur lors de l'enregistrement";
        return null;
    }
}

// Pemet d'identifier quel userid a pris le snow
function createRent($userid)
{
    return insert('INSERT INTO rents (status, start_on, user_id) 
                            VALUES (:status, :date, :userid)',
        ["status" => 'open', "date" => '2020-02-02', "userid" => $userid]);
}

// Ajoute le Snow dans la table rentsdetails identifié par le Snow et le rentid
function addSnowToRent($Snow, $rentid)
{
    return insert('INSERT INTO rentsdetails (snow_id, rent_id, nbDays, status) 
                            VALUES (:snow_id, :rent_id, :nbDays, :status)',
        ["snow_id" => $Snow['snowid'], "rent_id" => $rentid, "nbDays" => 30, "status" => 'open']);
}

function addOneSnow($brand, $model) {
    return insert("INSERT INTO snowtypes (brand, model, photo)
                            VALUES(:brand, :model, :photo)",
        ["brand" => $brand, "model" => $model, "photo" => 'B101.jpg']);
}
?>
