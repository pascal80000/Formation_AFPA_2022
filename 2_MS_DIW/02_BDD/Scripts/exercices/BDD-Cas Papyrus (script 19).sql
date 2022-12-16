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
