<?php
    // ==============================================================
    // ==========  Bibliothèque de fonctions  =======================
    // ==============================================================




    function writeMessage($text) {
        $html = "<h1>".$text."</h1>";
        echo $html;
    }



    function renomme($renom)
    {
      if(!rename($nom, $renom ))
      echo "Impossible de déplacer le fichier";
      else echo "Fichier déplacé";
    }






?>