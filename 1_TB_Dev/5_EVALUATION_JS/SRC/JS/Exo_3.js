                            //========================================
                            // définition des variables GLOBALES    ==
                            //========================================

var TAB = ["Audrey", "Aurélien", "Flavien", "Jérémy", "Laurent", "Melik", "Nouara", "Salem", "Samuel", "Stéphane"];
var NOM = "";
var POS = 0;

document.write(TAB + "</br>");


NOM = window.prompt("Saisir le prénom recherché :");

if (TAB.indexOf(NOM) === -1)                        //====    en cas de NON trouvé
    {
        window.alert(" Pas de chance, y'a pas !!!");
    }
else
    {   
    //document.write(TAB + "</br>");
        POS = TAB.indexOf(NOM);    
        console.log("Avant splice : " + TAB);
        console.log("POS = " + POS);
        TAB.splice(Number(POS),1);
            console.log("Après splice : " + TAB);
        TAB.push("----");
            console.log("Après push : " +TAB);

    document.write(TAB + "</br>");
    window.alert("Le prénom :" + NOM + " a bien été retiré de la liste :");
    }

