# 8 Lister le total de chaque commande par total décroissant.
#   Afficher numéro de commande et total

SELECT entcom.numcom, SUM(ligcom.qtecde * priuni)
FROM ligcom
JOIN entcom ON entcom.numcom = ligcom.numcom
GROUP BY entcom.numcom
ORDER BY (SUM(ligcom.qtecde * priuni)) DESC;
