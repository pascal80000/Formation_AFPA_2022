/*     Exercice 5

var nom = window.prompt("Nom:");
var prenom = window.prompt("Prénom:");
if (window.confirm("Etes-vous un homme?") == true){
window.alert(("Bonjour Monsieur ")+prenom+nom)
}

*/

/*      Exercice 6 

var a = "100";
var b = 100;
var c = "1.00";
var d = true;

alert (a+b+c+d);
a = (a+c);(b = b--);
alert (a),(b);

*/

/*   Exercice 7.1   

var x = window.prompt("Entrer une valeur : ");
console.log("x= ",x);
document.writeln(x);
let y=x%2;

document.write(y);

if (y == 0){
    window.alert("Ce nombre est PAIR");

}
else window.alert("Ce nombre est impair");
*/


/*  Exercice 8.1

var n = 2;
var tableau = [n];

*/

/*      Exercice 8.2    */
/*      Exercice 8.3    */

/*      Exercice 8.4    

document.write("Exercice 4 - Multiples");
var N = window.prompt("Entrer N : ");
var X = window.prompt("Entrer X : ");
console.log(N,X);

for (i=0; i<=N; i++)
{

    R=(i*X);    
    document.write(i," x ",X," = ",R,);
    document.write("<br/>");
    console.log(i," x ",X," = ",R,);

}
*/

/*      Exercice 8.5    */

var io=0;                               //  indexOf()
var NV = 0;                             //  compteur de voyelles trouvées
var V = "aeiouyAEIOUYàèéôîê";           //  chaîne des voyelles
var M = window.prompt("Entrer un mot:");//  saisie du mot    
let L = M.length;                       //  longueur du mot
var LVS = "";                           //  la voyelle scrutée
var LV = V.length;                      //  Longueur de la chaîne des voyelles
var TAB = [L][LV];                      //  tableau 2 dimensions






            console.log("le mot ",M," comporte ",L," lettres");
document.write("Le mot ",M," comporte ",L," lettres");


for (im=1; im<=(L); im++)                       /*  boucle sur le mot */

{                

            console.log((im),"/",L);            /*  affichage de la position dans mot   */
    
    let LM = M.substring((im-1),im);            /*   extraction de la lettre            */

            console.log(LM);                    /*  Affichage de la lettre extraite*    */


        for (vm=0; vm<=(LV-1); vm++)             /*  boucle sur voyelles                 */
        
        {   
            let LVS = V.substring((vm),(vm+1));  /*  la voyelle testée                   */
            
            console.log("LVS=substring de V (vm,",vm,")=",LVS);

            let io = M.indexOf(LVS,(vm));
            io++;

            console.log("io=",io);

            if (LVS == LM){

                NV++;

                console.log("Nb de voyelles NV=",NV);
            }
        }
}

document.write("<br/>");

document.write("Dont ",NV," voyelles !");


