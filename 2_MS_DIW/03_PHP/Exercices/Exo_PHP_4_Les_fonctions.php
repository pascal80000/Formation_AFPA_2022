//=======================================================
//===== fonction qui permet   de générer un lien.   =====
//=======================================================

<html>
    <body>
        <?php

        $var = "";
        function gen_lien($lien,$titre)
        {
            $var = "<a href=" . $lien . ">" . $titre . "</a>";
            echo $var;
        }

        gen_lien("https://www.reddit.com", "Reddit Hug");

        ?>
    </body>
</html>




//=====================================================================
//=====  fonction qui calcule la somme des valeurs d'un tableau   =====
//=====================================================================

<html>
    <body>
        <?php

        $tab = [];  //=========== [] :  équivalent à 'array'
        $total = 0;
        $tab = [4, 3 ,8 ,2];
        $valeur = 0;


        function somme()
            {
                global $tab, $total, $valeur;   //  Déclaration de la portée des variables
                $total = array_sum($tab);       //  Calcul de la somme des valeurs dans '$tab'
                echo "<br> Total = ". $total;   //  Affichage du Total
            }                                   //
        somme($tab);                            //  Lancement de la fonction

        ?>
    </body>
</html>


//=============================================================================
//=====  fonction qui vérifie le niveau de complexité d'un mot de passe   =====
//=============================================================================

<html>
    <body>
        <?php


        //$pass = "";
        //global $pass;


        //$pass = "TopSecret42";
        //$filtre = "^a-zA-Z0-9";
        $resultat = false;
        

        function test_pass()
        {
            $pass = "TopSecret42";
            if(preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/', $pass))
            {
                echo "Code assez complexe";
                $resultat = true;
                echo "<br>" . $resultat;
            }
            else 
            {
                echo "mot de passe trop faible";
            }
        }

        test_pass()








        ?>
    </body>
</html>
