                            //========================================
                            // définition des variables GLOBALES    ==
                            //========================================
var T = 0;                      //====  taille du tableau
var n = 0;                      //====  'n'ième position dans l'index
var TAB = new Array(),Number;   //====  définition du tableau en numérique
var i = (0);                    //====  compteur de boucle
var j = (0);                    //====  compteur de boucle
var MOY = (0);                  //====  résultat moyenne des entrées du tableau
var MAX = (0);                  //====  résultat valeur Maxi
var SUM = (0);                  //====  somme des entrées

                            //  =======================================
                            //  ======      les fonctions       =======
                            //  =======================================   



function InitTab()
    {
    TAB = new Array(T);
        console.log("Tableau créé, taille =  ",T,":InitTab passée");
    }



function SaisieTab()
    {
        for (i = 0 ; i < (T); i++)
        {
            console.log(i);
            TAB[i] = window.prompt(`Entrer valeur ${i}`);
        }
    }


function AfficheTab()
    {
        window.alert("Le tableau contient : "+TAB);
    }



function GetInteger()
    {
    T = Number(window.prompt("Entrer une taille de tableau :"));
    InitTab();
    SaisieTab();
            console.log("GetInteger passée");
            console.log(TAB);
    }




function InfoTab()  //==== Calcul du maximum et de la moyenne des postes
    {
            for ( i = 1; i< (T); i++)       //====      Calcul du MAX
                {
                    if (TAB[i] > TAB[(i-1)])
                    {
                        MAX = TAB [(i)];
                        console.log(MAX);
                    }
                }

            if (Number(TAB[0]) > MAX)
                {
                    MAX = Number(TAB[0]);
                }
                    
            for ( i = 0; i < T; i++)        //====      Calcul de la Moyenne
                {
                    SUM = (SUM + Number(TAB[i]));
                    console.log(SUM);
                }

                MOY = (SUM/T);

        console.log("InfoTab passée");
        console.log(MOY);
    
        window.alert("La Moyenne des valeurs du tableau est de :  " + MOY + " et le maxi est de :  " + MAX);
    }



function RechercheTab(n)
    {

        window.alert("Le "+(Number(n)+Number(1))+" ième mot de la chaine "+TAB+" est ("+TAB[n]);

    }    

                            //=====================================
                            //====      FIN  Fonctions         ====
                            //=====================================







                            //  =======================================
                            //  ======      les boutons       =========
                            //  =======================================   


var btn1 = document.createElement("BUTTON");        // Créer un élément <button>
var t1 = document.createTextNode("Tableau");        // Créer un noeud textuel
btn1.appendChild(t1);                               // Ajouter le texte au bouton
document.body.appendChild(btn1);                    // Ajoute la balise <button> à la balise <body>

        btn1.addEventListener("click",clickbtn1);
        function clickbtn1()
        {
            console.log("bouton1");
            AfficheTab()
        }



var btn2 = document.createElement("BUTTON");
var t2 = document.createTextNode("Index");
btn2.appendChild(t2);
document.body.appendChild(btn2);

        btn2.addEventListener("click",clickbtn2);
        function clickbtn2()
        {
            console.log("bouton2");
            n = window.prompt("Entrer le num d'index ( de 1 à "+(T)+") :");
            RechercheTab(n-1);

        }


var btn3 = document.createElement("BUTTON");
var t3 = document.createTextNode("Moy Max");
btn3.appendChild(t3);
document.body.appendChild(btn3);

        btn3.addEventListener("click",clickbtn3);
        function clickbtn3()
        {
            SUM = 0;
            MAX = 0;
            console.log("bouton3");
            InfoTab();
        }



    GetInteger();
