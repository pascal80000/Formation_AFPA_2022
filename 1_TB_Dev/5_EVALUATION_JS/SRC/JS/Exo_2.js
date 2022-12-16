                            //========================================
                            // définition des variables GLOBALES    ==
                            //========================================

var X = 0;  //====  multiplicande
var Y = 0;  //====  résultat de la mutliplication X par i
var i = 0;  //====  compteur boucle ( multiplicateur )

function table()
    {
        document.write("</br>");

        for (i = 1; i <= 10; i++)
        {
            Y = ( i * X);
            console.log( Number(X) +"  x " + Number(i) + " = " + Number(Y));
            document.write( X + " x " + i + " = " + Y );
            document.write("</br>");
        }
    }


    X = window.prompt("Quel chiffre à multiplier ?  "); //====  entrée du multiplicande

    table();                                            //====  lancement du calcul

