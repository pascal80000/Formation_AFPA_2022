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
