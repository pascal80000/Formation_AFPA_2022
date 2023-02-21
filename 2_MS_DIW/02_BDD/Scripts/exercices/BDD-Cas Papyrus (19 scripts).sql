# 1 
#

SELECT vente.numfou, vente.codart
FROM vente
JOIN fournis ON fournis.numfou = vente.numfou
WHERE fournis.numfou = 9120
GROUP BY vente.codart;


# 2
#

SELECT DISTINCT vente.numfou, vente.codart
FROM vente
JOIN fournis ON fournis.numfou = vente.numfou
WHERE ((vente.qte1 + vente.qte2 + vente.qte3)!= 0 )
GROUP BY vente.numfou;



# 3 Afficher le nombre de commandes passées, 
#   et le nombre de fournisseurs concernés.

SELECT COUNT(entcom.numcom) , COUNT(DISTINCT entcom.numfou) 
FROM entcom;



# 4 Extraire les produits ayant un stock inférieur ou égal au stock d alerte,
# et dont la quantité annuelle est inférieure à 1000.

#   (Informations à fournir : n° produit, libellé produit, stock actuel, stock d alerte,
# et quantité annuelle)

SELECT produit.codart, produit.libart, produit.stkale, produit.stkphy, produit.qteann
FROM produit
WHERE (qteann < 1000) AND (stkphy < stkale)
;



# 5 Quels sont les fournisseurs situés dans les départements 75, 78, 92, 77 ? 

SELECT fournis.posfou, fournis.nomfou
FROM fournis
WHERE posfou = '75014' OR posfou = '78250' OR posfou = '78440' OR posfou = '92200'
ORDER BY fournis.posfou DESC, fournis.nomfou;




# 6 Quelles sont les commandes passées en mars et en avril ?

SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE (MONTH(entcom.datcom) = 3 OR MONTH(entcom.datcom) = 4);




# 7 Quelles sont les commandes du jour qui ont des observations particulières ?
#   Afficher numéro de commande et date de commande

SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE entcom.obscom !='';




# 8 Lister le total de chaque commande par total décroissant.
#   Afficher numéro de commande et total

SELECT entcom.numcom, SUM(ligcom.qtecde * priuni)
FROM ligcom
JOIN entcom ON entcom.numcom = ligcom.numcom
GROUP BY entcom.numcom
ORDER BY (SUM(ligcom.qtecde * priuni)) DESC;




# 9 Lister les commandes dont le total est supérieur à 10000€ ; 
# on exclura dans le calcul du total 
# les articles commandés en quantité supérieure ou égale à 1000.
#   Afficher numéro de commande et total

SELECT entcom.numcom,qtecde*priuni
FROM entcom
JOIN ligcom ON entcom.numcom = ligcom.numcom
WHERE qtecde*priuni > 10000 AND qtecde <1000
GROUP BY qtecde
ORDER BY qtecde DESC




# 10 Lister les commandes par nom de fournisseur.
#    Afficher nom du fournisseur, numéro de commande et date

SELECT nomfou, numcom, datcom
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou




# 11 Sortir les produits des commandes ayant le mot "urgent" en observation.
#    Afficher numéro de commande, nom du fournisseur, 
#    libellé du produit et sous total (= quantité commandée * prix unitaire)

SELECT entcom.numcom, nomfou, produit.libart, qteliv*priuni
FROM entcom
JOIN fournis ON fournis.numfou = entcom.numfou
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart 
WHERE entcom.obscom LIKE '%urgen%'
GROUP BY nomfou;

# ########################################################
# ####  ATTENTION, j ai ajouté des urgences à obscom  ####
# ########################################################




# 12 Coder de 2 manières différentes la requête suivante : 
#    Lister le nom des fournisseurs susceptibles de livrer au moins un article.

SELECT nomfou
FROM fournis
JOIN vente ON fournis.numfou = vente.numfou
WHERE ((qte1 + qte2 + qte3)!= 0 )
GROUP BY nomfou;


SELECT DISTINCT nomfou
FROM fournis
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
WHERE stkphy != 0;


# #############################
# ### voir les 2 onglets	###
# #############################




# 13 Coder de 2 manières différentes la requête suivante : 
#   Lister les commandes dont le fournisseur est celui de la commande n°70210.
#   Afficher numéro de commande et date


SELECT ligcom.numcom , datcom
FROM ligcom
JOIN entcom ON ligcom.numcom = entcom.numcom
JOIN fournis ON fournis.numfou = entcom.numfou
WHERE entcom.numcom = 70210;



SELECT ligcom.numcom, datcom
FROM ligcom
JOIN entcom ON ligcom.numcom = entcom.numcom
JOIN fournis ON fournis.numfou = entcom.numfou
WHERE entcom.numcom LIKE 70210;



# #############################
# ### voir les 2 onglets	###
# #############################




# 14 Dans les articles susceptibles d’être vendus,
#    lister les articles moins chers (basés sur Prix1)
#    que le moins cher des rubans (article dont le premier caractère commence par R).
#
#   Afficher libellé de l’article et prix1


SELECT libart, prix1
FROM produit
JOIN vente ON produit.codart = vente.codart
WHERE vente.prix1 < 
    (
SELECT MIN(prix1)
FROM vente
WHERE codart LIKE 'R%' AND (stkphy != 0)
    )
GROUP BY vente.codart ;




# 15 Sortir la liste des fournisseurs susceptibles de livrer les produits 
#   dont le stock est inférieur ou égal à 150 % du stock d alerte.
#
#   La liste sera triée par produit puis fournisseur


SELECT DISTINCT nomfou
FROM fournis
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
WHERE stkphy < (1.5 * stkale)
GROUP BY produit.libart, nomfou;




# 16 Sortir la liste des fournisseurs susceptibles de livrer les produits 
#   dont le stock est inférieur ou égal à 150 % du stock d alerte, 
#   et un délai de livraison d au maximum 30 jours.
#
#   La liste sera triée par fournisseur puis produit

SELECT DISTINCT nomfou AS 'Fournisseur', l.codart AS 'Code Article', libart AS 'Libellé Article' 
FROM fournis f
JOIN vente v ON f.numfou = v.numfou
JOIN produit p ON v.codart = p.codart
JOIN ligcom l ON p.codart = l.codart 
WHERE stkphy < (1.5 * stkale) AND (delliv < 30)
GROUP BY  nomfou, p.libart;





# 17 Avec le même type de sélection que ci-dessus, 
#   sortir un total des stocks par fournisseur, triés par total décroissant.

SELECT nomfou, SUM(stkphy) AS 'somme'
FROM entcom
JOIN fournis ON fournis.numfou = entcom.numfou
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart
GROUP BY nomfou
ORDER BY somme DESC;







# 18 En fin d année, sortir la liste des produits dont la quantité 
#   réellement commandée dépasse 90% de la quantité annuelle prévue.

SELECT produit.libart AS 'Libellé Article '
FROM entcom
JOIN fournis ON  entcom.numfou = fournis.numfou
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart
WHERE ligcom.qtecde > (0.9 * produit.qteann) AND datcom LIKE '%2021%'
GROUP BY codart, libart;




# 19 Calculer le chiffre d affaire par fournisseur pour l année 2018, 
#   sachant que les prix indiqués sont hors taxes et que le taux de TVA est 20%.

SELECT fournis.numfou, fournis.nomfou, ligcom.numcom, datcom, SUM(priuni * qtecde)
FROM entcom
JOIN fournis ON  entcom.numfou = fournis.numfou
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart
WHERE entcom.datcom LIKE('2018%')
GROUP BY numfou;
