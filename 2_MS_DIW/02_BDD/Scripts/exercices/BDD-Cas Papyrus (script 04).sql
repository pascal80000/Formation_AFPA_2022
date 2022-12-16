# 4 Extraire les produits ayant un stock inférieur ou égal au stock d alerte,
# et dont la quantité annuelle est inférieure à 1000.

#   (Informations à fournir : n° produit, libellé produit, stock actuel, stock d alerte,
# et quantité annuelle)



SELECT produit.codart, produit.libart, produit.stkale, produit.stkphy, produit.qteann
FROM produit
WHERE (qteann < 1000) AND (stkphy < stkale)
;
