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



