-- Active: 1679299363968@@127.0.0.1@3306@filrouge
DROP DATABASE IF EXISTS filrouge;
CREATE DATABASE filrouge;
USE filrouge;


CREATE TABLE Clients(
   num_cli INT NOT NULL AUTO_INCREMENT,
   nom_cli VARCHAR(50),
   com_cli VARCHAR(50) NOT NULL,
   cde_cli VARCHAR(50) NOT NULL,
   adr_cli VARCHAR(50),
   typ_cli BOOLEAN,
   rem_cli DECIMAL(4,2),
   PRIMARY KEY(num_cli)
);

CREATE TABLE Fournisseurs(
   id_fou INT NOT NULL AUTO_INCREMENT,
   nom_fou VARCHAR(50),
   adr_fou VARCHAR(255),
   PRIMARY KEY(id_fou)
);

CREATE TABLE Commerciaux(
   nom_com VARCHAR(50),
   cli_com VARCHAR(50) NOT NULL,
   num_cli INT NOT NULL,
   PRIMARY KEY(nom_com),
   FOREIGN KEY(num_cli) REFERENCES Clients(num_cli)
);

CREATE TABLE Produits(
   ref_pdt VARCHAR(50),
   nom_pdt VARCHAR(50),
   lib_pdt VARCHAR(255),
   rub_pdt VARCHAR(255),
   sru_pdt VARCHAR(255),
   pra_pdt DECIMAL(7,2),
   pvp_pdt DECIMAL(7,2),
   pvi_pdt DECIMAL(7,2),
   vue_pdt BOOLEAN,
   stk_pdt SMALLINT,
   img_pdt VARCHAR(50),
   rff_pdt VARCHAR(50),
   id_fou INT NOT NULL,
   PRIMARY KEY(ref_pdt),
   FOREIGN KEY(id_fou) REFERENCES Fournisseurs(id_fou)
);

CREATE TABLE Commandes(
   num_cde VARCHAR(50),
   lig_cde VARCHAR(50),
   art_cde VARCHAR(50),
   dat_cde DATE,
   val_cde INT,
   env_cde INT,
   rec_cde DATE,
   acc_cde INT,
   rem_cde DECIMAL(4,2),
   pay_cde INT,
   num_cli INT NOT NULL,
   PRIMARY KEY(num_cde),
   FOREIGN KEY(num_cli) REFERENCES Clients(num_cli)
);

CREATE TABLE Panier(
   lig_pan INT,
   ref_pan VARCHAR(50),
   qte_pan SMALLINT,
   pri_pan DECIMAL(15,2),
   tot_pan DECIMAL(15,2),
   val_pan SMALLINT,
   ref_pdt VARCHAR(50) NOT NULL,
   num_cde VARCHAR(50) NOT NULL,
   PRIMARY KEY(lig_pan),
   FOREIGN KEY(ref_pdt) REFERENCES Produits(ref_pdt),
   FOREIGN KEY(num_cde) REFERENCES Commandes(num_cde)
);




-- ===========================================================
-- ======  CREATION DES INDEX  ===============================
-- ===========================================================

CREATE INDEX ref_pdt ON Produits(ref_pdt ASC);  -- Index Produits par ref.

CREATE INDEX num_cde ON Commandes(num_cde ASC);

CREATE INDEX num_cli ON Clients(num_cli ASC);

CREATE INDEX id_fou ON Fournisseurs(id_fou ASC);




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
