<?php //continue2.php
  session_start();

  if (isset($_SESSION['prenom']))
  {
    $prenom     = $_SESSION['prenom'];
    $nomfamille = $_SESSION['nomfamille'];

    destroy_session_and_data();
	
    echo htmlspecialchars("Rebonjour, $prenom");
    echo "<br>";
    echo htmlspecialchars("Votre nom complet est $prenom $nomfamille");

  }
  else echo "Cliquez <a href='authentification2.php'>ici</a> " .
            "pour vous identifier.";

function destroy_session_and_data()
{
    $_SESSION = array();
    setcookie(session_name(), '', time() - 2592000, '/');
    session_destroy();
  }
?>
