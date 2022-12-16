<html>
    <body>




<form action="script.php" method="post"> 
      Nom : <input type="text" name="nom" size="20" maxlength="40" /> <br /> 
      Prenom : <input type="text" name="prenom" size="20" maxlength=40 /> 
      <input type="submit" value="-=< ZYVA >=-" /> 
    </form> 



    <form action ="check.php" method="post"> 
    Tu utilises internet plutôt le :<br /> 
    <input type="checkbox" name="Fjour[]" value="Lundi" />Lundi<br />
    <input type="checkbox" name="Fjour[]" value="Mardi" />Mardi<br />
    <input type="checkbox" name="Fjour[]" value="Mercredi" />Mercredi<br />
    <input type="checkbox" name="Fjour[]" value="Jeudi" />Jeudi<br />
    <input type="checkbox" name="Fjour[]" value="Vendredi" />Vendredi<br />
    <input type="submit" name="Envoyer" value="ENVOYER" /> 
</form> 



<form action="page.php" method="post">
    Votre e-mail : <input type="text" name="email" />
    <input type="hidden" name="secret" value="texte à passer discrètement" />
    <input type="submit" value="OK" />
</form> 




<input type="submit" name="delete" value="Supprimer">
<input type="submit" name="create" value="Créer">
<input type="submit" name="update" value="Modifier">









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