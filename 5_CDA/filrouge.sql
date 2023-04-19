-- Active: 1679405822381@@127.0.0.1@3306@filrouge
DROP DATABASE IF EXISTS filrouge;
CREATE DATABASE filrouge;
USE filrouge;
CREATE TABLE client(
   id_client INT(11),
   nom_client VARCHAR(50),
   prenom_client VARCHAR(50),
   adresse_client VARCHAR(50),
   cp_client VARCHAR(50),
   ville_client VARCHAR(50),
   commercial_affect VARCHAR(50) NOT NULL,
   remise_client DECIMAL(4,2),
   coef_remise DECIMAL(4,2),
   PRIMARY KEY(id_client)
);

CREATE TABLE fournisseur(
   id_fournisseur INT(11),
   nom_fournisseur VARCHAR(50),
   adresse_fournisseur VARCHAR(255),
   cp_fournisseur VARCHAR(50),
   ville_fournisseur VARCHAR(50),
   PRIMARY KEY(id_fournisseur)
);

CREATE TABLE commercial(
   id_commercial INT(11),
   nom_commercial VARCHAR(50) NOT NULL,
   affectation_client VARCHAR(50) NOT NULL,
   PRIMARY KEY(id_commercial)
);

CREATE TABLE commande(
   num_commande VARCHAR(50),
   article_commande VARCHAR(50),
   date_commande DATE,
   remise_exceptionelle DECIMAL(4,2),
   paiement_valide BOOLEAN,
   num_facture VARCHAR(50),
   mode_paiement VARCHAR(50),
   commande_complete BOOLEAN,
   validation_commande BOOLEAN,
   adresse_facturation VARCHAR(50),
   cp_facturation CHAR(5),
   ville_facturation VARCHAR(50),
   id_client INT NOT NULL,
   PRIMARY KEY(num_commande),
   FOREIGN KEY(id_client) REFERENCES client(id_client)
);

CREATE TABLE livraison(
   num_BL VARCHAR(50),
   date_BL DATE,
   adresse_BL VARCHAR(50),
   num_commande VARCHAR(50) NOT NULL,
   PRIMARY KEY(num_BL),
   FOREIGN KEY(num_commande) REFERENCES commande(num_commande)
);

CREATE TABLE categorie(
   id_categorie INT(11),
   nom_categorie VARCHAR(50),
   image_categorie VARCHAR(50),
   PRIMARY KEY(id_categorie)
);

CREATE TABLE sous_categorie(
   id_sous_categorie INT(11),
   nom_sous_categorie VARCHAR(50),
   image_sous_categorie VARCHAR(50),
   id_categorie INT NOT NULL,
   PRIMARY KEY(id_sous_categorie),
   FOREIGN KEY(id_categorie) REFERENCES categorie(id_categorie)
);
DROP TABLE IF EXISTS produit;

CREATE TABLE produit(
   ref_produit VARCHAR(50),
   libelle_produit VARCHAR(255),
   description_produit VARCHAR(255),
   prix_achat DECIMAL(8,2),
   prix_vente_pro DECIMAL(8,2),
   prix_vente_particuliers DECIMAL(8,2),
   visibilite_catalogue BOOLEAN,
   stock_produit SMALLINT,
   image_produit VARCHAR(50),
   id_sous_categorie INT(11) NOT NULL,
   id_fournisseur INT(11) NOT NULL,
   PRIMARY KEY(ref_produit),
   FOREIGN KEY(id_sous_categorie) REFERENCES sous_categorie(id_sous_categorie),
   FOREIGN KEY(id_fournisseur) REFERENCES fournisseur(id_fournisseur)
);

CREATE TABLE gere(
   id_client INT,
   id_commercial INT,
   particuliers BOOLEAN,
   PRIMARY KEY(id_client, id_commercial),
   FOREIGN KEY(id_client) REFERENCES client(id_client),
   FOREIGN KEY(id_commercial) REFERENCES commercial(id_commercial)
);

CREATE TABLE contient(
   ref_produit VARCHAR(50),
   num_commande VARCHAR(50),
   quantite SMALLINT,
   total_article DECIMAL(15,2),
   prix_unitaire DECIMAL(15,2),
   validation_panier BOOLEAN,
   PRIMARY KEY(ref_produit, num_commande),
   FOREIGN KEY(ref_produit) REFERENCES produit(ref_produit),
   FOREIGN KEY(num_commande) REFERENCES commande(num_commande)
);

CREATE TABLE inclut(
   ref_produit VARCHAR(50),
   num_BL VARCHAR(50),
   quantite SMALLINT,
   PRIMARY KEY(ref_produit, num_BL),
   FOREIGN KEY(ref_produit) REFERENCES produit(ref_produit),
   FOREIGN KEY(num_BL) REFERENCES livraison(num_BL)
);



-- ===========================================================
-- ======  CREATION DES INDEX  ===============================
-- ===========================================================

CREATE INDEX ref_produit ON produit(ref_produit ASC);  -- Index Produits par ref.

CREATE INDEX num_commande ON commande(num_commande ASC);

CREATE INDEX id_client ON client(id_client ASC);

CREATE INDEX id_fournisseur ON fournisseur(id_fournisseur ASC);




--  =========================================================
--  ===========  CREATION DES DROITS  =======================
--  =========================================================

-- utilisateur: admin = tous les droits sur la base
DROP USER 'admin'@'localhost';

CREATE USER IF NOT EXISTS 'admin'@'localhost' IDENTIFIED BY '1122';
GRANT ALL PRIVILEGES on FilRouge.* TO 'admin'@'localhost' WITH GRANT OPTION;

-- utilisateur Gestionnaire de Produits
CREATE USER IF NOT EXISTS 'GestProd'@'localhost' IDENTIFIED BY 'GestProd';
GRANT SELECT, CREATE, DROP, UPDATE on `produit` TO 'GestProd'@'localhost';

-- autres à définir...



FLUSH PRIVILEGES;




-- =============================================================
-- ========  ALIMENTATION DE LA BASE  ==========================
-- =============================================================
USE filrouge;



INSERT INTO `client` VALUES
(1020001,"Client 1"     ,"prenom cli1 "   ,"Adresse du client 1",                52121,"ville_cli1", "xxxxxxxx",00.00, 1.5),
(1020002,"Client 2"     ,"prenomCli  2"   ,"Adresse du client 2",                29023,"ville_cli2", "xxxxxxxx",00.00, 1.5),
(1020003,"Stella Fulton","Jolene White"   ,"Appartement448-8320 Vehicula Av.",   66232,"ville 3",    "xxxxxxxx",00.95, 1.5),
(1020004,"Alyssa Hebert","Ori Lang"       ,"9920 Eleifend, Route",               78022,"ville 4",    "xxxxxxxx",00.80, 1.5),
(1020005,"Hilda Wheeler","Cyrus Holder"   ,"488-1312 Sollicitudin Rue",          45000,"ville 5",    "xxxxxxxx",00.85, 1.3),
(1020006,"Davis Riley"  ,"Colleen Langley","3196 Rutrum Av.",                    59100,"Roubaix",    "xxxxxxxx",00.80, 1.4),
(1020007,"Callum Howe"  ,"Jillian Lowery" ,"CP 389, 7501 Fusce Avenue",          13001,"Marseille",  "xxxxxxxx",00.75, 1.6);




INSERT INTO `fournisseur` VALUES
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


INSERT INTO `commercial` VALUES
(1,"LeNomDuPremier",  "Client 1"),
(2,"LeSecondNom",     "Client le 2"),
(3,"DritteName",      "Client4"),
(11,"nom commercial 1", "client géré"),
(12,"nom commercial 2", "client géré"),
(13,"nom commercial 3", "client géré");

INSERT INTO `categorie` VALUES
(1, "Cordes", "image catégorie 1" ),
(2, "Claviers", "image cat 2"),
(3, "Vents", "image cat 3"),
(4, "sonorisation", "image sonos");

INSERT INTO `sous_categorie` VALUES
(1, "Guitares", "image Guitares", 1),
(2, "Pianos", "image pianos", 2),
(3, "saxo", "image saxo", 3),
(4, "Amplis", "image amplis", 4);



INSERT INTO `produit` VALUES
("Prod 00001","libellé du produit","Descriptif longgggggggggg",1000.00,1500.00,2000.00,1,5,"image prod 1",1,20005)
("Prod 00002","libellé du produit","Descriptif longgggggggggg",100.00,150.00,200.00,1,4,"image prod 2",1,20002),
("Prod 00003","libellé du produit","Descriptif longgggggggggg",1000.00,1500.00,2000.00,1,9,"image prod 3",1,20001),
("Prod 00004","libellé du produit","Descriptif longgggggggggg",1000.00,1500.00,2000.00,1,9,"image prod 3",1,20001),
("Prod 00005","libellé du produit","Descriptif longgggggggggg",1000.00,1500.00,2000.00,1,9,"image prod 5",4,20001),
("Prod 00006","libellé du produit","Descriptif longgggggggggg",1000.00,1500.00,2000.00,1,9,"image prod 6",3,20001);




--  ====================================================
--  ======= SAUVEGARDE DE LA BASE ======================
--  ====================================================
--  Dans le terminal

/* mysqldump --user=admin --password=1122 filrouge.sql > backup_filrouge.sql
         (sans chemin spécifié après le '>' , on arrive dans le dossier personnel)
*/


--  ===================================================
--  ======== RESTAURATION d'une BASE   ================
--  ===================================================
--  Dans terminal, lancer mysql, créer la base 'new_filrouge' qui accueillera la restauration.
--  et quitter mysql 

/* cat backup_filrouge_18_04_BIS.sql | mysql --user=admin --password=1122 new_filrouge
      (on va chercher le fichier de backup qui sera restauré sous le nouveau nom 'new_filrouge')

*/





--  ==========================================================================
--  ==============   Formaliser des requêtes à l'aide du langage SQL  ========
--  ==========================================================================

--  Chiffre d'affaires mois par mois pour une année sélectionnée
SELECT SUM(total_article) AS ta, DATE (date_commande) AS dc
FROM contient c
JOIN commande cde ON c.num_commande = cde.num_commande
WHERE YEAR(date_commande)= '2022'
GROUP BY MONTH(dc);




--  Chiffre d'affaires généré pour un fournisseur
SELECT SUM(total_article)
FROM contient CALLJOIN commande cde ON c.num_commande = cde.num_commande
WHERE id_fournisseur = (à renseigner);


--  TOP 10 des produits les plus commandés pour une année sélectionnée 
--    (référence et nom du produit, quantité commandée, fournisseur)
SELECT TOP 10 SUM(c.quantite), libelle_produit
FROM produit p
JOIN contient c ON p.ref_produit = c.ref_produit;
         --  voir avec LIMIT 10;


--  TOP 10 des produits les plus rémunérateurs pour une année sélectionnée 
--    (référence et nom du produit, marge, fournisseur)



--  Top 10 des clients en nombre de commandes ou chiffre d'affaires



--  Répartition du chiffre d'affaires par type de client



--  Nombre de commandes en cours de livraison.




-- génération de données aléatoires pour les noms de produits
CREATE TABLE noms_produits (
  nom VARCHAR(255) NOT NULL
);

INSERT INTO noms_produits (nom) VALUES 
('Téléphone portable'),
('Ordinateur portable'),
('Casque audio'),
('Enceinte Bluetooth'),
('Smartwatch'),
('Tablette tactile'),
('Appareil photo numérique'),
('Imprimante multifonction'),
('TV LED'),
('Console de jeux');

-- génération des données aléatoires pour la table produit
INSERT INTO produit (ref_produit, libelle_produit, description_produit, prix_achat, prix_vente_pro, prix_vente_particuliers, visibilite_catalogue, stock_produit, image_produit, id_sous_categorie, id_fournisseur)
SELECT 
  CONCAT('PR', LPAD(ROW_NUMBER() OVER(), 4, '0')) AS ref_produit,
  CONCAT(np.nom, ' ', LPAD(ROW_NUMBER() OVER(), 2, '0')) AS libelle_produit,
  CONCAT('Description du produit ', ROW_NUMBER() OVER()) AS description_produit,
  ROUND(RAND() * 1000, 2) AS prix_achat,
  ROUND(RAND() * 1500, 2) AS prix_vente_pro,
  ROUND(RAND() * 2000, 2) AS prix_vente_particuliers,
  RAND() < 0.5 AS visibilite_catalogue,
  FLOOR(RAND() * 100) AS stock_produit,
  CONCAT('produit_', LPAD(ROUND(RAND() * 10), 2, '0'), '.jpg') AS image_produit,
  FLOOR(RAND() * 10) + 1 AS id_sous_categorie,
  FLOOR(RAND() * 10) + 1 AS id_fournisseur
FROM 
  noms_produits np
CROSS JOIN 
  (SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL SELECT 9 UNION ALL SELECT 10) numbers
LIMIT 100;
