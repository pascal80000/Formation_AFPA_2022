<html>
    <body>
        <?php

//=============================================================================
echo"===== Numéro de semaine de la date suivante : 14/07/2019.    ==========<br><br>";
//=============================================================================

//Trouvez le numéro de semaine de la date suivante : 14/07/2019.

$test = "14-07-2019";

date_default_timezone_set("Europe/Paris");

$controlee = new DateTime($test);

$sem = ($controlee->format("W"));
echo "Le num. de semaine de la date " . $test . " est: " . $sem . ".<br>";
echo "<br>================================================<br>";



//=============================================================================
echo"Combien reste-t-il de jours avant la fin de votre formation ? <br><br>";
//=============================================================================

$date_fin = new DateTime("02-12-2022");
$date_jour = new DateTime();
//var_dump($date_fin);
//var_dump($date_jour);

$nb_jours = $date_fin ->  diff($date_jour);             // Ecart entre les 2 dates
echo "D'ici la fin, il reste: " . $nb_jours -> format('%a jours  <br><br>');  // le signe '%' : Caractère % littéral 
                                                        // le 'a' = Nombre total de jours, 
                                                        // provenant de la méthode 
                                                        // DateTime::diff()
echo "<br>================================================<br>";


//=============================================================================
//Comment déterminer si une année est bissextile ?
//=============================================================================

//  voir ci-dessous ! 






//=============================================================================
//      Montrez que la date du 32/17/2019 est erronée. 
//=============================================================================

echo"Test de validité de date: <br>";
$oDate =  DateTime::createFromFormat("d/m/Y", "28/02/2019");

$errors = DateTime::getLastErrors();

if ($errors["error_count"]>0 || $errors["warning_count"]>0) 
{
    var_dump($errors);
    echo "=====  Date ERRONEE ===== !";
}
else{
    echo"Cette date est valide";
    }
echo "<br><br>================================================<br>";


//=============================================================================
//      Affichez l'heure courante sous cette forme : 11h25.
//=============================================================================

$oDate = new DateTime();
echo "!!!  à ma montre à quartz JAZ il est exactement " . $oDate -> format("H") . " Heures et " . $oDate -> format("i") . " Minutes. <br>";
echo "<br>au format : 11h25, ça donne çà :  " . $oDate -> format("H\hi");

echo "<br><br>================================================<br>";


//=============================================================================
//      Ajoutez 1 mois à la date courante.
//=============================================================================

echo "Aujourd'hui--: " . (date_format(new DateTime(),"d-m-Y")) . "<br>";    // date actuelle
$date = (new DateTime()); 
$date->add(new DateInterval('P1M')); //'P1M' indique 'Période de 1 Mois'
echo "Dans 1 mois : " . $date->format('d-m-Y');                            // date + 1 mois

echo "<br><br>================================================<br>";



//=============================================================================
//    Que s'est-il passé le 1000200000 ?  
//=============================================================================

$date = new DateTime();
$date_stamp = "1000200000";
$date -> setTimestamp($date_stamp);
echo "Le " . $date -> format('d-m-Y H:i:s') . ".... BOOM !!!!";

echo "<br><br>================================================<br>";










        ?>
    </body>
</html>