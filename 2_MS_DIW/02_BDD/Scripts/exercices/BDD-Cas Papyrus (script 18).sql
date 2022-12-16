# 18 En fin d année, sortir la liste des produits dont la quantité 
#   réellement commandée dépasse 90% de la quantité annuelle prévue.


SELECT ligcom.numcom, ligcom.codart, produit.libart,entcom.datcom
FROM entcom
JOIN fournis ON  entcom.numfou = fournis.numfou
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart
WHERE ligcom.qtecde > (0.9 * produit.qteann) AND datcom LIKE '%2021%'
GROUP BY codart, libart;

