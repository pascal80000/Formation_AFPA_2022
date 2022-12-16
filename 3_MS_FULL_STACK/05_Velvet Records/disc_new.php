<?php
    include"velvet_records_header.php";           //  ===========  inclusion de l'entête (header)  =================
    include"fonctions.php";                       //  ===========  inclusion des fonctions  ========================
    $db = ConnexionBase("record");


?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nouveau</title>
</head>
<body>

<form action="script_disc_ajout.php" method="post" id="form_ajout">

    <legend class="h3 ml-1">Ajouter un vinyle</legend><!--             Titre de l'encadré  -->

    <div class="form-group  ml-3 mr-3">
                <label for="titre">Titre</label>
                <input type="text" class="form-text form-control-md col-12 " name="titre" id="titre" placeholder="Entrez le titre">
                <div id="div_titre" class = "div_error"></div>
    </div>
                
    <div class="form-group  ml-3 mr-3">
                <label for="artist">Artiste</label>
                <select name="artist" class="select form-text form-control-md col-12 " id="artiste" placeholder="Sélectionnez un artiste">
                <?php
                                if(!isset($_GET['artist']) || $_GET['artist'] == ""){
                                    echo '<option value="" selected>-- Choisir un artiste --</option>';
                                }
                                foreach ($tab as $artist){
                                    echo($artist_id."; ".$artist);
                                    $artist_id = $artist->artist_id;
                                    $verif = '';
                                    if(isset($_GET['artist']) && $_GET['artist'] == $artist_id):$verif = "selected"; endif;
                                    echo "<option value=\"".$artist_id.'"'.$verif.'>'.$artist->artist_name."</option>";
                                }
                                ?>
                <div id="div_artiste" class = "div_error"></div>
    </div>

    <div class="form-group  ml-3 mr-3">
                <label for="annee">Année</label>
                <input type="text" class="form-text form-control-md col-12 " name="annee" id="annee" placeholder="Entrez l'année">
                <div id="div_annee" class = "div_error"></div>
    </div>

    <div class="form-group  ml-3 mr-3">
                <label for="Genre">Genre</label>
                <input type="text" class="form-text form-control-md col-12 " name="genre" id="genre" placeholder="Entrer le genre (Rock, Pop, Prog ...">
                <div id="div_genre" class = "div_error"></div>
    </div>

    <div class="form-group  ml-3 mr-3">
                <label for="label">Label</label>
                <input type="text" class="form-text form-control-md col-12 " name="label" id="label" placeholder="Entrer le Label (EMI, Warner, PolyGram, Universal ...">
                <div id="div_label" class = "div_error"></div>
    </div>

    <div class="form-group  ml-3 mr-3">
                <label for="prix">Prix</label>
                <input type="text" class="form-text form-control-md col-12 " name="prix" id="prix" placeholder="Entrer le prix">
                <div id="div_prix" class = "div_error"></div>
    </div>






</form>






    
</body>
</html>






<?php
    include("velvet_records_footer.php");           //  ===========  inclusion du bas de page (footer)  ==============
?>