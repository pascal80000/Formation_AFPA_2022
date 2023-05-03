<?php
/*

// =================================================
// =================================================
// ==========  MANIPULATION DE TABLEAUX  ===========
//==================================================
//==================================================


$annee = array
	(
	"Janvier" => "31",
	"Fevrier" => "28",
	"Mars" => "31",
	"Avril" => "30",
	"Mai" => "31",
	"Juin" => "30",
	"Juillet" => "31",
	"Août" => "31",
	"Septembre" => "30",
	"Octobre" => "31",
	"Novembre" => "30",
	"Decembre" => "31"
    );

	asort($annee);

foreach($annee as $mois => $duree)
{	
	echo $mois . " : " . $duree ."<br>";
}


*/

//  =======================================================
//  ======  2. Capitales    ===============================
//  =======================================================

$capitales = array(
    "Bucarest" => "Roumanie",
    "Bruxelles" => "Belgique",
    "Oslo" => "Norvège",
    "Ottawa" => "Canada",
    "Paris" => "France",
    "Port-au-Prince" => "Haïti",
    "Port-d'Espagne" => "Trinité-et-Tobago",
    "Prague" => "République tchèque",
    "Rabat" => "Maroc",
    "Riga" => "Lettonie",
    "Rome" => "Italie",
    "San José" => "Costa Rica",
    "Santiago" => "Chili",
    "Sofia" => "Bulgarie",
    "Alger" => "Algérie",
    "Amsterdam" => "Pays-Bas",
    "Andorre-la-Vieille" => "Andorre",
    "Asuncion" => "Paraguay",
    "Athènes" => "Grèce",
    "Bagdad" => "Irak",
    "Bamako" => "Mali",
    "Berlin" => "Allemagne",
    "Bogota" => "Colombie",
    "Brasilia" => "Brésil",
    "Bratislava" => "Slovaquie",
    "Varsovie" => "Pologne",
    "Budapest" => "Hongrie",
    "Le Caire" => "Egypte",
    "Canberra" => "Australie",
    "Caracas" => "Venezuela",
    "Jakarta" => "Indonésie",
    "Kiev" => "Ukraine",
    "Kigali" => "Rwanda",
    "Kingston" => "Jamaïque",
    "Lima" => "Pérou",
    "Londres" => "Royaume-Uni",
    "Madrid" => "Espagne",
    "Malé" => "Maldives",
    "Mexico" => "Mexique",
    "Minsk" => "Biélorussie",
    "Moscou" => "Russie",
    "Nairobi" => "Kenya",
    "New Delhi" => "Inde",
    "Stockholm" => "Suède",
    "Téhéran" => "Iran",
    "Tokyo" => "Japon",
    "Tunis" => "Tunisie",
    "Copenhague" => "Danemark",
    "Dakar" => "Sénégal",
    "Damas" => "Syrie",
    "Dublin" => "Irlande",
    "Erevan" => "Arménie",
    "La Havane" => "Cuba",
    "Helsinki" => "Finlande",
    "Islamabad" => "Pakistan",
    "Vienne" => "Autriche",
    "Vilnius" => "Lituanie",
    "Zagreb" => "Croatie"
);
$tab = $capitales;  


//  tri par ville
echo "<br>" . "<br>" . "Tri par capitale" . "<br>" . "<br>";
ksort($capitales);

foreach($capitales as $ville => $pays)
{
    echo $ville . " . . . " . '    ' . $pays . "<br>";
}

echo "<br>" . "<br>";
/*

//  tri par pays
echo "Tri par pays". "<br>" . "<br>";
asort($capitales);

foreach($capitales as $ville => $pays)
{
    echo $pays . ". . . " . $ville . "<br>";
}



//  Nombre de pays
echo"<br>";
$nb = count($capitales);
echo "Il y a " . $nb . " entrées dans le tableau" . "<br>" . "<br>";



//  Suppression des capitales commençant par la lettre 'B'
echo "suppression des initiales 'B'" . " puis affichage du tableau: " . "<br>" . "<br>";
$tabflip = array_flip($tab);



asort ($tab);
foreach($tab as $ville => $pays)
{
    $ini = substr($ville, 0, 1 );
    if ($ini == "B")
    {
        unset($tabflip[$pays]);
        //echo $ini . " . - . " . $pays . "... ..." . $ville . "<br>";
        $pays = "";
        $ville = "";
    }
    else echo $pays . ". . .    " . $ville . "<br>";
}



//  =======================================================
//  ======  3. Départements    ============================
//  =======================================================

//  1. Liste des régions (par ordre alphabétique) 
//  suivie du nom des départements


$tab = array(
    "Hauts-de-france" => array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
    "Bretagne" => array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
    "Grand-Est" => array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
    "Normandie" => array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime")
);



ksort($tab);
$j = 0;
echo "<pre>";

foreach($tab as $section => $items)
    foreach($items as $cle => $valeur)

    echo "$section :\t$cle\($valeur<br>";

echo "</pre>";


//  2. Liste des régions suivie du nombre de départements



$tab = array(
    "Hauts-de-france" => array("Aisne", "Nord", "Oise", "Pas-de-Calais", "Somme"),
    "Bretagne" => array("Côtes d'Armor", "Finistère", "Ille-et-Vilaine", "Morbihan"),
    "Grand-Est" => array("Ardennes", "Aube", "Marne", "Haute-Marne", "Meurthe-et-Moselle", "Meuse", "Moselle", "Bas-Rhin", "Haut-Rhin", "Vosges"),
    "Normandie" => array("Calvados", "Eure", "Manche", "Orne", "Seine-Maritime")
);





ksort($tab);
$j = 0;

echo "<pre>";

foreach($tab as $section => $items)
    //foreach($items as $cle => $valeur)

    echo "$section : " . count($items,1) . " depts.<br>";

echo "</pre>";



*/
?>
