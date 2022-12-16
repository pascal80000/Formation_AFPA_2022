var TAILLE = window.prompt("Entrer une taille de tableau :");
let T = parseInt(TAILLE);
var TAB = new Array(T);
var i = (0);


        console.log("TAILLE:",TAILLE,", T:",T);


for (i = 0; i < (T); i++)
{
        console.log(i);
        TAB[i] = window.prompt(`Entrer valeur ${i}`);


}



for (i = 0; i < (T); i++)
{
        document.write(TAB[i],"<br/>");

}
document.write("<br/>","Trop content !!!!","<br/>","ça maaaaaaaaaaarche !!!!!");
