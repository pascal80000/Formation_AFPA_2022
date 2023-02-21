                            //========================================
                            // définition des variables GLOBALES    ==
                            //========================================

var PU = 0;     //==== prix unitaire
var QTE = 0;    //==== quantité commandée
var TOT = 0;    //==== total ( QTE x PU )
var REM = 0;    //==== remise
var PORT = 0;   //==== frais de port
var TOTrem = 0  //==== total remisé
var PAP = 0;    //==== prix à payer



PU = window.prompt("Entrer le prix unitaire :");
QTE = window.prompt("Entrer la quantité ");

/*
TOT = ( PU * QTECOM )
la remise est de 5% si TOT est compris entre 100 et 200 € et de 10% au-delà

le port est gratuit si le prix des produits ( le total remisé ) est supérieur à 500 €.
Dans le cas contraire, le port est de 2%
la valeur minimale du port à payer est de 6 €
*/


TOT = ( PU*QTE);
console.log("TOT = " + TOT);

    if (TOT < (100))
        {
            REM = 0;
        }
    else if(TOT < 500){
            REM = (0.95);
    }
    else{
            REM = (0.9);
    }
console.log("REM = " + REM);



TOTrem = (TOT * REM);
console.log("TOTrem = " + TOTrem);


if(TOTrem > 500)
    {
        PORT = 0;
    }
else
    {
        PORT = (0.02 * TOTrem);
    }
console.log("PORT = " + PORT);

if(PORT < 6)
    {
        PORT = 6;
    }
console.log("PORT = " + PORT);

PORT = Math.round(PORT*100)/100;          //========== ERREUR d'arrondi à revoir
console.log("PORT arrondi = " + PORT);

