-- Active: 1678803646529@@127.0.0.1@3306
--Exercice_papyrus_requetes_sql_Phase_3


-- 1. Quelles sont les commandes du fournisseur 09120 ?

SELECT numcom
FROM entcom
WHERE numfou = 9120;
/*
+--------+
| numcom |
+--------+
|  70020 |
|  70300 |
+--------+*/



--2. Afficher le code des fournisseurs pour lesquels des commandes ont été passées. 

SELECT numfou
FROM entcom
WHERE numcom != 0;
/*
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
+--------+*/



-- 3. Afficher le nombre de commandes fournisseurs passées, 
--    et le nombre de fournisseurs concernés.

SELECT DISTINCT numfou, COUNT(numcom)
FROM entcom
GROUP BY numfou;
/*
+--------+---------------+		!!!!!!!!!!!
| numfou | COUNT(numcom) |		! PAS BON !
+--------+---------------+		!!!!!!!!!!!
|    120 |             3 |
|    540 |             2 |
|   8700 |             1 |
|   9120 |             2 |
|   9150 |             1 |
|   9180 |             1 |
+--------+---------------+*/



-- 4. Editer les produits ayant un stock inférieur ou égal au stock d'alerte et
--    dont la quantité annuelle est inférieur est inférieure à 1000
--    (informations à fournir : n° produit, libellé produit, stock, stock actuel
--    d'alerte, quantité annuelle)

SELECT "Code : ",codart," Libellé : ", libart," Qté Ann. : ", qteann
FROM produit
WHERE (stkphy <= stkale) AND (qteann < 1000) AND (qteann > 0);
/*
+---------+--------+--------------+------------------------+---------------+--------+
| Code :  | codart | Libellé :    | libart                 | Qté Ann. :    | qteann |
+---------+--------+--------------+------------------------+---------------+--------+
| Code :  | B002   |  Libellé :   | Bande magnétique 6250  |  Qté Ann. :   |    410 |
| Code :  | R080   |  Libellé :   | ruban Epson 850        |  Qté Ann. :   |    120 |
+---------+--------+--------------+------------------------+---------------+--------+*/




-- 5. Quels sont les fournisseurs situés dans les départements 75 78 92 77 ?
--    L’affichage (département, nom fournisseur) sera effectué par
--    département décroissant, puis par ordre alphabétique

SELECT "Cde postal: ",posfou," Fournisseur: ", nomfou
FROM fournis
WHERE posfou LIKE "75%" 
                OR posfou LIKE "78%" 
                OR posfou LIKE "92%" 
                OR posfou LIKE "77%"
ORDER BY posfou;

/*
+--------------+--------+----------------+-----------+
| Cde postal:  | posfou | Fournisseur:   | nomfou    |
+--------------+--------+----------------+-----------+
| Cde postal:  | 75014  |  Fournisseur:  | MEDICIS   |
| Cde postal:  | 78250  |  Fournisseur:  | ECLIPSE   |
| Cde postal:  | 78440  |  Fournisseur:  | HURRYTAPE |
| Cde postal:  | 92200  |  Fournisseur:  | GROBRIGAN |
+--------------+--------+----------------+-----------+*/




-- 6. Quelles sont les commandes passées au mois de mars et avril ?

SELECT "Numéro de commande",numcom,"Date de commande : ",datcom
FROM entcom 
WHERE datcom LIKE "%-03-%" OR datcom LIKE "%-04-%";

/*
+---------------------+--------+---------------------+---------------------+
| Numéro de commande  | numcom | Date de commande :  | datcom              |
+---------------------+--------+---------------------+---------------------+
| Numéro de commande  |  70010 | Date de commande :  | 2018-04-23 15:59:51 |
| Numéro de commande  |  70025 | Date de commande :  | 2021-04-13 16:17:45 |
| Numéro de commande  |  70629 | Date de commande :  | 2022-04-02 19:58:16 |
+---------------------+--------+---------------------+---------------------+*/




-- 7. Quelles sont les commandes du jour qui ont des observations particulières ?
--    (Affichage numéro de commande, date de commande)

SELECT DISTINCT numcom," Date de commande :", LEFT(datcom,10)
FROM entcom,fournis         /* Remplace: JOIN fournis ON entcom.numfou = fournis.numfou  */ 
WHERE obscom != "" AND LEFT(datcom,10) = DATE(NOW());


-- Empty set (0,001 sec) résultat 'vide' car pas de commande ce jour présent !
/*
+--------+---------------------+-----------------+      Testé en remplaçant
| numcom | Date de commande :  | LEFT(datcom,10) |      le 'AND' par un 'OR'
+--------+---------------------+-----------------+      pour vérifier la condition sur 'obscom non vide'
|  70011 |  Date de commande : | 2020-05-21      |
|  70025 |  Date de commande : | 2021-04-13      |
|  70210 |  Date de commande : | 2021-06-05      |
|  70250 |  Date de commande : | 2021-08-02      |
+--------+---------------------+-----------------+*/





-- 8. Lister le total de chaque commande par total décroissant
--    (Affichage numéro de commande et total)

SELECT numcom, SUM(qtecde * priuni) AS total
FROM ligcom
GROUP BY numcom
ORDER BY total DESC;

/*
+--------+-----------+
| numcom | total     |
+--------+-----------+
|  70250 | 107000000 |
|  70010 |  36068000 |
|  70011 |  35600000 |
|  70625 |  35470000 |
|  70025 |    885000 |
|  70210 |    470000 |
|  70620 |    120000 |
|  70020 |     56000 |
|  70629 |     56000 |
|  70300 |     39500 |
+--------+-----------+*/




-- 9. Lister les commandes dont le total est supérieur à 10 000€ ; on exclura
--    dans le calcul du total les articles commandés en quantité supérieure
--    ou égale à 1000.
--    (Affichage numéro de commande et total)

SELECT numcom, (qtecde * priuni) AS total
FROM ligcom
WHERE ((qtecde * priuni) > 10000) AND qtecde > 1000
GROUP BY numcom
ORDER BY total DESC;




-- 10. Lister les commandes par nom fournisseur
--     (Afficher le nom du fournisseur, le numéro de commande et la date)

SELECT nomfou, numcom, LEFT(datcom,10)
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
ORDER BY fournis.nomfou;






-- 11. Sortir les produits des commandes ayant le mot "urgent' en observation?

SELECT DISTINCT produit.codart, libart  /*, obscom*/
FROM produit,ligcom,entcom
WHERE obscom LIKE '%urgen%'
ORDER BY codart;





-- 12. Coder de 2 manières différentes la requête suivante :
--     Lister le nom des fournisseurs susceptibles de livrer au moins un article

SELECT nomfou
FROM fournis, vente
WHERE ((qte1 + qte2 + qte3) != 0)
GROUP BY nomfou;


SELECT nomfou
FROM fournis, vente, produit
WHERE produit.stkphy != 0
GROUP BY nomfou;



-- 13. Coder de 2 manières différentes la requête suivante
--     Lister les commandes (Numéro et date) dont le fournisseur est celui de
--     la commande 70210 :

SELECT entcom.numcom, LEFT(datcom,10)
FROM entcom, fournis
WHERE numcom = 70210
GROUP BY numcom;


SELECT entcom.numcom, LEFT(datcom,10)       -- A REVOIR
FROM ligcom, fournis, entcom
WHERE ligcom.numcom = 70210
GROUP BY entcom.numcom;




-- 14. Dans les articles susceptibles d’être vendus, lister les articles moins
--     chers (basés sur Prix1) que le moins cher des rubans (article dont le
--     premier caractère commence par R). On affichera le libellé de l’article
--     et prix1

SELECT codart, libart
FROM produit, vente
WHERE (MIN(prix1)<(MIN(prix1)WHERE LEFT(libart,1)='r'));



-- 15. Editer la liste des fournisseurs susceptibles de livrer les produits
--     dont le stock est inférieur ou égal à 150 % du stock d'alerte. La liste est
--     triée par produit puis fournisseur

SELECT produit.codart, libart, stkphy, stkale
FROM produit
JOIN vente ON produit.codart = vente.codart
WHERE stkphy <= (1.5 * stkale);



-- 16. Éditer la liste des fournisseurs susceptibles de livrer les produit dont
--     le stock est inférieur ou égal à 150 % du stock d'alerte et un délai de
--     livraison d'au plus 30 jours. 
--     La liste est triée par fournisseur puis produit

SELECT fournis.numfou, nomfou, stkphy, stkale, delliv
FROM produit
JOIN vente ON produit.codart = vente.codart
JOIN fournis ON vente.numfou = fournis.numfou
WHERE stkphy <=(1.5* stkale)
GROUP BY numfou
HAVING (delliv < 30)
ORDER BY 1 ASC
;




-- 17. Avec le même type de sélection que ci-dessus, sortir un total des
--     stocks par fournisseur trié par total décroissant.





-- 18. En fin d'année, sortir la liste des produits dont la quantité réellement
--     commandée dépasse 90% de la quantité annuelle prévue.





-- 19. Calculer le chiffre d'affaire par fournisseur pour l'année 93 sachant
--     que les prix indiqués sont hors taxes et que le taux de TVA est 20%.





-- *****************************************************************
-- ************* IV  LES BESOINS DE MISE A JOUR  *******************
-- *****************************************************************


-- 1. Application d'une augmentation de tarif de 4% pour le prix 1 et de 2%
--    pour le prix2 pour le fournisseur 9180

SELECT prix1, prix2
FROM vente
WHERE numfou = 9180;
UPDATE vente
SET prix1 = prix1 * 1.04,
    prix2 = prix2 * 1.02
WHERE numfou = 9180;

    -- remise en état des valeurs modifiées ci-dessus
    UPDATE vente
    SET prix1 = 720, prix2 = 670
    WHERE numfou = 9180;



-- 2. Dans la table vente, mettre à jour le prix2 des articles dont le prix2 est
--    null, en affectant a prix2 la valeur de prix1.





-- 3. Mettre à jour le champ obscom en positionnant '*****' pour toutes les
--    commandes dont le fournisseur a un indice de satisfaction <5





-- 4. Suppression du produit I110





-- 5. Suppression des entête de commande qui n'ont aucune ligne






