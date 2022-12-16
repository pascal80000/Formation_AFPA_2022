<?php // authentification.php
  require_once 'login.php';

  try
  {
    $pdo = new PDO($attr, $user, $pass, $opts);
  }
  catch (\PDOException $e)
  {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
  }

  if (isset($_SERVER['PHP_AUTH_USER']) &&
      isset($_SERVER['PHP_AUTH_PW']))
  {
    $nu_temp = assainir($pdo, $_SERVER['PHP_AUTH_USER']);
    $mp_temp = assainir($pdo, $_SERVER['PHP_AUTH_PW']);

    $query  = "SELECT * FROM utilisateurs WHERE nomutil=$nu_temp";
    $result = $pdo->query($query);

    if (!$result->rowCount()) die("Utilisateur introuvable");

    $row = $result->fetch();
    $pn  = $row['prenom'];
    $nf  = $row['nomfamille'];
    $nu  = $row['nomutil'];
    $mp  = $row['motdepasse'];

	if (password_verify(str_replace("'", "", $mp_temp), $mp))
		echo htmlspecialchars("$pn $nf : Bonjour, $pn, 
		   vous êtes connecté en tant que '$nu'");
	else die("Nom d'utilisateur ou mot de passe non valide");
  }
  else
  {
    header('WWW-Authenticate: Basic realm="Zone restreinte"');
    header('HTTP/1.1 401 Unauthorized');
    die ("Entrez votre nom d'utilisateur et votre mot de passe");
  }

  function assainir($pdo, $chaine)
  {
    $chaine = htmlentities($chaine);
    return $pdo->quote($chaine);
  }	
?>
