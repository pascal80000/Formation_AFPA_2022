-- Active: 1679405822381@@127.0.0.1@3306@filrouge
DROP DATABASE IF EXISTS filrouge;
CREATE DATABASE filrouge;
USE filrouge;

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
   id_fournisseur INT NOT NULL AUTO_INCREMENT,
   nom_fournisseur VARCHAR(50),
   adresse_fournisseur VARCHAR(255),
   CP_fournis VARCHAR(50),
   Ville_fournis VARCHAR(50),
   PRIMARY KEY(id_fournisseur)
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
   id_fournisseur INT NOT NULL,
   PRIMARY KEY(ref_produit),
   FOREIGN KEY(id_fournisseur) REFERENCES fournisseurs(id_fournisseur)
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
   id_fournisseur INT,
   ref_produit VARCHAR(50),
   nom_utilisateur VARCHAR(50),
   PRIMARY KEY(id_fournisseur, ref_produit, nom_utilisateur),
   FOREIGN KEY(id_fournisseur) REFERENCES fournisseurs(id_fournisseur),
   FOREIGN KEY(ref_produit) REFERENCES produits(ref_produit),
   FOREIGN KEY(nom_utilisateur) REFERENCES Tableau_de_bord(nom_utilisateur)
);



-- ===========================================================
-- ======  CREATION DES INDEX  ===============================
-- ===========================================================

CREATE INDEX ref_produit ON produits(ref_produit ASC);  -- Index Produits par ref.

CREATE INDEX num_commande ON commandes(num_commande ASC);

CREATE INDEX num_client ON clients(num_client ASC);

CREATE INDEX id_fournisseur ON fournisseurs(id_fournisseur ASC);




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



INSERT INTO `clients` VALUES
(1020001,"Client 1"     , 1,"Commercial 1"   ,"Adresse du client 1",                52121,"ville_cli1", "xxxxxxxx",00.00, 1.5),
(1020002,"Client 2"     , 1,"Commercial 2"   ,"Adresse du client 2",                29023,"ville_cli2", "xxxxxxxx",00.00, 1.5),
(1020003,"Stella Fulton", 0,"Jolene White"   ,"Appartement448-8320 Vehicula Av.",   66232,"ville 3",    "xxxxxxxx",00.95, 1.5),
(1020004,"Alyssa Hebert", 0,"Ori Lang"       ,"9920 Eleifend, Route",               78022,"ville 4",    "xxxxxxxx",00.80, 1.5),
(1020005,"Hilda Wheeler", 0,"Cyrus Holder"   ,"488-1312 Sollicitudin Rue",          45000,"ville 5",    "xxxxxxxx",00.85, 1.3),
(1020006,"Davis Riley"  , 0,"Colleen Langley","3196 Rutrum Av.",                    59100,"Roubaix",    "xxxxxxxx",00.80, 1.4),
(1020007,"Callum Howe"  , 0,"Jillian Lowery" ,"CP 389, 7501 Fusce Avenue",          13001,"Marseille",  "xxxxxxxx",00.75, 1.6);




INSERT INTO `fournisseurs` VALUES
(20000,"Erasmus O'donnell", "Appartement175-6496 Erat, Rue",    02512, "Vilfournis1"),
(20001,"Shana Lindsey",     "CP 455, 1063 Pede, Rue",           03258, "Vilfournis2"),
(20002,"Imogene Sherman",   "2601 In Route",                    06222, "Vilfournis3"),
(20003,"Jin Klein",         "5580 Donec Rue",                   55213, "Vilfournis4"),
(20004,"Odysseus Joseph",   "9439 Nisi. Av.",                   76652, "Vilfournis5"),
(20005,"Hector Joyner",     "805-6084 Luctus Ave",              48023, "Vilfournis6"),
(20006,"Cynthia Reynolds",  "Appartement606-3831 Arcu Rue",     13110, "Vilfournis7"),
(20007,"Dacey Hopkins",     "Appartement259-3766 Donec Impasse",08002, "Vilfournis8"),
(20008,"Jasmine Parks",     "642-9273 Semper, Av.",             59120, "Vilfournis9"),
(20009,"Travis Ward",       "Appartement899-1647 Auctor Ave",   62100, "Vilfournis0");


INSERT INTO `commerciaux` VALUES
("LeNomDuPremier",  "Client 1",     1),
("LeSecondNom",     "Client le 2",  0),
("DritteName",      "Client4",      0);


INSERT INTO `produits` VALUES
("Prod 00001","Ref Fournisseur","Nom prod 00001","libellé du produit","DEscriptif longgggggggggg","Catégorie xxx","sous_categ prod",01234.22,0,0,1,1000,"image prod 0001");





