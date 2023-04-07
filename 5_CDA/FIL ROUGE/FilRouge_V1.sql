-- Active: 1679405822381@@127.0.0.1@3306@filrouge
DROP DATABASE IF EXISTS filrouge_V1;
CREATE DATABASE filrouge_V1;
USE filrouge_V1;

CREATE TABLE clients(
   num_client INT NOT NULL AUTO_INCREMENT,
   nom_client VARCHAR(50),
   client_particulier BOOLEAN,
   commercial_affect VARCHAR(50) NOT NULL,
   adresse_client VARCHAR(50),
   cp_client VARCHAR(50),
   ville_client VARCHAR(50),
   commandes VARCHAR(50) NOT NULL,
   remise_client DECIMAL(4,2),
   coef_marge DECIMAL(4,2),
   PRIMARY KEY(num_client)
);

CREATE TABLE fournisseurs(
   if_fournisseur INT NOT NULL AUTO_INCREMENT,
   nom_fournisseur VARCHAR(50),
   adresse_fournisseur VARCHAR(255),
   CP_fournis VARCHAR(50),
   Ville_fournis VARCHAR(50),
   PRIMARY KEY(if_fournisseur)
);

CREATE TABLE commerciaux(
   nom_commercial VARCHAR(50),
   affectation_client VARCHAR(50) NOT NULL,
   special_particuliers BOOLEAN,
   PRIMARY KEY(nom_commercial)
);

CREATE TABLE produits(
   ref_produit VARCHAR(50),
   ref_fournisseur VARCHAR(50),
   nom_fournisseur VARCHAR(50),
   nom_produit VARCHAR(50),
   libelle_produit VARCHAR(255),
   descriptif_produit VARCHAR(255),
   rubrique_produit VARCHAR(255),
   sous_rubrique_produit VARCHAR(255),
   prix_achat DECIMAL(8,2),
   prix_vente_pro DECIMAL(8,2),
   prix_vente_particuliers DECIMAL(8,2),
   visibilite_catalogue BOOLEAN,
   stock_produit SMALLINT,
   image_produit VARCHAR(50),
   if_fournisseur INT NOT NULL,
   PRIMARY KEY(ref_produit),
   FOREIGN KEY(if_fournisseur) REFERENCES fournisseurs(if_fournisseur)
);

CREATE TABLE panier(
   ligne_panier INT NOT NULL AUTO_INCREMENT,
   ref_produit VARCHAR(50),
   quantite SMALLINT,
   prix_unitaire DECIMAL(15,2),
   total_article DECIMAL(15,2),
   validation_panier BOOLEAN,
   ref_produit_1 VARCHAR(50) NOT NULL,
   PRIMARY KEY(ligne_panier),
   FOREIGN KEY(ref_produit_1) REFERENCES produits(ref_produit)
);

CREATE TABLE Gestionnaire_produits(
   id_gestionnaire VARCHAR(50),
   nom_gestionnaire VARCHAR(50),
   PRIMARY KEY(id_gestionnaire)
);

CREATE TABLE App_mobile(
   login_client VARCHAR(50),
   pass_client VARCHAR(50),
   PRIMARY KEY(login_client)
);

CREATE TABLE Tableau_de_bord(
   nom_utilisateur VARCHAR(50),
   chiffre_affaire VARCHAR(50),
   PRIMARY KEY(nom_utilisateur)
);

CREATE TABLE commandes(
   num_commande VARCHAR(50),
   ligne_commande VARCHAR(50),
   article_commande VARCHAR(50),
   date_commande DATE,
   validation_commande BOOLEAN,
   envoi_commande BOOLEAN,
   date_reception_commande DATE,
   accuse_reception_commande BOOLEAN,
   remise_exceptionelle DECIMAL(4,2),
   paiement_valide BOOLEAN,
   adresse_de_livraison VARCHAR(50),
   bon_de_livraison VARCHAR(50),
   facture VARCHAR(50),
   mode_de_paiement VARCHAR(50),
   commande_complete BOOLEAN,
   login_client VARCHAR(50),
   num_client INT NOT NULL,
   PRIMARY KEY(num_commande),
   FOREIGN KEY(login_client) REFERENCES App_mobile(login_client),
   FOREIGN KEY(num_client) REFERENCES clients(num_client)
);

CREATE TABLE Gère(
   num_client INT,
   nom_commercial VARCHAR(50),
   PRIMARY KEY(num_client, nom_commercial),
   FOREIGN KEY(num_client) REFERENCES clients(num_client),
   FOREIGN KEY(nom_commercial) REFERENCES commerciaux(nom_commercial)
);

CREATE TABLE Valide(
   num_commande VARCHAR(50),
   ligne_panier INT,
   PRIMARY KEY(num_commande, ligne_panier),
   FOREIGN KEY(num_commande) REFERENCES commandes(num_commande),
   FOREIGN KEY(ligne_panier) REFERENCES panier(ligne_panier)
);

CREATE TABLE Consulte(
   num_client INT,
   ref_produit VARCHAR(50),
   num_commande VARCHAR(50),
   ligne_panier INT,
   PRIMARY KEY(num_client, ref_produit, num_commande, ligne_panier),
   FOREIGN KEY(num_client) REFERENCES clients(num_client),
   FOREIGN KEY(ref_produit) REFERENCES produits(ref_produit),
   FOREIGN KEY(num_commande) REFERENCES commandes(num_commande),
   FOREIGN KEY(ligne_panier) REFERENCES panier(ligne_panier)
);

CREATE TABLE Gestion_produits(
   ref_produit VARCHAR(50),
   id_gestionnaire VARCHAR(50),
   PRIMARY KEY(ref_produit, id_gestionnaire),
   FOREIGN KEY(ref_produit) REFERENCES produits(ref_produit),
   FOREIGN KEY(id_gestionnaire) REFERENCES Gestionnaire_produits(id_gestionnaire)
);

CREATE TABLE Consulter(
   ref_produit VARCHAR(50),
   login_client VARCHAR(50) NOT NULL,
   PRIMARY KEY(ref_produit),
   FOREIGN KEY(ref_produit) REFERENCES produits(ref_produit),
   FOREIGN KEY(login_client) REFERENCES App_mobile(login_client)
);

CREATE TABLE Visu_performances(
   if_fournisseur INT,
   ref_produit VARCHAR(50),
   nom_utilisateur VARCHAR(50),
   PRIMARY KEY(if_fournisseur, ref_produit, nom_utilisateur),
   FOREIGN KEY(if_fournisseur) REFERENCES fournisseurs(if_fournisseur),
   FOREIGN KEY(ref_produit) REFERENCES produits(ref_produit),
   FOREIGN KEY(nom_utilisateur) REFERENCES Tableau_de_bord(nom_utilisateur)
);



-- ===========================================================
-- ======  CREATION DES INDEX  ===============================
-- ===========================================================

CREATE INDEX ref_produit ON Produits(ref_produit ASC);  -- Index Produits par ref.

CREATE INDEX num_commande ON Commandes(num_commande ASC);

CREATE INDEX num_client ON Clients(num_client ASC);

CREATE INDEX id_fournisseur ON Fournisseurs(id_fournisseur ASC);




--  =========================================================
--  ===========  CREATION DES DROITS  =======================
--  =========================================================

-- utilisateur: admin = tous les droits sur la base
DROP USER 'admin'@'localhost';

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY '1122';
GRANT ALL PRIVILEGES on FilRouge.* TO 'admin'@'localhost' WITH GRANT OPTION;

-- utilisateur Gestionnaire de Produits
CREATE USER IF NOT EXISTS 'GestProd'@'localhost' IDENTIFIED BY 'GestProd';
GRANT SELECT, CREATE, DROP, UPDATE on `Produits` TO 'GestProd'@'localhost';

-- autres à définir...



FLUSH PRIVILEGES;




-- =============================================================
-- ========  ALIMENTATION DE LA BASE  ==========================
-- =============================================================
USE filrouge;


DROP TABLE IF EXISTS `Clients`;

INSERT INTO `Clients` VALUES
(1020001,"Client 1"     ,"Commercial 1"   ,"2023-01-01-001","Adresse du client 1"               ,1,0),
(1020002,"Client 2"     ,"Commercial 2"   ,"2023-01-01-002","Adresse du client 2"               ,1,5),
(1020003,"Stella Fulton","Jolene White"   ,"2022-01-22-001","Appartement448-8320 Vehicula Av."  ,0,11),
(1020004,"Alyssa Hebert","Ori Lang"       ,"2022-02-21-005","9920 Eleifend, Route"              ,1,9),
(1020005,"Hilda Wheeler","Cyrus Holder"   ,"2021-01-02-001","488-1312 Sollicitudin Rue"         ,0,13),
(1020006,"Davis Riley"  ,"Colleen Langley","2022-11-01-001","3196 Rutrum Av."                   ,0,11),
(1020007,"Callum Howe"  ,"Jillian Lowery" ,"2022-08-10-001","CP 389, 7501 Fusce Avenue"         ,0,7);



DROP TABLE IF EXISTS `Fournisseurs`;

INSERT INTO `Fournisseurs` VALUES
(20000,"Erasmus O'donnell","Appartement175-6496 Erat, Rue"),
(20001,"Shana Lindsey","CP 455, 1063 Pede, Rue"),
(20002,"Imogene Sherman","2601 In Route"),
(20003,"Jin Klein","5580 Donec Rue"),
(20004,"Odysseus Joseph","9439 Nisi. Av."),
(20005,"Hector Joyner","805-6084 Luctus Ave"),
(20006,"Cynthia Reynolds","Appartement606-3831 Arcu Rue"),
(20007,"Dacey Hopkins","Appartement259-3766 Donec Impasse"),
(20008,"Jasmine Parks","642-9273 Semper, Av."),
(20009,"Travis Ward","Appartement899-1647 Auctor Ave");






-- =======================================================================
-- ===========   Rétablissement des noms de champs plus lisibles  ========
-- ==========================05/04/2023===================================


