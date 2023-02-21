<?php
    include"velvet_records_header.php";           //  ===========  inclusion de l'entête (header)  =================




    include"fonctions.php";                       //  ===========  inclusion des fonctions  ========================


    $db = ConnexionBase("record");


    $requete = $db -> query                         //  ===========  début de la requête sql  ========================
    ("
        SELECT * FROM disc 
        JOIN artist ON disc.artist_id = artist.artist_id
        ORDER BY artist_name, disc_title
    ");

    $tab = $requete->fetchAll(PDO::FETCH_OBJ);

    $requete->closeCursor();                        //  ===========  fermeture de la requête sql  =====================
?>

<body>

<a>
    <div class = "col-10">Liste des disques (<?php echo count($tab) ?>)
    <a href="disc_new.php"><button type="button" class="col-1 btn btn-primary" id="bouton_ajouter">Ajouter</button></a>
    </div>

</a>

<div class = "conteneur-grid">

    <?php
        foreach ($tab as $disc):
    ?>


        <div class="wraper">
            
            <tr>
                    <td>
                        <img class = "item1" src = "../SRC/jaquettes/<?=$disc->disc_picture?>" alt="jaquette du disque" title = "Jaquette_disque" height="200px" width="auto">
                    </td>
                        <td><strong><?=$disc->disc_title ?> </strong></br></td>
                        <td><strong><?=$disc->artist_name?> </strong></br></td>
                        <td><strong>Label :   </strong></a><a class = "text-muted">   <?=$disc->disc_label    ?></br></a></td>
                        <td><strong>Année :   </strong></a><a class = "text-muted">   <?=$disc->disc_year     ?></br></a></td>
                        <td><strong>Genre   : </strong></a><a class = "text-muted">   <?=$disc->disc_genre    ?></br></a></td>
                </tr>


            <div class="detail">
                        <a href="disc_detail.php?id=<?= $disc->disc_id ?>"><button type="button" class="btn btn-primary" id="bouton_details">Détails</button></a>
            </div>
            
        </div>



    <?php endforeach; ?>

</div>





<?php
    include("velvet_records_footer.php");           //  ===========  inclusion du bas de page (footer)  ==============
?>
