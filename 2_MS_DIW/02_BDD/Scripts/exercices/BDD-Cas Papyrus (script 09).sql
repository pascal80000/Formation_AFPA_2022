# 9 Lister les commandes dont le total est supérieur à 10000€ ; 
# on exclura dans le calcul du total 
# les articles commandés en quantité supérieure ou égale à 1000.
#   Afficher numéro de commande et total

SELECT entcom.numcom,qtecde*priuni
FROM entcom
JOIN ligcom ON entcom.numcom = ligcom.numcom
WHERE qtecde*priuni > 10000 AND qtecde <1000
GROUP BY qtecde
ORDER BY qtecde DESC
