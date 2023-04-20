-- Active: 1679405822381@@127.0.0.1@3306@villagegreen

DROP DATABASE IF EXISTS villagegreen;

CREATE DATABASE villagegreen;


USE villagegreen;

CREATE TABLE client(
   cli_id INT AUTO_INCREMENT NOT NULL,
   cli_nom VARCHAR(50) NOT NULL,
   cli_prenom VARCHAR(50) NOT NULL,
   cli_adresse VARCHAR(50),
   cli_cp VARCHAR(5) NOT NULL,
   cli_ville VARCHAR(50),
   cli_commercial VARCHAR(50) NOT NULL,
   cli_remise DECIMAL(4,2) NOT NULL,
   cli_coef DECIMAL(4,2),
   PRIMARY KEY(cli_id)
);

INSERT INTO  client  (cli_id, cli_nom, cli_prenom, cli_adresse, cli_cp, cli_ville, cli_commercial, cli_remise, cli_coef) VALUES
( 1 , " Christophe " , " Brody "        , " 52474 Eagle Crest Alley " , "69000"  , " Lyon "     , 1 , 5.00   , 10.00),
( 2 , " Daffern "    , " Lorna "        , " 4455 rue Sage "           , "38030"  , " Grenoble " , 2 , 5.00   , 15.00),
( 3 , " Peirazzi "   , " Evangeline "   , " 48916 Kedzie Plaza "      , "12103"  , " Berlin "   , 1 , 5.00   , 10.00),
( 4 , " Doidge "     , " Michel "       , " 77 Bartelt Pass "         , "75675"  , " Paris 14 " , 3 , 10.00  , 4.00 ),
( 5 , " Whyler "     , " Madelyn "      , " 0553 Old Gate Place "     , "85000"  , "La Roche "  , 2 , 5.00   , 5.00 );


CREATE TABLE fournisseur(
   fou_id INT AUTO_INCREMENT NOT NULL,
   fou_nom VARCHAR(50) NOT NULL,
   fou_adr VARCHAR(250) NOT NULL,
   fou_cp VARCHAR(50) NOT NULL,
   fou_ville VARCHAR(50) NOT NULL,
   PRIMARY KEY(fou_id)
);

INSERT INTO fournisseur (fou_id, fou_nom, fou_adr, fou_cp, fou_ville) VALUES
(1,"Erasmus"  ,"Appartement175-6496 Erat, Rue",    02512, "Vilfournis1"),
(2,"Shana"    ,"CP 455, 1063 Pede, Rue",           03258, "Vilfournis2"),
(3,"Imogene"  ,"2601 In Route",                    06222, "Vilfournis3"),
(4,"Jin"      ,"5580 Donec Rue",                   55213, "Vilfournis4"),
(5,"Odysseus" ,"9439 Nisi. Av.",                   76652, "Vilfournis5"),
(6,"Hector"   ,"805-6084 Luctus Ave",              48023, "Vilfournis6"),
(7,"Cynthia"  ,"ppartement606-3831 Arcu Rue",      13110, "Vilfournis7"),
(8,"Dacey"    ,"Appartement259-3766 Donec Impasse",08002, "Vilfournis8"),
(9,"Jasmine"  ,"642-9273 Semper, Av.",             59120, "Vilfournis9"),
(10,"Travis"   ,"Appartement899-1647 Auctor Ave",   62100, "Vilfournis0");

CREATE TABLE commercial(
   com_id INT AUTO_INCREMENT NOT NULL,
   com_nom VARCHAR(50) NOT NULL,
   com_prenom VARCHAR(50) NOT NULL,
   com_adresse VARCHAR(50) NOT NULL,
   com_cp VARCHAR(50) NOT NULL,
   com_ville VARCHAR(50) NOT NULL,
   com_client VARCHAR(50) NOT NULL,
   PRIMARY KEY(com_id)
);

INSERT INTO  commercial (com_id, com_nom, com_prenom, com_adresse, com_cp, com_ville, com_client) VALUES
( 1 , "Clues"    , "Anica"   , " 9543 Hudson Way"     , 42963  ,"Saint-Étienne"  , "  " ),
( 2 , "Creaven"  , "Jilleen" , " 4 rue Erie"          , 69624  ,"Villeurbanne"   , "  " ),
( 3 , "Folker"   , "Carolyne", " 2650 Monica Crossing", 45957  ,"Orléans"        , "  " ),
( 4 , "Lethley"  , "Aggie"   , " 3 Sloan Avenue"      , 58209  ,"Cosne"          , "  " ),
( 5 , "Fielden"  , "Donetta" , " 7580 Haas Circle"    , 75171  ,"Paris 19"       , "  " ) ;

CREATE TABLE categorie(
   cat_id INT AUTO_INCREMENT NOT NULL,
   cat_nom VARCHAR(50),
   cat_image VARCHAR(50),
   PRIMARY KEY(cat_id)
);

INSERT INTO  categorie (cat_id, cat_nom, cat_image) VALUES
( 1 , "guitare", "img1" ),
( 2 , "batterie", "img2"),
( 3 , "piano", "img3" );


CREATE TABLE sous_categorie(
   sousCat_id INT AUTO_INCREMENT NOT NULL,
   sousCat_nom VARCHAR(50),
   sousCat_image VARCHAR(50),
   sousCat_cat_id INT NOT NULL,
   PRIMARY KEY(sousCat_id),
   FOREIGN KEY(sousCat_cat_id) REFERENCES categorie(cat_id)
);

INSERT INTO  sous_categorie  (sousCat_id, sousCat_nom, sousCat_image, sousCat_cat_id) VALUES
( 1 , "guitareElectrique" ,"img1", 1 ),
( 2 , "guitareClassique","img2", 1 ),
( 3 , "batterieAccoustique" ,"img3", 2 ),
( 4 , "batterieElectronique" ,"img4", 2 ),
( 5 , "pianoNumerique" ,"img5", 3 );


CREATE OR REPLACE TABLE produit( 
   pro_id VARCHAR(50) NOT NULL,
   pro_libelle VARCHAR(255) NOT NULL,
   pro_descript VARCHAR(255) NOT NULL,
   pro_prixAchat DECIMAL(8,2) NOT NULL,
   pro_prixVente DECIMAL(8,2) NOT NULL,
   pro_PVPart DECIMAL(8,2),
   pro_visible BOOLEAN,
   pro_stock SMALLINT NOT NULL,
   pro_image VARCHAR(50) NOT NULL,
   pro_sousCat_id INT NOT NULL,
   pro_fou_id INT NOT NULL,
   PRIMARY KEY(pro_id),
   FOREIGN KEY(pro_sousCat_id) REFERENCES sous_categorie(sousCat_id)
  
);

INSERT INTO produit (pro_id, pro_libelle, pro_descript, pro_prixAchat, pro_prixVente, pro_PVPart, pro_visible, pro_stock, pro_image, pro_sousCat_id, pro_fou_id)
VALUES
 ( 1 , " Epiphone "  , " Vermillion "  , 598.00    , 600.00  , 650.00   , TRUE  , 100 , " picture_1 " , 1 , 1 ),
 ( 2 , " Fender "    , " Tom "         , 1499.00   , 1500.00 , 1550.00  , TRUE  , 200 , " picture_2 " , 1 , 1 ),
 ( 3 , " Esp "       , " Hammet"       , 616.00    , 620.00  , 650.00   , TRUE  , 10  , " picture_3 " , 1 , 1 ),
 ( 4 , " Gibson "    , " Paul Custom " , 6799.00   , 6800.00 , 6850.00  , TRUE  , 10  , " picture_4"  , 1 , 1 ),
 ( 5 , " Millenium " , " Junior Drum " , 179.00    , 180.00  , 230.00   , FALSE , 10  , " picture_5"  , 2 , 3 ),
 ( 6 , " Startone "  , " Star Drum "   , 269.00    , 270.00  , 320.00   , TRUE  , 4   , " picture_6"  , 2 , 3 ),
 ( 7 , " Mapex "     , " Zildan "      , 598.00    , 600.00  , 650.00   , TRUE  , 12  , " picture_7"  , 2 , 3 ),
 ( 8 , " Thomann "   , " WH "          , 579.00    , 580.00  , 630.00   , TRUE  , 22  , " picture_8"  , 3 , 6 ),
 ( 9 , " Roland "    , " BKX "         , 799.00    , 800.00  , 850.00   , TRUE  , 52  , " picture_9"  , 3 , 6 ),
 ( 10 , " Casio "    , " S110 "        , 379.00    , 380.00  , 430.00   , TRUE  , 1   , " picture_10"  , 3 , 6 );


CREATE OR REPLACE TABLE commande(
   cde_id VARCHAR(50),
   cde_pro_id VARCHAR(50),
   cde_dateCde DATE,
   cde_remise DECIMAL(4,2),
   cde_validationCde BOOLEAN,
   cde_cdeComplete BOOLEAN,
   cde_modePaiement VARCHAR(50),
   cde_validationPaiement BOOLEAN,
   cde_numFact VARCHAR(50),
   cde_dateFact DATE,
   cde_adrFact VARCHAR(50),
   cde_cpFact CHAR(5),
   cde_villeFact VARCHAR(50),
   cde_cli_id INT NOT NULL,
   PRIMARY KEY(cde_id),
   FOREIGN KEY(cde_cli_id) REFERENCES client(cli_id)
);


INSERT INTO commande (cde_id, cde_pro_id, cde_dateCde, cde_remise, cde_validationCde, cde_cdeComplete, cde_modePaiement, cde_validationPaiement, cde_numFact, cde_dateFact, cde_adrFact, cde_cpFact, cde_villeFact, cde_cli_id) VALUES
( 1 , 1 , "2023-04-20" , 5.00    ,TRUE , TRUE , "CB",TRUE , "2017","2023-04-20"," adr1","13000","Marseille"  , 2),
( 2 , 1 , "2023-03-20" , 10.00   ,TRUE , TRUE , "CH",TRUE , "2022","2023-03-20"," adr2","14000","Amiens"     , 3),
( 3 , 2 , "2023-02-19" , 8.00    ,TRUE , TRUE , "CB",TRUE , "2018","2023-02-19"," adr3","15000","Montpellier", 1),
( 4 , 3 , "2023-04-18" , 6.00    ,TRUE , TRUE , "CB",TRUE , "2019","2023-04-18"," adr4","16000","Avignon"    , 4),
( 5 , 3 , "2023-03-15" , 5.00    ,TRUE , TRUE , "CB",TRUE , "2012","2023-03-15"," adr5","17000","Rochefort"  , 5);


CREATE OR REPLACE TABLE livraison(
   liv_id VARCHAR(50),
   liv_date DATE,
   liv_cde_id VARCHAR(50) NOT NULL,
   liv_pro_id VARCHAR(50),
   liv_adresse VARCHAR(50),
   liv_cp CHAR(5),
   liv_ville VARCHAR(50),

   PRIMARY KEY(liv_id),
   FOREIGN KEY(liv_cde_id) REFERENCES commande(cde_id)
);


INSERT INTO  livraison (liv_id, liv_date, liv_cde_id, liv_pro_id, liv_adresse, liv_cp, liv_ville) VALUES
( 1 , " 2023-05-16", 1 ,1,"liv1_adr","cp1","brest"),
( 2 , " 2023-07-27", 2 ,2,"liv2_adr","cp2","rouen"),
( 3 , " 2023-07-27", 2 ,2,"liv3_adr","cp3","paris"),
( 4 , " 2023-08-05", 3 ,3,"liv3_adr","cp4","chambery"),
( 5 , " 2023-09-18", 4 ,4,"liv4_adr","cp5","grenoble"),
( 6 , " 2023-09-18", 5 ,5,"liv5_adr","cp6","amiens");

CREATE TABLE client_commercial(
   cli_id INT,
   com_id INT,
   particuliers BOOLEAN,
   PRIMARY KEY(cli_id, com_id),
   FOREIGN KEY(cli_id) REFERENCES client(cli_id),
   FOREIGN KEY(com_id) REFERENCES commercial(com_id)
);

CREATE TABLE commande_produit(
   pro_id VARCHAR(50),
   cde_id VARCHAR(50),
   quantite SMALLINT,
   total_article DECIMAL(15,2),
   prix_unitaire DECIMAL(15,2),
   validation_panier BOOLEAN,
   PRIMARY KEY(pro_id, cde_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(cde_id) REFERENCES commande(cde_id)
);

CREATE TABLE produit_livraison(
   pro_id VARCHAR(50),
   liv_id VARCHAR(50),
   quantite SMALLINT,
   PRIMARY KEY(pro_id, liv_id),
   FOREIGN KEY(pro_id) REFERENCES produit(pro_id),
   FOREIGN KEY(liv_id) REFERENCES livraison(liv_id)
);














