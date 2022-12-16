# 7 Quelles sont les commandes du jour qui ont des observations particulières ?
#   Afficher numéro de commande et date de commande

SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE entcom.obscom !='';
