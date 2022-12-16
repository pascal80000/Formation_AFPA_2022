# 16 Sortir la liste des fournisseurs susceptibles de livrer les produits 
#   dont le stock est inférieur ou égal à 150 % du stock d alerte, 
#   et un délai de livraison d au maximum 30 jours.
#
#   La liste sera triée par fournisseur puis produit

SELECT DISTINCT nomfou, codart, libart, 
FROM fournis f
JOIN vente v ON f.numfou = v.numfou
JOIN produit p ON v.codart = p.codart
WHERE stkphy < (1.5 * stkale) AND (delliv < 30)
GROUP BY  nomfou, p.libart;
