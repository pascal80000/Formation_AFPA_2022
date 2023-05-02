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
   prenom_commercial VARCHAR(25),
   tel_commercial VARCHAR(15),
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
GRANT ALL PRIVILEGES on filrouge.* TO 'admin'@'localhost' WITH GRANT OPTION;

-- utilisateur Gestionnaire de Produits
CREATE USER IF NOT EXISTS 'GestProd'@'localhost' IDENTIFIED BY 'GestProd';
GRANT SELECT, CREATE, DROP, UPDATE on `produit` TO 'GestProd'@'localhost';

-- autres à définir...



FLUSH PRIVILEGES;


SELECT user FROM mysql.user;

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

DELETE FROM commercial
WHERE id_commercial > 0;

INSERT INTO `commercial` VALUES
(1,"LeNomDuPremier", "prénom1", "0601010101"),
(2,"LeSecondNom",    "prénom2", "0702020202"),
(3,"DritteName",     "prénom3", "0603030303"),
(4,"commercial 4",   "prénom4", "0604040404"),
(11,"nom commercial 1", "prénom5", "0711111111"),
(12,"nom commercial 2", "prénom6", "0612121212"),
(13,"nom commercial 3", "prénom7", "0613131313");

DELETE FROM categorie
WHERE id_categorie!=0;

INSERT INTO `categorie` VALUES
(1, "Cordes", "img_cat1.jpg" ),
(2, "Claviers", "img_cat2.jpg"),
(3, "Vents", "img_cat3.jpg"),
(4, "sonorisation", "img_cat4.jpg");


DELETE FROM sous_categorie
WHERE id_sous_categorie != 0;

INSERT INTO `sous_categorie` VALUES
(1, "Guitares", "Guitares.jpg", 1),
(2, "Pianos", "pianos.jpg", 2),
(3, "Saxos", "saxos.jpg", 3),
(4, "Amplis", "amplis.jpg", 4);


      --    VIDAGE DE LA TABLE produit !!!
DELETE FROM produit
WHERE ref_produit != "";



INSERT INTO produit (ref_produit, libelle_produit, description_produit, prix_achat, prix_vente_pro, prix_vente_particuliers, visibilite_catalogue, stock_produit, image_produit, id_sous_categorie, id_fournisseur) VALUES
('PROD001', 'Guitare électrique Fender Stratocaster', 'Guitare électrique haut de gamme avec corps en aulne et manche en érable', 1200.00, 1999.99, 2199.99, 1, 10, 'guitare-electrique-fender-stratocaster.jpg', 1, 1),
('PROD002', 'Ampli Marshall JVM410H', 'Amplificateur à lampes pour guitare électrique avec 4 canaux et effets intégrés', 1500.00, 2799.99, 2999.99, 1, 5, 'ampli-marshall-jvm410h.jpg', 2, 2),
('PROD003', 'Batterie électronique Roland TD-17KVX', 'Batterie électronique professionnelle avec module de sons TD-17 et pads en mesh', 2000.00, 2899.99, 3099.99, 1, 3, 'batterie-electronique-roland-td-17kvx.jpg', 3, 3),
('PROD004', 'Piano numérique Yamaha P-515', 'Piano numérique portable avec clavier en bois et sons de haute qualité', 1300.00, 1999.99, 2199.99, 1, 7, 'piano-numerique-yamaha-p-515.jpg', 4, 4),
('PROD005', 'Violon acoustique Stradivarius', 'Violon acoustique de concert fabriqué à la main en érable et en épicéa', 5000.00, 7999.99, 8999.99, 1, 2, 'violon-acoustique-stradivarius.jpg', 5, 5),
('PROD006', 'Saxophone alto Selmer Mark VI', 'Saxophone alto professionnel en laiton doré avec clétage haut de gamme', 4000.00, 8999.99, 9999.99, 1, 1, 'saxophone-alto-selmer-mark-vi.jpg', 6, 6),
('PROD007', 'Clarinette Buffet-Crampon R13', 'Clarinette professionnelle en grenadille avec clétage argenté et système Boehm', 3000.00, 5999.99, 6499.99, 1, 3, 'clarinette-buffet-crampon-r13.jpg', 7, 7),
('PROD008', 'Harmonica diatonique Hohner Special 20', 'Harmonica diatonique avec corps en plastique et lames en laiton pour un son chaud et puissant', 30.00, 59.99, 69.99, 1, 20, 'harmonica-diatonique-hohner-special-20.jpg', 8, 8),
("PROD009", "Guitare acoustique", "Guitare acoustique 6 cordes en bois de qualité supérieure", 150.00, 250.00, 200.00, true, 50, "guitare_acoustique.jpg", 1, 1),
("PROD010", "Guitare électrique", "Guitare électrique corps en aulne, manche en érable, 2 micros double bobinage", 200.00, 350.00, 300.00, true, 30, "guitare_electrique.jpg", 1, 1),
("PROD011", "Ampli basse", "Amplificateur pour basse de 100W, 2 canaux, EQ 3 bandes", 250.00, 400.00, 350.00, true, 20, "ampli_basse.jpg", 2, 2),
("PROD012", "Piano numérique", "Piano numérique 88 touches, 3 pédales, 10 sons différents", 400.00, 700.00, 600.00, true, 10, "piano_numerique.jpg", 3, 3),
("PROD013", "Cajon", "Cajon en bois avec des cordes internes pour des effets sonores variés", 100.00, 150.00, 120.00, true, 15, "cajon.jpg", 4, 4),
("PROD014", "Tambourin", "Tambourin à cymbalettes en acier, avec peau de chèvre tendue à la main", 20.00, 30.00, 25.00, true, 100, "tambourin.jpg", 4, 4),
("PROD015", "Métronome", "Métronome électronique avec 10 rythmes différents", 15.00, 25.00, 20.00, true, 50, "metronome.jpg", 5, 5),
("PROD016", "Violon", "Violon de qualité supérieure, fabriqué à la main avec des matériaux de haute qualité", 300.00, 500.00, 450.00, true, 5, "violon.jpg", 6, 6),
("PROD017", "Saxophone", "Saxophone alto en laiton doré, avec étui de transport rigide", 600.00, 1000.00, 900.00, true, 2, "saxophone.jpg", 7, 7),
("PROD018", "Flûte traversière", "Flûte traversière en argent massif avec étui de transport", 400.00, 700.00, 600.00, true, 3, "flute_traversiere.jpg", 8, 8),
("PROD019", "Clarinette", "Clarinette en bois avec étui de transport rigide", 350.00, 600.00, 500.00, true, 4, "clarinette.jpg", 3, 3);


DELETE FROM commande
WHERE num_commande != "";

INSERT INTO commande VALUES
("2023 01 09 001", "Prod 0001", "2023-01-09", 02.50, "FACT_230109001", "Virement", TRUE, TRUE, "Adresse du client 1", 52121,"ville_cli1", 1020001),
("2023 01 09 002", "Prod 0002", "2023-01-09", 03.50, "FACT_230109002", "Virement", TRUE, TRUE, "Adresse du client 1", 52121,"ville_cli1", 1020001),
("2023 01 09 003", "Prod 0003", "2023-01-09", 06.50, "FACT_230109003", "Virement", TRUE, TRUE, "Adresse du client 1", 52121,"ville_cli1", 1020001);


















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
WHERE YEAR(date_commande)= 2023
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



