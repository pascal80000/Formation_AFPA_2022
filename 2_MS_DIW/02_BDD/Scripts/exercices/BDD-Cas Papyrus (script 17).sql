# 17 Avec le même type de sélection que ci-dessus, 
#   sortir un total des stocks par fournisseur, triés par total décroissant.




SELECT nomfou, stkphy
FROM entcom
JOIN fournis ON fournis.numfou = entcom.numfou
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart

