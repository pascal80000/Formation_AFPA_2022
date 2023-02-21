<?php
//==================================================================================
//==============    Le Téléchargement de Fichiers       ============================
//==================================================================================

global $nom;
global $renom;
//$nom = "";
//$renom = "";


  if ($_FILES)
  {
    $nom = $_FILES['nomfichier']['name'];
    move_uploaded_file($_FILES['nomfichier']['tmp_name'], $nom);
    echo "Image téléchargée : '$nom'<br><img src='$nom'>";
  }
  var_dump($_FILES);
  

$erreur = $_FILES['nomfichier']['error'];
if ($erreur > 0)
    {
        echo $erreur . " erreur(s) détectée(s) ! ";
    }




?>

