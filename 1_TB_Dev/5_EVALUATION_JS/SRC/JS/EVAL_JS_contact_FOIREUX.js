/*
var TI = Boolean;
var ok = Boolean;
var erreur;
var prenom = document.getElementById("prenom");
var genre = document.getElementById("genre");
var date = document.getElementById("naissance");
var adresse = document.getElementById("adresse");
var ville = document.getElementById("ville");
var sujet = document.getElementById("sujet");
var femme = document.getElementById("femme");
var homme = document.getElementById("homme");
var VALIDemail = Boolean;
var Reg_email = RegExp;
var code = Number;





console.log(nom.value + prenom.value + homme.value + femme.value);
console.log(date.value + code.value + adresse.value + ville.value);
console.log(email.value + sujet.value);


var ENVOI = document.getElementById("ok");
ENVOI.addEventListener("click", envoyer);
//console.log("ENVOI : " + ENVOI.value);

function envoyer(e)
{
    let ok = (document.getElementById("check"));
    console.log("Case chekée? = " + ok.value);
    
    if (!ok)
        {
        document.getElementById("div_ok").innerHTML("Cochez la case pour envoyer ! ");
        div_ok.style.color = "red";
        e.preventDefault();
        }
    else
        {
        verif_form;
        }
}

function verif_form(event)
{
        //==== test nom
    let nom = document.getElementById("nom");
    console.log("le nom : " + nom.value);
    
    if (nom.value == "")
        {
        document.getElementById("nom").innerHTML = "Veuillez renseigner votre nom";
        div_nom.style.color = "red";
        console.log("Manque le Nom");
        event.preventDefault();
        }
    else
        {
        console.log("else le Nom :" + nom.value);
        let Reg_nom = new RegExp("^[A-Za-zé -._èç]+$");    
        let TESTnom = Reg_nom.test(nom.value);
        console.log("Reg_nom : " + Reg_nom);
        console.log("TESTnom : " + TESTnom);
        }
        if (TESTnom == false) 
            {
            document.getElementById("nom").innerHTML = "Nom non conforme";
            div_nom.style.color = "red";
            console.log("Nom non conforme");
            event.preventDefault();
            }
            else
                {
                document.getElementById("div_nom").innerHTML = "Nom OK";
                div_nom.style.color = "green";
                //event.preventDefault();
                }


        //==== test prenom
        let prenom = document.getElementById("prenom");
        console.log("le prenom : " + prenom.value);
        
        if (prenom.value == "")
            {
            document.getElementById("div_prenom").innerHTML = "Veuillez renseigner votre prenom";
            div_nom.style.color = "red";
            event.preventDefault();
            console.log("Manque le prénom");
            }
        else
            {
            console.log("else le prénom :" + prenom.value);
            let Reg_prenom = new RegExp("^[A-Za-zé -._èç]+$");    
            let TESTprenom = Reg_prenom.test(prenom.value);
            console.log("Reg_prenom : " + Reg_prenom);
            console.log("TESTprenom : " + TESTprenom);
    
            if (TESTprenom == false) 
                {
                document.getElementById("div_prenom").innerHTML = "prénom non conforme";
                div_prenom.style.color = "red";
                console.log("prénom non conforme");
                event.preventDefault();
                }
                else
                {
                document.getElementById("div_prenom").innerHTML = "prénom OK";
                div_prenom.style.color = "green";
                //event.preventDefault()
                }
            }    

        //====  test genre

        console.log("cases genre : Homme=" + homme.value + "  Femme=" + femme.value);
        let H = (document.getElementById("homme").checked);
        let F = (document.getElementById("femme").checked);
        console.log("checks = " + H + F);
    if (!H && !F)
        {
        console.log("Manque le genre");
        document.getElementById("div_genre").innerHTML = "Veuillez sélectionner genre correspondant";
        div_genre.style.color = "red";
        event.preventDefault();
        }   
        else{
            document.getElementById("div_genre").innerHTML = "Genre OK";
            div_genre.style.color = "green";
            }

        //====  test date
        


        //====  test code postal
    let code = document.getElementById("codepostal");

    if (code == 0)
        {
        document.getElementById("codepostal").innerHTML = "Veuillez renseigner le C.P.";
        div_code.style.color = "red";
        console.log("Code postal vide !");
        event.preventDefault()
        }
        else
            {
            var Reg_code = new RegExp('^[0-9]{5}$');
            var VALIDcode = Reg_code.test(code.value);
            console.log("CP = " + code.value);
            console.log("Reg_code = " + Reg_code.value);
            console.log("VALIDcode = " + VALIDcode.value);
            document.getElementById("codepostal").innerHTML = "C.P.  ok";
            div_code.style.color = "green";
            }

    if(!VALIDcode)
        {
        document.getElementById("codepostal").innerHTML = "code postal non conforme !";
        div_code.style.color = "red";
        console.log("code postal non conforme ! ");
        event.preventDefault();
        }

        else{
            document.getElementById("codepostal").innerHTML = "code postal ok !";
            div_code.style.color = "green";
            console.log("code postal OK ! ");
            }



        //====  test email
    
    let EMAIL = document.getElementById("email")
        console.log("1 EMAIL = " + EMAIL.value);
        
    if (EMAIL == "")
        {
        console.log("EMAIL = vide");
        document.getElementById("div_email").innerHTML = "Veuillez entrer une adresse email";
        div_email.style.color = "red";
        event.preventDefault();
        }

        else
            {
            var Reg_email = new RegExp('^[a-zA-Z0-9.-_]+[@]{1}[a-zA-Z0-9.-_]+[\.]{1}[a-z]{2,10}$','s');
            var VALIDemail = Reg_email.test(EMAIL.value);
            //console.log("else EMAIL = " + EMAIL.value);
            //console.log("else Reg_email = " + Reg_email.value);
            //console.log("else VALIDemail = " + VALIDemail.value);
            }
    //console.log("VALIDemail = " + VALIDemail.value);
    if (!VALIDemail){
        document.getElementById("div_email").innerHTML = "Veuillez entrer une adresse valide";
        div_email.style.color = "red";
        event.preventDefault();
        }
        else 
            {
            document.getElementById("div_email").innerHTML = "email OK";
            div_email.style.color = "green";
            }
}
*/



var TI = Boolean;
var ok = "";
var erreur;
var prenom = document.getElementById("prenom");
var genre = document.getElementById("genre");
var date = document.getElementById("naissance");
var code = document.getElementById("codepostal");
var adresse = document.getElementById("adresse");
var ville = document.getElementById("ville");
var sujet = document.getElementById("sujet");
var femme = document.getElementById("femme");
var homme = document.getElementById("homme");
var VALIDemail;
var Reg_email;






console.log(nom.value + prenom.value + homme.value + femme.value);
console.log(date.value + code.value + adresse.value + ville.value);
console.log(email.value + sujet.value);



var ENVOI = document.getElementById("ok");
ENVOI.addEventListener("click", envoyer);
console.log("ENVOI : " + ENVOI.value);

function envoyer(e)
{
    if (document.getElementById("check").checked)
        {
        console.log("Lancement de la fctn verif_form");
        verif_form;
        }
    else
        {
        console.log("verif_form ABORT");
        document.getElementById("check").innerHTML = "Cochez la case pour envoyer ! ";
        check.style.color = "red";
        e.preventDefault();
        }
}

 /*

function verif_form(event)
{
       //==== test nom
        //==== test nom
        let nom = document.getElementById("nom");
        console.log("le nom : " + nom.value);
        
        if (nom.value == "")
            {
            document.getElementById("nom").innerHTML = "Veuillez renseigner votre nom";
            div_nom.style.color = "red";
            console.log("Manque le Nom");
            event.preventDefault();
            }
        else
            {
            console.log("else le Nom :" + nom.value);
            let Reg_nom = new RegExp("^[A-Za-zé -._èç]+$");    
            let TESTnom = Reg_nom.test(nom.value);
            console.log("Reg_nom : " + Reg_nom);
            console.log("TESTnom : " + TESTnom);
            }
            if (TESTnom == false) 
                {
                document.getElementById("nom").innerHTML = "Nom non conforme";
                div_nom.style.color = "red";
                console.log("Nom non conforme");
                event.preventDefault();
                }
                else
                    {
                    document.getElementById("div_nom").innerHTML = "Nom OK";
                    div_nom.style.color = "green";
                    //event.preventDefault();
                    }



        //==== test prenom
        let prenom = document.getElementById("prenom");
        console.log("le prenom : " + prenom.value);
        
        if (prenom.value == "")
            {
            document.getElementById("div_prenom").innerHTML = "Veuillez renseigner votre prenom";
            div_nom.style.color = "red";
            event.preventDefault();
            console.log("Manque le prénom");
            }
        else
            {
            console.log("else le prénom :" + prenom.value);
            let Reg_prenom = new RegExp("^[A-Za-zé -._èç]+$");    
            let TESTprenom = Reg_prenom.test(prenom.value);
            console.log("Reg_prenom : " + Reg_prenom);
            console.log("TESTprenom : " + TESTprenom);
    
            if (TESTprenom == false) 
                {
                document.getElementById("div_prenom").innerHTML = "prénom non conforme";
                div_prenom.style.color = "red";
                event.preventDefault();
                console.log("prénom non conforme");
    
                }
            if(TESTprenom == true)
                {
                document.getElementById("div_prenom").innerHTML = "prénom OK";
                div_prenom.style.color = "green";
                }
            }    

        //====  test genre

        //console.log("cases genre : Homme=" + homme.value + "  Femme=" + femme.value);
        let H = (document.getElementById("homme"));
        let F = (document.getElementById("femme"));
        console.log("checks = " + H + F);
        if (!H && !F)
            {
            console.log("Manque le genre");
            document.getElementById("div_genre").innerHTML = "Veuillez sélectionner genre correspondant";
            div_genre.style.color = "red";
            event.preventDefault();
            }   
        else{
            document.getElementById("div_genre").innerHTML = "Genre OK";
            div_genre.style.color = "green";
        }

        //====  test date
        


        //====  test code postal
        


        //====  test email


    
    let EMAIL = document.getElementById("email")


        
    if (EMAIL == "")
    {
        console.log("EMAIL = vide");
        document.getElementById("div_email").innerHTML = "Veuillez entrer une adresse email";
        div_email.style.color = "red";
        event.preventDefault();
    }
    else{
        let Reg_email = new RegExp('^[a-zA-Z0-9.-_]+[@]{1}[a-zA-Z0-9.-_]+[\.]{1}[a-z]{2,10}$','s');
        let VALIDemail = Reg_email.test(EMAIL.value);
        console.log("EMAIL = " + EMAIL);
        console.log("Reg_email = " + Reg_email.value);
        console.log("VALIDemail = " + VALIDemail.value);
    }

    console.log("VALIDemail = " + VALIDemail.value);
    if (!VALIDemail){
        document.getElementById("div_email").innerHTML = "Veuillez entrer une adresse valide";
        div_email.style.color = "red";
        event.preventDefault();
        }
    else {
        document.getElementById("div_email").innerHTML = "email OK";
        div_email.style.color = "green";
    }
}*/


