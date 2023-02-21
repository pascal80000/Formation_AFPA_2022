<!DOCTYPE html>
<html lang="fr">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!--  Lien vers la feuille de style CSS de Bootstrap (toujours dans <head>)  -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
        crossorigin="anonymous">

        <title> == CONTACT == </title>
</head>


<body>

  <div class="container-fluid">

    <header class="row align-items-center">
            <div class="row align-items-center">
                <img class="col-3 ml-4 d-none d-lg-block"  src="/SRC/IMG/jarditou_logo.jpg" class="img-fluid" minwidth="100px" title="logo" alt="logo">
                <h3 class="col-8 text-right d-none d-lg-block">Tout le jardin</h3>  
            </div>
    </header>




      <nav class="row navbar navbar-expand-lg navbar-light bg-light align-items-left">

          <span class="col-2 ">
            <h4>Jarditou.com</h4>
          </span>


        <!-- Toggler/collapsible Button -->
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#NavbarHeader">
          <span class="navbar-toggler-icon"></span>
        </button> 
        
        
        <div class="collapse navbar-collapse justify-content-between" id="NavbarHeader">
          <ul class="col-2 navbar-nav">
            <li class="nav-item">
                <a class="h5 nav-link" href="index.html">Accueil</a>
            </li>
            <li class="nav-item">
                <a class="h5 nav-link" href="tableau.html">Tableau</a>
            </li>
            <li class="nav-item">
                <a class="h5 nav-link" href="contact.html"><strong>Contact</strong></a>
            </li>
          </ul>
          <div class="col-7">
            <form class="form-inline justify-content-end">
              <input class="form-control" type="search" placeholder="Votre promotion" aria-label="Search">
              <button class="btn btn-outline-success ml-3" type="submit">Rechercher</button>
            </form>
          </div>
        </div> 
  </nav>


      <div class="row">
        <img class="col ml-3 mr-3" src="/SRC/IMG/promotion.jpg"  title="mettre un lien vers les promotions......" alt="Votre navigateur n'affiche pas l'image !"> 
      </div>

  
  <p class="p-2 ml-2">* Ces zones sont obligatoires</p>
  



    <form action="contact2.php" method="post" id="formulaire">


              <legend class="h1 ml-3">Vos coordonnées</legend><!--             Titre de l'encadré  -->

              
              <div class="form-group  ml-3 mr-3">
                <label for="nom">Nom*</label>
                <input type="text" class="form-text form-control-md col-12 " name="nom" id="nom" placeholder="Veuillez saisir votre nom">
                <div id="div_nom" class = "div_error"></div>
              </div>
                

              <div class="form-group ml-3 mr-3">
                <label for="prenom">Prénom*</label>
                <input class="col-12"type="text" name="prenom" id="prenom" placeholder="Veuillez saisir votre prénom">
                <div id="div_prenom" class="div_error"></div>
              </div>




            <div class="form-group ml-3 mr-3 ">
              <label class="ml-3"> Sexe* </label></br>
              <div class="form-check form-check-inline ml-3 ">
                
                <input class="form-check-input" type="radio" name="femme" id="femme" value="femme">
                <label class="form-check-label p-1 mr-3 " for="femme">Féminin</label>
                <input class="form-check-input" type="radio" name="homme" value="homme" id="homme">
                <label class="form-check-label p-1" for="homme">Masculin</label>
                <div id="div_genre" class="div_error"></div>
              </div>
            </div>



              <div class="form-group ml-3 mr-3 ">
                <label for="naissance">Date de naissance*</label>
                <input class="col-12"type="date" name="naissance" id="date" placeholder="Veuillez saisir votre date de naissance" >
                <div id="div_date" class="div_error"></div>
              </div>

              <div class="form-group ml-3 mr-3">
                <label for="codepostal">Code postal*</label>
                <input class="col-12"type="number" name="codepostal" id="code"placeholder="Veuillez saisir votre code postal">
                <div id="div_code" class="div_error"></div>
              </div>  

              <div class="form-group ml-3 mr-3">
                <label for="adresse">Adresse : </label>
                <input class="col-12"type="text" name="adresse" id="adresse" placeholder="Veuillez saisir votre adresse">
                <div id="div_adresse" class="div_error"></div>
              </div>

              <div class="form-group ml-3 mr-3">
                <label for="ville">Ville : </label>
                <input class="col-12"type="text" name="ville" id="ville" placeholder="Veuillez saisir votre ville">
                <div id="div_ville" class="div_error"></div>
              </div>

              <div class="form-group ml-3 mr-3">
                <label for="email">Email* : </label>
                <input class="col-12"type="email" name="email" id="email" placeholder="Veuillez saisir votre adresse e-mail">
                <div id="div_email" class="div_error"></div>
              </div>




              <div class="form-group ml-3 mr-3">
                <label for="sujet">Sujet</label>
                <select id="sujet" class="form-control">
                    <option selected>Veuillez sélectionner un sujet...</option>
                    <option>PAS CONTENT</option>
                    <option>trop cher</option>
                    <option>pas fiable</option>
                    <option>trop lourd</option>
                    <option>consomme trop</option>
                    <option>grillé </option>
                    <option>cramé </option>
                    <option>Remboursement</option>
                    <option>j'vais le dire à ma mère !</option>
                </select>
              </div>



          <div class="form-group ml-3 mr-3">
            <label for="texte">Votre question:</label>
              <textarea class="col-12" id="texte" name="texte" placeholder="Veuillez saisir votre requête..."> 
              </textarea>
            </div>



          <div class="form-group ml-4 mr-3">
            <div class="form-check p-3">
            <input class="form-check-input" type="checkbox" name="check" id="check">
            <label class="form-check-label" for="check">* J'accepte le traitement informatique de ce formulaire.</label></br>
            <div id="div_check" class="div_error"></div>
          </div>
          </div>

        
        <input type="submit" class="mb-3 ml-3 bg-dark text-light" id="ok" value = "Envoyer">   <input type="reset" class=" bg-dark text-light" value = "Annuler">


    </form> <!--===================  F I N   D U   F O R M U L A I R E  =====================================-->


    <footer>
      <nav class="row navbar navbar-expand-lg navbar-dark bg-dark rounded m-3">
        <!-- Toggler/collapsible Button -->
          <button class="col-auto ml-2 navbar-toggler" type="button" data-toggle="collapse" data-target="#NavbarFooter">
            <span class="navbar-toggler-icon"></span>
          </button> 
          
          
              <div class="collapse navbar-collapse justify-content-between" id="NavbarFooter">
                <ul class="navbar-nav ">
                  <li class="nav-item">
                      <a class="nav-link" href="mentions.html">mentions légales</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="horaires.html">horaires</a>
                  </li>
                  <li class="nav-item">
                      <a class="nav-link" href="plan.html">plan du site</a>
                  </li>
                </ul>
              </div> 
        </nav>
      </footer>






        <!--  Ci-dessous -->
        <!-- Les fichiers JS nécéssaires au Bootstrap, à placer à la fin du Body  ATTENTION : l'ordre des fichiers est à respecter (JQuery, Popper puis Bootstrap) -->
        <!-- NB: Popper JS est optionnel ; il permet notamment de créer et de mettre en forme des infobulles (ex: messages d'erreur à l'utilisateur dans des formulaires)   -->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

        <script src="/SRC/JS/contact.js"></script>


  </div>  <!--   Fermeture du container   -->


</body>

</html>
