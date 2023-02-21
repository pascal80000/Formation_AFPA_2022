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
