# 11 Sortir les produits des commandes ayant le mot "urgent" en observation.
#    Afficher numéro de commande, nom du fournisseur, 
#    libellé du produit et sous total (= quantité commandée * prix unitaire)

SELECT entcom.numcom, nomfou, produit.libart, qteliv*priuni
FROM entcom
JOIN fournis ON fournis.numfou = entcom.numfou
JOIN vente ON fournis.numfou = vente.numfou
JOIN produit ON vente.codart = produit.codart
JOIN ligcom ON produit.codart = ligcom.codart 
WHERE entcom.obscom LIKE '%urgen%'
GROUP BY nomfou;

# ########################################################
# ####  ATTENTION, j ai ajouté des urgences à obscom  ####
# ########################################################
