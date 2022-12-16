                            //========================================
                            // définition des variables GLOBALES    ==
                            //========================================

var JEUNE = 0;
var MOYEN = 0;
var VIEUX = 0;
var AGE = 0;
//var TAB = new Array(),Number;   
//var DIM = 0;                    //====  dimension du tableau TAB

while (AGE < (100))
    {
        AGE = parseInt(window.prompt("Entrez un âge :"));

        console.log(AGE);

        if (AGE < 20){
            JEUNE++
            console.log("JEUNE++");
        }
        else if(AGE > (40))
        {
            VIEUX++
            console.log("VIEUX++");
        }
        else
        {
            MOYEN++
            console.log("MOYEN++");
        }
    }

    window.alert("Vous avez compté : "+ JEUNE + "moins de 20 ans " + MOYEN + " de 20 à 40 ans  et " + VIEUX + " de plus de 40 ans.");





