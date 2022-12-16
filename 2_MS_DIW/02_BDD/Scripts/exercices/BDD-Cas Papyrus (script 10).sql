# 10 Lister les commandes par nom de fournisseur.
#    Afficher nom du fournisseur, numéro de commande et date

SELECT nomfou, numcom, datcom
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou
