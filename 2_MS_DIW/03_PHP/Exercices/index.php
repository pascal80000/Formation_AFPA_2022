<?php
if (file_exists("header.php"))
{
    include("header.php");
} 
else{
    echo ("ERREUR: fichier 'header.php' absent");
}

if (file_exists("fonctions.php"))
{
    include("fonctions.php");
} 
else{
    echo ("ERREUR: fichier 'fonctions.php' absent");
}

if (file_exists("footer.php"))
{
    include("footer.php");
} 
else{
    echo ("ERREUR: fichier 'footer.php' absent");
}




?>

    <div class="row">
        <div class="col-lg-8 col-sm-12">
        </div>
    </div>

