# 3 Afficher le nombre de commandes passées, 
#   et le nombre de fournisseurs concernés.

SELECT COUNT(entcom.numcom) , COUNT(DISTINCT entcom.numfou) FROM entcom
;
