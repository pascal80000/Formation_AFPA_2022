# 13 Coder de 2 manières différentes la requête suivante : 
#   Lister les commandes dont le fournisseur est celui de la commande n°70210.
#   Afficher numéro de commande et date


SELECT ligcom.numcom , datcom
FROM ligcom
JOIN entcom ON ligcom.numcom = entcom.numcom
JOIN fournis ON fournis.numfou = entcom.numfou
WHERE entcom.numcom = 70210;



SELECT ligcom.numcom, datcom
FROM ligcom
JOIN entcom ON ligcom.numcom = entcom.numcom
JOIN fournis ON fournis.numfou = entcom.numfou
WHERE entcom.numcom LIKE 70210;



# #############################
# ### voir les 2 onglets	###
# #############################
