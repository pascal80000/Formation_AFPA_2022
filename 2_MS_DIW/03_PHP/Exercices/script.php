<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="GET" action="">  
        <label>Nom: </label>
        <input type="text" name="nom"></br>
        <label>Pass:</label>
        <input type="text" name="pass">
        <input type="submit" value="Confirmer">
    </form>    
</body>
</html>




<?php

// constantes d'environnement
define("DBHOST", "localhost");
define("DBUSER", "admin");
define("DBPASS", "1122");
define("DBNAME","php_9");

// Data Source Name de connexion
// $dsn = "mysql:dbname=".php_9.";host=localhost"; remplacé par ligne suivante
    $dsn = "mysql:dbname=".DBNAME.";host=".DBHOST;

//  connexion à la base
try{
    //  on instancie PDO
    $db = new PDO($dsn, DBUSER, DBPASS);

//  on s'assure d'envoyer les données en UTF8
$db->exec("SET NAMES utf8");

// on définit le mode de 'fetch' par défaut
$db->setAttribute(
    PDO::ATTR_DEFAULT_FETCH_MODE,
    PDO::FETCH_ASSOC);  // fetch assoc pour faire un tableau associatif



}catch(PDOException $e){
    die("Erreur:".$e->getMessage());
}

// ici on est connecté à la base
// on peut récupérer la lista des utilisateurs (users)
$sql = "SELECT * FROM `users`";

// on execute directement la requete
$requete = $db->query($sql);

// on récupère les données
$user = $requete->fetchAll();

echo "<pre>";
var_dump($user);
echo "</pre>";


?>

