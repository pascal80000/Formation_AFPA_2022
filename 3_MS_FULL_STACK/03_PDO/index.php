<html>
    <body>


<?php


if ( $_SERVER['REQUEST_METHOD'] == "post") 
    {
        echo "Method = post";
    }

if ( $_SERVER['REQUEST_METHOD'] == "get") 
    {
        echo "Method = get";
    }

    if ( isset( $_POST['update'])) { // mise à jour
        echo "mise a jour";
    } elseif ( isset($_POST['delete'])) {
        echo "suppression";
    } elseif ( isset($_POST['create'])){
        echo "Création";
    }

    echo "bonjour  " . $_REQUEST['prenom'] . " " . $_REQUEST['nom'] . "<br>";

    echo $_REQUEST['prenom'] . $_REQUEST['nom'] . " né(e) le :" . $_REQUEST['naissance']."<br>";
    
    echo " Joignable à l'adresse mail : " . $_REQUEST['email'] . "<br>";


?>
    </body>
</html>