CREATE TABLE clients(
   commercial_affect VARCHAR(50),
   commandes VARCHAR(50),
   num_client COUNTER NOT NULL,
   nom_client VARCHAR(50),
   adresse_client VARCHAR(50),
   client_particulier LOGICAL,
   remise_client DECIMAL(4,2),
   PRIMARY KEY(commercial_affect, commandes)
);

CREATE TABLE fournisseurs(
   if_fournisseur COUNTER,
   nom_fournisseur VARCHAR(50),
   adresse_fournisseur VARCHAR(255),
   PRIMARY KEY(if_fournisseur)
);

CREATE TABLE commerciaux(
   affectation_client VARCHAR(50),
   nom_commercial VARCHAR(50),
   PRIMARY KEY(affectation_client)
);

CREATE TABLE commandes(
   num_commande VARCHAR(50),
   ligne_commande VARCHAR(50),
   article_commande VARCHAR(50),
   date_commande DATE,
   validation_commande LOGICAL,
   envoi_commande LOGICAL,
   date_reception_commande DATE,
   accuse_reception_commande LOGICAL,
   remise_exceptionelle DECIMAL(4,2),
   paiement_valide LOGICAL,
   PRIMARY KEY(num_commande)
);

CREATE TABLE panier(
   ligne_panier COUNTER,
   ref_produit VARCHAR(50),
   quantite SMALLINT,
   prix_unitaire DECIMAL(15,2),
   total_article DECIMAL(15,2),
   validation_panier LOGICAL,
   PRIMARY KEY(ligne_panier)
);

CREATE TABLE produits(
   ref_produit VARCHAR(50),
   nom_produit VARCHAR(50),
   libelle_produit VARCHAR(255),
   rubrique_produit VARCHAR(255),
   sous_rubrique_produit VARCHAR(255),
   prix_achat DECIMAL(7,2),
   prix_vente_pro DECIMAL(7,2),
   prix_vente_particuliers DECIMAL(7,2),
   visibilite_catalogue LOGICAL,
   stock_produit SMALLINT,
   image_produit VARCHAR(50),
   ref_fournisseur VARCHAR(50),
   ligne_panier INT,
   PRIMARY KEY(ref_produit),
   FOREIGN KEY(ligne_panier) REFERENCES panier(ligne_panier)
);

CREATE TABLE Gère(
   commercial_affect VARCHAR(50),
   commandes VARCHAR(50),
   affectation_client VARCHAR(50),
   PRIMARY KEY(commercial_affect, commandes, affectation_client),
   FOREIGN KEY(commercial_affect, commandes) REFERENCES clients(commercial_affect, commandes),
   FOREIGN KEY(affectation_client) REFERENCES commerciaux(affectation_client)
);

CREATE TABLE Achète(
   commercial_affect VARCHAR(50),
   commandes VARCHAR(50),
   num_commande VARCHAR(50),
   PRIMARY KEY(commercial_affect, commandes, num_commande),
   FOREIGN KEY(commercial_affect, commandes) REFERENCES clients(commercial_affect, commandes),
   FOREIGN KEY(num_commande) REFERENCES commandes(num_commande)
);

CREATE TABLE Approvisionne(
   if_fournisseur INT,
   ref_produit VARCHAR(50),
   PRIMARY KEY(if_fournisseur, ref_produit),
   FOREIGN KEY(if_fournisseur) REFERENCES fournisseurs(if_fournisseur),
   FOREIGN KEY(ref_produit) REFERENCES produits(ref_produit)
);

CREATE TABLE Valide(
   num_commande VARCHAR(50),
   ligne_panier INT,
   PRIMARY KEY(num_commande, ligne_panier),
   FOREIGN KEY(num_commande) REFERENCES commandes(num_commande),
   FOREIGN KEY(ligne_panier) REFERENCES panier(ligne_panier)
);
