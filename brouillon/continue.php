<?php // continue.php
  session_start();

  if (isset($_SESSION['prenom']))
  {
    $prenom     = htmlspecialchars($_SESSION['prenom']);
    $nomfamille = htmlspecialchars($_SESSION['nomfamille']);

    echo "Rebonjour, $prenom.<br>
          Votre nom complet est $prenom $nomfamille.<br>";
  }
  else echo "Cliquez <a href=authentification2.php>ici</a> " .
            "pour vous identifier.";
?>
