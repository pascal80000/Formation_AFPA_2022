SELECT vente.numfou, vente.codart
FROM vente
JOIN fournis ON fournis.numfou = vente.numfou
WHERE (fournis.numfou = 9120) AND ((vente.qte1 + vente.qte2 + vente.qte3)!= 0 )
GROUP BY vente.codart;

