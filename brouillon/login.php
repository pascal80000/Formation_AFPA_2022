<?php // login.php
  $host = 'localhost';    // Hôte, modifier au besoin
  $data = 'publications'; // BDD, modifier au besoin
  $user = 'pascal';         // Nom d'utilisateur, modifier au besoin
  $pass = '1122';        // Mot de passe, modifier au besoin
  $chrs = 'utf8mb4';      // Jeu de caractères
  $attr = "mysql:host=$host;dbname=$data;charset=$chrs";
  $opts =
  [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false,
  ];
?>