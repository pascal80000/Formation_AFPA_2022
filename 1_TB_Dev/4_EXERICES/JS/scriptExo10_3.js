                            //========================================
                            // définition des variables GLOBALES    ==
                            //========================================
var TAB = new Array(),Number;   //====  définition du tableau 
var T = 0;                      //====  taille du tableau
//var L = Boolean;                //==== def. du type  du label 'L'
let L = true;                   //====  label passe à 'vrai'
var TABtmp = (0);               //====  tampon dans la permutation






T = Number(window.prompt("Entrer une taille de tableau :"));


TAB = new Array(T);


    for ( i = 0; i < T; i++)
    {
    // TAB[i] = window.prompt('Entrer la valeur ${i}'); ATTENTION aux "guillemets" : AltGr 7 ``
    TAB[i] = window.prompt(`Entrer la valeur ${i}`);
    }

    window.alert("Le tableau avant tri contient : "+TAB);


    //if (L = true)                               //====  tant qu'il y a une inversion, L est = vrai
    //{
        for ( i = 0; i < T; i++)
	    {
            console.log("Avant "+ i + ": "+TAB);

            if ( TAB[i] > TAB[(i+1)])
	        {   
                //L = true;
	            TABtmp = Number(TAB[i]);
	            TAB[i] = Number(TAB[(i+1)]);
	            TAB[(i+1)] = TABtmp;
                i =-1;
            }
            //L = false;
	    }
//    }

    window.alert("Le tableau après tri contient : "+TAB);
