
//==== Variables contenant les champs du formulaire

var NOM = document.getElementById("nom");
var PRENOM = document.getElementById("prenom");
var FEMME = document.getElementById("femme").checked;
var HOMME = document.getElementById("homme").checked;
var DATE = document.getElementById("date");
var CODE = document.getElementById("code");
var EMAIL = document.getElementById("email");
var SUJET = document.getElementById("sujet");
var CHECK = document.getElementById("check");



//==== Variables contanant les filtres RegExp

var Filtre_NOM = new RegExp("^[A-Za-z]+[ -]*$");
var Filtre_PRENOM = new RegExp("^[A-Za-z -]+$");
var Filtre_DATE = new RegExp("^[0-9]{4}[-][0-9]{2}[-][0-9]{2}");
var Filtre_CODE = new RegExp("^[0-9]{5}$");
var Filtre_EMAIL = new RegExp("^[a-zA-Z0-9.-_]+[@]{1}[a-zA-Z0-9.-_]+[.]{1}[a-z]{2,10}$");

var Valid_CODE = false;     //====  Booléennes de validation
var Valid_DATE = false;     //
var Valid_EMAIL = false;    //
var Valid_NOM = false;      //
var Valid_PRENOM = false;   //
var Valid_GENRE = false;    //



//====  Actions sur les champs du formulaire

document.getElementById("nom").onchange = Fctn_NOM;
document.getElementById("nom").oninput = Fctn_NOM;
document.getElementById("prenom").onchange = Fctn_PRENOM;
document.getElementById("prenom").oninput = Fctn_PRENOM;
document.getElementById("femme").onchange = Fctn_GENRE;
document.getElementById("homme").onchange = Fctn_GENRE;
document.getElementById("femme").oninput = Fctn_GENRE;
document.getElementById("homme").oninput = Fctn_GENRE;
document.getElementById("code").onchange = Fctn_CODE;
document.getElementById("code").oninput = Fctn_CODE;
document.getElementById("email").onchange = Fctn_EMAIL;
document.getElementById("email").oninput = Fctn_EMAIL;
document.getElementById("date").onchange = Fctn_DATE;
document.getElementById("date").oninput = Fctn_DATE;

document.getElementById("ok").onclick = Fctn_ENVOI;     //====  Bouton Envoyer
document.getElementById("check").onchange = Fctn_ENVOI; //====  Changement d'état de la case à cocher


//  div_genre.style.color = "black";


//====  Les fonctions

function Fctn_ENVOI(event)                              //====  Si la case n'est pas cochée, abandon.
    {                       
        if ((!(document.getElementById("check").checked)))
            {
                console.log(" Case non cochée");
                document.getElementById("div_check").innerHTML = "Veuillez cocher la case !";
                div_check.style.backgroundColor="red";
                event.preventDefault();
            }
        else 
        {                                               //====  Si case cochée, lancement Fctn_ENVOI2
            console.log("+++++++++++++++++Lancement Fctn_ENVOI2");
            div_check.style.backgroundColor= "rgb(145, 233, 202)";
            document.getElementById("div_check").innerHTML = "bien !";
            Fctn_ENVOI2(event);
        }
    }



function Fctn_ENVOI2(event)
{
            console.log("  Case cochée");
            console.log("Valid_NOM    = " + Valid_NOM);
            console.log("Valid_PRENOM = " + Valid_PRENOM);
            console.log("Valid_GENRE = " + Valid_GENRE);
            console.log("Valid_DATE  = " + Valid_DATE);
            console.log("Valid_EMAIL = " + Valid_EMAIL);
            console.log("Valid_CODE = " + Valid_CODE);



        if(Valid_NOM == false)
            {
            console.log(".....Argument invalide =  NOM");
            document.getElementById("div_nom").innerHTML = "---->>  Veuillez saisir votre nom.";
            document.getElementById("div_nom").style.backgroundColor = "yellow";

            event.preventDefault();
            }

        if(Valid_PRENOM == false)
            {
            console.log(".....Argument invalide =  PRENOM");
            document.getElementById("div_prenom").innerHTML = "Veuillez saisir votre prénom.";
            document.getElementById("div_prenom").style.backgroundColor = "yellow";

            event.preventDefault();
            }

        if(Valid_GENRE == false)
            {
            console.log(".....Argument invalide = GENRE");
            document.getElementById("div_genre").style.backgroundColor = "yellow";
            document.getElementById("div_genre").innerHTML = ">>>  Veuillez indiquer le genre ! <<<";
            event.preventDefault();
            }

        if(Valid_DATE == false)
            {
            console.log(".....Argument invalide =  DATE");
            document.getElementById("div_date").style.backgroundColor = "yellow";
            document.getElementById("div_date").innerHTML = ">>>  Veuillez saisir votre date de naissance ! <<<";

            event.preventDefault();
            }

        if(Valid_CODE == false)
            {
            console.log(".....Argument invalide =  CODE");
            document.getElementById("div_code").style.backgroundColor = "yellow";
            document.getElementById("div_code").innerHTML = "Veuillez saisir le code postal.";

            event.preventDefault();
            }

        if(Valid_EMAIL == false)
            {
            console.log(".....Argument invalide =  EMAIL");
            document.getElementById("div_email").style.backgroundColor = "yellow";
            document.getElementById("div_email").innerHTML = "Veuillez saisir votre adresse e-mail.";
            event.preventDefault();
            }
}//==== sortie Fctn







function Fctn_NOM(event)
{
console.log("Fctn_NOM");
    Valid_NOM = Filtre_NOM.test(NOM.value);
        //console.log("===NOM = " + NOM.value);
        //console.log("===Filtre_NOM = " + Filtre_NOM);
        console.log("===Valid_NOM = " + Valid_NOM);
    if(NOM == "")
        {
        //document.getElementById("div_nom").innerHTML = "Veuillez saisir votre nom.";
        console.log("...NOM manquant");
        event.preventDefault();
        }
    else
        {
            if(Valid_NOM == false)
                {
                console.log("Nom invalide");
                document.getElementById("div_nom").innerHTML = "Nom non conforme";
                div_nom.style.color = "red";
                event.preventDefault();
                }
            else{
                console.log("NOM OK");
                console.log("Valid_NOM = " + Valid_NOM);
                document.getElementById("div_nom").innerHTML = "NOM correctement saisi !";
                document.getElementById("div_nom").style.backgroundColor = "rgb(145, 233, 202)";
                div_nom.style.color = "black";
                }
        }
}





function Fctn_PRENOM(event)
{
console.log("Fctn_PRENOM");
    Valid_PRENOM = Filtre_PRENOM.test(PRENOM.value);
        //console.log("PRENOM = " + PRENOM.value);
        //console.log("Filtre_PRENOM = " + Filtre_PRENOM);
        console.log("Valid_PRENOM = " + Valid_PRENOM);
    if(PRENOM == "")
        {
        console.log("...PRENOM manquant");
        event.preventDefault();
        }
    else
        {   
            if(Valid_PRENOM == false)
                {
                console.log("prénom invalide");
                document.getElementById("div_prenom").innerHTML = "prenom non conforme";
                div_prenom.style.color = "red";
                event.preventDefault();
                }
            else{
                console.log("PRENOM OK");
                console.log("Valid_PRENOM = " + Valid_PRENOM);
                document.getElementById("div_prenom").innerHTML = "PRENOM correctement saisi !";
                document.getElementById("div_prenom").style.backgroundColor = "rgb(145, 233, 202)";
                div_prenom.style.color = "black";
                }
        }
}





function Fctn_GENRE(event)
{
console.log("Fctn_GENRE");

    if ((HOMME.value == "") && (FEMME.value == ""))
        {
        console.log("Sélectionnez le Genre");
        Valid_GENRE = false;
        //document.getElementById("div_genre").innerHTML = "Sélectionnez le Genre";
        event.preventDefault();
    } 
    Valid_GENRE = true;
    document.getElementById("div_genre").style.backgroundColor = "rgb(145, 233, 202)";
    document.getElementById("div_genre").innerHTML = "Saisie Ok";

    div_genre.style.color = "Black";
}





function Fctn_CODE(event)
{
console.log("Fctn_CODE");
    Valid_CODE = Filtre_CODE.test(CODE.value);
    //console.log("CODE = " + CODE.value);
    //console.log("Filtre_CODE = " + Filtre_CODE);
    console.log("Valid_CODE = " + Valid_CODE);
    if(CODE == 0)
    {
    //document.getElementById("div_code").innerHTML = "Veuillez saisir le code postal.";
    console.log("...CODE manquant");
    event.preventDefault();
    }
    else
    {
        if(Valid_CODE == false)
            {
            console.log("Code invalide");
            document.getElementById("div_code").innerHTML = "C.P. non conforme";
            div_code.style.color = "red";
            event.preventDefault();
            }
        else{
            console.log("C.P. OK");
            document.getElementById("div_code").innerHTML = "C.P. correctement saisi !";
            document.getElementById("div_code").style.backgroundColor = "rgb(145, 233, 202)";
            div_code.style.color = "black";
            }
    }
}





function Fctn_DATE(event)
{
        console.log("Fctn_DATE");
        Valid_DATE = Filtre_DATE.test(DATE.value);
        console.log("DATE = " + DATE.value);
        //console.log("Filtre_DATE = " + Filtre_DATE);
        console.log("Valid_DATE = " + Valid_DATE);

    if(DATE == "")
        {
        //document.getElementById("div_date").innerHTML = "Veuillez saisir votre date de naissance.";
        console.log("...DATE manquante");
        event.preventDefault();
        }
    else
    {
        if(Valid_DATE == false)
            {
            console.log("Date invalide");
            document.getElementById("div_date").innerHTML = "Date non conforme";
            div_date.style.color = "red";
            event.preventDefault();
            }
            else
                {
                console.log("DATE OK");
                document.getElementById("div_date").innerHTML = "DATE correctement saisie !";
                div_date.style.color = "black";
                document.getElementById("div_date").style.backgroundColor = "rgb(145, 233, 202)";

                }
    }
}





function Fctn_EMAIL(event)
{
        console.log("Fctn_EMAIL");
        Valid_EMAIL = Filtre_EMAIL.test(EMAIL.value);
        console.log("EMAIL = " + EMAIL.value);
        //console.log("Filtre_EMAIL = " + Filtre_EMAIL);
        console.log("Valid_EMAIL = " + Valid_EMAIL);
    if(EMAIL == "")
        {
        console.log("...EMAIL manquante");
        event.preventDefault();
        }
    else
        {
        if(Valid_EMAIL == false)
            {
            console.log("Email invalide");
            document.getElementById("div_email").innerHTML = "e-mail non conforme";
            div_email.style.color = "red";
            event.preventDefault();
            }
        else{
            console.log("Email OK");
            document.getElementById("div_email").innerHTML = "EMAIL correctement saisie !";
            div_email.style.color = "black";
            document.getElementById("div_email").style.backgroundColor = "rgb(145, 233, 202)";
            }
        }
}



