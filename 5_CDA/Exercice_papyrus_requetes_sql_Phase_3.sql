/*Exercice_papyrus_requetes_sql_Phase_3*/


/*1. Quelles sont les commandes du fournisseur 09120 ?*/
SELECT numcom
FROM entcom
WHERE numfou = 9120;

+--------+
| numcom |
+--------+
|  70020 |
|  70300 |
+--------+



/*2. Afficher le code des fournisseurs pour lesquels des commandes ont été passées. */
SELECT numfou
FROM entcom
WHERE numcom != 0;

+--------+
| numfou |
+--------+
|    120 |
|    120 |
|    120 |
|    540 |
|    540 |
|   8700 |
|   9120 |
|   9120 |
|   9150 |
|   9180 |
+--------+



/*3. Afficher le nombre de commandes fournisseurs passées, et le nombre de fournisseurs concernés.*/
SELECT DISTINCT numfou, COUNT(numcom)
FROM entcom
GROUP BY numfou;

+--------+---------------+		!!!!!!!!!!!
| numfou | COUNT(numcom) |		! PAS BON !
+--------+---------------+		!!!!!!!!!!!
|    120 |             3 |
|    540 |             2 |
|   8700 |             1 |
|   9120 |             2 |
|   9150 |             1 |
|   9180 |             1 |
+--------+---------------+



/*4. Editer les produits ayant un stock inférieur ou égal au stock d'alerte et
dont la quantité annuelle est inférieur est inférieure à 1000
(informations à fournir : n° produit, libellé produit, stock, stock actuel
d'alerte, quantité annuelle)*/
SELECT "Code : ",codart," Libellé : ", libart," Qté Ann. : ", qteann
FROM produit
WHERE (stkphy <= stkale) AND (qteann < 1000) AND (qteann > 0);

+---------+--------+--------------+------------------------+---------------+--------+
| Code :  | codart | Libellé :    | libart                 | Qté Ann. :    | qteann |
+---------+--------+--------------+------------------------+---------------+--------+
| Code :  | B002   |  Libellé :   | Bande magnétique 6250  |  Qté Ann. :   |    410 |
| Code :  | R080   |  Libellé :   | ruban Epson 850        |  Qté Ann. :   |    120 |
+---------+--------+--------------+------------------------+---------------+--------+




/*5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
L’affichage (département, nom fournisseur) sera effectué par
département décroissant, puis par ordre alphabétique*/
SELECT "Cde postal: ",posfou," Fournisseur: ", nomfou
FROM fournis
WHERE posfou LIKE "75%" OR posfou LIKE "78%" OR posfou LIKE "92%" OR posfou LIKE "77%"
GROUP BY posfou;

+--------------+--------+----------------+-----------+
| Cde postal:  | posfou | Fournisseur:   | nomfou    |
+--------------+--------+----------------+-----------+
| Cde postal:  | 75014  |  Fournisseur:  | MEDICIS   |
| Cde postal:  | 78250  |  Fournisseur:  | ECLIPSE   |
| Cde postal:  | 78440  |  Fournisseur:  | HURRYTAPE |
| Cde postal:  | 92200  |  Fournisseur:  | GROBRIGAN |
+--------------+--------+----------------+-----------+




/*6. Quelles sont les commandes passées au mois de mars et avril ?*/
SELECT "Numéro de commande",numcom,"Date de commande : ",datcom
FROM entcom 
WHERE datcom LIKE "%-03-%" OR datcom LIKE "%-04-%";

+---------------------+--------+---------------------+---------------------+
| Numéro de commande  | numcom | Date de commande :  | datcom              |
+---------------------+--------+---------------------+---------------------+
| Numéro de commande  |  70010 | Date de commande :  | 2018-04-23 15:59:51 |
| Numéro de commande  |  70025 | Date de commande :  | 2021-04-13 16:17:45 |
| Numéro de commande  |  70629 | Date de commande :  | 2022-04-02 19:58:16 |
+---------------------+--------+---------------------+---------------------+



/*7. Quelles sont les commandes du jour qui ont des observations
particulières ?
(Affichage numéro de commande, date de commande)*/
SELECT DISTINCT numcom," laDate de commande :",DATE_FORMAT(datcom, %d/%m/%Y)
FROM entcom
JOIN fournis ON entcom.numfou = fournis.numfou 
WHERE satisf > 0 AND datcom = DATE_FORMAT(DATETIME(), %d/%m/%Y);

