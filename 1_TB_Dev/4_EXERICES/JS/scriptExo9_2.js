// Exercice 9_2

//==========================================
//====         les variables            ====
//==========================================

var str1 = "";          // contiendra la liste
var str2 = "";          // contiendra le signe séparateur
var n = 0;              // sera saisi pour recherche d'index
chaine = new Array();   // contiendra le split
var nom = "";           // contiendra le résultat de la fonction
//var l = 0;


//==========================================
//====          les entrées             ====
//==========================================


        var str1 = prompt("saisir la liste de noms, séparés par un signe ");
                document.write('<br/>'+"_ str1= ",str1);

        var str2 = prompt("Entrer le signe séparateur");
                document.write('<br/>'+"_ str2= ",str2);

        var n = prompt("Entrer l'index à rechercher : ");
                document.write('<br/>'+"_  n == ",n,'<br/>');
        var prem = "";
        var chaine = "";




//==========================================
//====      la fonction strtok()        ====
//==========================================

        function strtok(chaine, str2,n)
        {
                chaine = str1.split([str2]);                    //====       .split crée le tableau 'chaine' à partir de la chaine de caractères 'str1'
                                                                //====          et du séparateur 'str2' détecté dans la chaine 'str1'
                        console.log("chaine = ",chaine);

                L = chaine.length;                              //====        affichage de la longueur de tableau (nombre de cellules)
                        console.log("chaine comporte ",L," mots détectés.");//  (purement cosmétique !)

                chaine.splice(0,(n));                           //====          coupe les 'n' premiers caractères à partir du 'zero'

                prem = chaine.shift();                          //====          shift renvoie le premier terme du tableau, et le supprime du même tableau
                        console.log("prem = ",prem);
                        //document.write("prem =: ",prem);
                        //document.write("<br/>","reste de chaine =: ",chaine);
                return;


        }       
//====      FIN  Fonction               ====

//====   lancement de la fonction        ====
strtok(chaine, str2,n);

//====      affichage du résultat   ====
document.write('<br/>',"Le ",n," ième mot de la chaine "+chaine+" est ("+prem+") voilà, c'est fini !");
