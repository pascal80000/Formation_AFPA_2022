<?php //definitionutilisateurs.php
  require_once 'login.php';

  try
  {
    $pdo = new PDO($attr, $user, $pass, $opts);
  }
  catch (\PDOException $e)
  {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
  }

  $query = "CREATE TABLE utilisateurs (
    prenom     VARCHAR(32) NOT NULL,
    nomfamille VARCHAR(32) NOT NULL,
    nomutil    VARCHAR(32) NOT NULL UNIQUE,
    motdepasse VARCHAR(255) NOT NULL
  )";
  
  $result = $pdo->query($query);

  $prenom     = 'Bertrand';
  $nomfamille = 'Simard';
  $nomutil    = 'bsimard';
  $motdepasse = 'monsecret';
  $jeton      = password_hash($motdepasse, PASSWORD_DEFAULT);

  ajouter_utilisateur($pdo, $prenom, $nomfamille, $nomutil, $jeton);

  $prenom     = 'Pauline';
  $nomfamille = 'Leduc';
  $nomutil    = 'pleduc';
  $motdepasse = 'acrobate';
  $jeton      = password_hash($motdepasse, PASSWORD_DEFAULT);

  ajouter_utilisateur($pdo, $prenom, $nomfamille, $nomutil, $jeton);

  function ajouter_utilisateur($pdo, $pn, $nf, $nu, $mp)
  {
	// Préparation de l'insertion sécurisée
    $insertion = $pdo->prepare('INSERT INTO utilisateurs VALUES(?,?,?,?)');

	// Association des valeurs aux paramètres
    $insertion->bindParam(1, $pn, PDO::PARAM_STR,  32);
    $insertion->bindParam(2, $nf, PDO::PARAM_STR,  32);
    $insertion->bindParam(3, $nu, PDO::PARAM_STR,  32);
    $insertion->bindParam(4, $mp, PDO::PARAM_STR, 255);

	// Exécution de l'insertion
    $insertion->execute([$pn, $nf, $nu, $mp]);
  }
?>