<?php


// 1    Ecrire un script PHP qui affiche tous les nombres impairs entre 0 et 150,
//      par ordre croissant : 1 3 5 7...

    for ($i=1; $i < 150; $i++)
        {
            if ($i % 2 == 1)    // % : modulo
            {
                echo $i,";";
                
            }
        }

// 2    Écrire un programme qui écrit 500 fois la phrase Je dois faire 
//      des sauvegardes régulières de mes fichiers

    for($i=0; $i < 5; $i++)
        {
        echo $i," Je dois faire des sauvegardes régulières de mes fichiers   ","\n"  ;
        }

// 3    Ecrire un script qui affiche la table de multiplication totale de {1,...,12} par {1,...,12} dans un tableau HTML. 

    for($i=0; $i<9; $i++)
    {
        for($j=0; $j<9; $j++)
        {
            echo($i*$j);
        }
        echo("\n");

    }


?>
