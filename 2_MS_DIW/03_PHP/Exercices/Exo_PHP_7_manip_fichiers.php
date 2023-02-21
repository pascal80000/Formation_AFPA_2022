<?php

/*

$fp = fopen("essai.txt","w");
$myvar = "Bonjour le monde !";
fputs($fp, $myvar);
rewind($fp);
fclose($fp);

echo("texte envoyé au fichier" . "<br>");

*/





echo "Test si le fichier existe....";


if (file_exists('liens.txt'))   // vérifie l'existance du fichier
    {
        echo "le fichier existe bien<br><br>";
    }
else
    {
        echo"Fichier inexistant";// si inexistant, il sera créé par 'fopen'
    }


//  ===========================================================================
//  =========== création et alimentation du fichier ===========================
//                                                                          ===
    $text = <<<_END
    http://www.python.org/
    https://fr.wikipedia.org/wiki/Joel_et_Ethan_Coen
    http://fr.wikipedia.org/wiki/Sp%C4%B1n%CC%88al_Tap
    https://www.theclash.com/landing/
    http://theforensics.net/\n
    _END;


    $fp = fopen("liens.txt", "a+"); // ouverture en lecture ET écriture     ===
    fwrite($fp, $text);             // remplissage du fichier               ===
    fclose($fp);                    // fermeture du fichier                 ===
//                                                                          ===
//  ===========================================================================


$fp = fopen("liens.txt", "r");      // ouverture en lecture seule

    //flock($fp, LOCK_EX);    // verrouillage empêchant un accès multiple
                            // pendant que j'écris dans le fichier

        while(!feof($fp))           // boucle jusqu'à la fin 'End Of File'
        {
            $tab = fgets($fp);      // lecture d'une ligne
            echo ("$tab<br>");      // affichage de cette ligne
        }

    //flock($fp, LOCK_UN);    // libération du verrouillage
                            // un autre client peut se connecter au fichier

fclose($fp);                        // fermeture du fichier

echo "<br>ayé!  les données sont envoyées dans le fichier !!!<br><br>";




// ===============================================================
// ========     En utilisant 'file()'   ==========================
// ===============================================================

chmod('liens.txt',0755);


$fp = fopen("liens.txt", "a+");     // ouverture en lecture ET écriture
$cont = file('liens.txt');          // la variable tableau '$cont' stocke les lignes du fichier
fclose($fp);

echo "<pre>";
    foreach($cont as $item)
    {
        echo "$item";
    }
echo "</pre>";



$visiteurs = file_get_contents("moncompteur.txt");

$visiteurs++;

file_put_contents("moncompteur.txt", $visiteurs);
echo"<pre>";
print("Mon compteur de visites dit que $visiteurs personnes sont passées par ici<br>");
echo"</pre>";





?>
