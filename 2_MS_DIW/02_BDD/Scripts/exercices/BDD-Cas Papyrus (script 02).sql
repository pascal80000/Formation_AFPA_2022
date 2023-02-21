SELECT DISTINCT vente.numfou, vente.codart
FROM vente
JOIN fournis ON fournis.numfou = vente.numfou
WHERE ((vente.qte1 + vente.qte2 + vente.qte3)!= 0 )
GROUP BY vente.numfou;

