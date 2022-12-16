DROP DATABASE IF EXISTS Jarditou_full;
CREATE DATABASE Jarditou_full;
USE Jarditou_full;


CREATE TABLE `client` 
(
    `cli_id`        INT         NOT NULL,
    `cli_type`      BIT(1)      NOT NULL,
    `cli_nom`       VARCHAR(50) NOT NULL,
    `cli_prenom`    VARCHAR(50) NOT NULL,
    `cli_adresse`   VARCHAR(100)NOT NULL,
    `cli_CP`        CHAR(5)     NOT NULL,
    `cli_ville`     VARCHAR(50) NOT NULL,
    `cli_tel`       VARCHAR(10) NOT NULL,
    `cli_mail`      VARCHAR(50) NOT NULL,
    PRIMARY KEY (`cli_id`)
);

CREATE TABLE `commande` 
(
    `com_id`        INT         NOT NULL,
    `com_date`      DATE        NOT NULL,
    `com_liv`       DATE        NOT NULL,
    `com_etat`      VARCHAR(25) NOT NULL,
    `com_factOK`    BIT(1)      NOT NULL,
    `cli_id`        INT         NOT NULL,
    PRIMARY KEY (`com_id`),
    FOREIGN KEY (`cli_id`)      REFERENCES client (`cli_id`)
);

CREATE TABLE `fournisseur` 
(
    `fou_id`        INT         NOT NULL AUTO_INCREMENT,
    `fou_nom`       VARCHAR(50) NOT NULL,
    `fou_adresse`   VARCHAR(100)NOT NULL,
    `fou_CP`        CHAR(5)     NOT NULL,
    `fou_ville`     VARCHAR(50) NOT NULL,
    `fou_tel`       VARCHAR(10) NOT NULL,
    `fou_mail`      VARCHAR(50) NOT NULL,
    `fou_type`      BIT(1)      NOT NULL,
    PRIMARY KEY (`fou_id`)
);

CREATE TABLE `rubrique`
(
    `rub_id`        INT           AUTO_INCREMENT,
    `rub_libel`     VARCHAR(50)   NOT NULL,
    PRIMARY KEY (`rub_id`)
);



CREATE TABLE `produit`
(
    `pro_code`      CHAR(6)     NOT NULL,
    `pro_libel`     VARCHAR(100)NOT NULL,
    `pro_descript`  VARCHAR(250)NOT NULL,
    `pro_foto`      VARCHAR(250)NOT NULL,
    `pro_affich`    BIT(1)      NOT NULL,
    `pro_prix`      INT         NOT NULL,
    `pro_stk`       INT         NOT NULL,
    `pro_stkAlert`  INT         NOT NULL,
    `fou_id`        INT         NOT NULL,
    `rub_id`        INT,
    PRIMARY KEY (`pro_code`),
    FOREIGN KEY (`fou_id`)  REFERENCES fournisseur (`fou_id`),
    FOREIGN KEY (`rub_id`)  REFERENCES rubrique (`rub_id`)
);

CREATE TABLE `panier`
(
    `pan_qte`      INT         NOT NULL,
    `pan_PVpart`   FLOAT(2)    NOT NULL,
    `pan_PVpro`    FLOAT(2)    NOT NULL,
    `pro_code`     CHAR(6)     NOT NULL,
    `com_id`       INT         NOT NULL,
    PRIMARY KEY (`pro_code`, `com_id`),
    FOREIGN KEY (`com_id`) REFERENCES commande (`com_id`),
    FOREIGN KEY (`pro_code`) REFERENCES produit (`pro_code`)
);



/*===============================================================
======  création des index ======================================
=================================================================*/
CREATE INDEX `nom_cli` ON client (`cli_nom` ASC);
CREATE INDEX `dat_com` ON commande (`com_date` DESC);




/*=========================================================================================================================================
======  Creation des utilisateurs   =======================================================================================================
======                                                                                                                              =======
======  un 'gestionnaire' ayant uniquement le droit de consulter les tables produit, commande, client et panier                     =======
======                                                                                                                              =======
======  un 'approvisionneur' ayant le droit de lecture et d'écriture sur les produits, et de lecture uniquement sur les fournisseurs ======
======                                                                                                                              =======
======  un 'administrateur' ayant tous les droits sur la base de données                                                            =======
======                                                                                                                              =======
===========================================================================================================================================*/

DROP USER IF EXISTS 'gestion'@'localhost';                              /* utilisateur 'gestion'                                */
CREATE USER 'gestion'@'localhost' IDENTIFIED BY '1234';                 /*                                                      */
GRANT SELECT ON Jarditou_full.produit TO 'gestion'@'localhost';         /* droit de visu sur BASE Jarditou_full TABLE produit   */
GRANT SELECT ON Jarditou_full.commande TO 'gestion'@'localhost';        /* droit de visu sur la TABLE commande                  */
GRANT SELECT ON Jarditou_full.panier TO 'gestion'@'localhost';          /* droit de visu sur la TABLA panier                    */
FLUSH PRIVILEGES;

DROP USER IF EXISTS 'appro'@'localhost';                                /* utilisateur 'appro'*/
CREATE USER 'appro'@'localhost' IDENTIFIED BY '1234';                   /**/
GRANT SELECT, UPDATE  ON Jarditou_full.produit TO 'appro'@'localhost';  /* droit de visu et modif sur TABLE produit             */
GRANT SELECT ON Jarditou_full.fournisseur TO 'appro'@'localhost';       /* droit de visu sur TABLE fournisseur                  */
FLUSH PRIVILEGES;

DROP USER IF EXISTS 'admini'@'localhost';                               /* utilisateur 'admini'                                 */
CREATE USER 'admini'@'localhost' IDENTIFIED BY '1234';                  /*    !!! NE PAS CONFONDRE avec 'admin'   !!!!          */
GRANT ALL ON Jarditou_full.* TO 'admini'@'localhost' WITH GRANT OPTION; /* Tous les droits sur la BASE, y compris l'arrtibution des droits aux users  */
FLUSH PRIVILEGES;





INSERT INTO `client` (`cli_id`, `cli_type`, `cli_nom`, `cli_prenom`,`cli_adresse`, `cli_CP`,`cli_ville`, `cli_tel`, `cli_mail`) 
VALUES
    (2201, 0, 'alpha',   'prenom1',  'adrss1',  '80000', 'ville1',  '0122334455', 'alphus@aze.fr'),
    (2202, 0, 'bravo',   'prenom2',  'adrss2',  '25000', 'ville2',  '0222334455', 'bravus@eza.fr'),
    (2203, 1, 'charlie', 'prenom3',  'adrss3',  '12000', 'ville3',  '0333445566', 'charlus@fde.fr'),
    (2204, 1, 'delta',   'prenom4',  'adrss4',  '14000', 'ville4',  '0455667788', 'deltus@kgb.fr'),
    (2205, 0, 'echo',    'prenom5',  'adrss5',  '15000', 'ville5',  '0566778899', 'echus@pls.com'),
    (2206, 0, 'foxtrott','prenom6',  'adrss6',  '16000', 'ville6',  '0688996655', 'foxtrus@qkc.net'),
    (2207, 1, 'gamma',   'prenom7',  'adrss7',  '17000', 'ville7',  '0788990011', 'gammus@cle.com'),
    (2208, 1, 'henry',   'prenom8',  'adrss8',  '18000', 'ville8',  '0899001122', 'henrus@ppk.fr'),
    (2209, 0, 'india',   'prenom9',  'adrss9',  '66000', 'ville9',  '0900112233', 'indus@gfd.com'),
    (2210, 0, 'juliett', 'prenom10', 'adrss10', '14000', 'ville10', '0999887766', 'julius@qqq.fr');


INSERT INTO `commande` (`com_id`, `com_date`, `com_liv`, `com_etat`, `com_factOK`, `cli_id`) 
VALUES
    ('202201', '2022-01-01', '2022-01-15', 'commande livrée', 1, '2201'),
    ('202202', '2022-01-30', '2022-02-20', 'commande livrée', 1, '2202'),
    ('202203', '2022-02-01', '2022-03-01', 'commande livrée', 1, '2203'),
    ('202204', '2022-03-02', '2022-03-08', 'commande livrée', 1, '2204'),
    ('202205', '2022-03-01', '2022-03-12', 'commande livrée', 1, '2205'),
    ('202206', '2022-03-31', '2022-04-01', 'cde en transit',  0, '2206'),
    ('202207', '2022-04-05', '2022-04-15', 'cde en transit',  0, '2207'),
    ('202208', '2022-04-06', '2022-04-30', 'en préparation',  0, '2208'),
    ('202209', '2022-05-06', '2022-05-08', 'en préparation',  0, '2209'),
    ('202210', '2022-05-31', '2022-06-09', 'en préparation',  0, '2210');


INSERT INTO `fournisseur` (`fou_id`, `fou_nom`, `fou_adresse`, `fou_CP`, `fou_ville`, `fou_tel`, `fou_mail`, `fou_type`) 
VALUES
(100, 'IvoryWelch'      , '373-9577AcAv.'               , '53176' , 'MurrayBridge'    , '0375529063' , 'ante.blandit@aol.ca'                ,0),
(101, 'FlynnMorris'     , 'Ap#651-9014Lacinia.Road'     , '48495' , 'Santander'       , '0554107125' , 'iaculis.aliquet@protonmail.couk'    ,0),
(102, 'GenevieveSimmons', 'Ap#654-1702Ut,Road'          , '44961' , 'Chiusanico'      , '0959443711' , 'nulla.cras@yahoo.ca'                ,1),
(103, 'OctaviusGalloway', 'P.O.Box169,3766Elit.Rd.'     , '12802' , 'Salvador'        , '0579902752' , 'scelerisque.scelerisque@aol.org'    ,1),
(104, 'PhelanBerg'      , '490-5831Ornare,St.'          , '59170' , 'Konya'           , '0486334474' , 'nunc.nulla@outlook.org'             ,0);


INSERT INTO `rubrique` (`rub_id`, `rub_libel`) VALUES
	(1,  'Libell 01'),
	(2,  'libell 02'),
	(3,  'libell 3'),
	(4,  'libell 4'),
	(5,  'libelle 5'),
	(6,  'libelle 6'),
	(7,  'libelle 7'),
	(8,  'libelle 8'),
	(9,  'libelle 9'),
	(10, 'libelle 10');


INSERT INTO `produit` (`pro_code`, `pro_libel`, `pro_descript`, `pro_foto`, `pro_affich`, `pro_prix`, `pro_stk`, `pro_stkAlert`, `fou_id`, `rub_id`)
VALUES
    (100000, 'Libellé du produit ligne 01' ,'Description du produit ligne 01' ,'JKV86MNY7QF' , 0, 010, 1100,178, 102, 9),
    (100001, 'Libellé du produit ligne 02' ,'Description du produit ligne 02' ,'GMM13HLC1YR' , 0, 020, 968, 166, 104, 7),
    (100002, 'Libellé du produit ligne 03' ,'Description du produit ligne 03' ,'QCN30GNZ0KU' , 1, 030, 1343, 56, 101, 9),
    (100003, 'Libellé du produit ligne 04' ,'Description du produit ligne 04' ,'PKO16CUL6NA' , 1, 040, 407,  27, 103, 8),
    (100004, 'Libellé du produit ligne 05' ,'Description du produit ligne 05' ,'SKC11PIZ8SW' , 0, 050, 732,  93, 103, 4),
    (100005, 'Libellé du produit ligne 06' ,'Description du produit ligne 06' ,'DQL66YKT2XS' , 0, 060, 636, 159, 103, 8),
    (100006, 'Libellé du produit ligne 07' ,'Description du produit ligne 07' ,'SOY78PUR7MD' , 0, 070, 891,  31, 103,10),
    (100007, 'Libellé du produit ligne 08' ,'Description du produit ligne 08' ,'NQK33GDO8WF' , 1, 080, 406,  44, 101, 3),
    (100008, 'Libellé du produit ligne 09' ,'Description du produit ligne 09' ,'WDZ02SZD4KY' , 0, 090, 196, 119, 100, 6),
    (100009, 'Libellé du produit ligne 10' ,'Description du produit ligne 10' ,'GCJ66DYO6TZ' , 1, 100, 1377,122, 102, 9),
    (100010, 'Libellé du produit ligne 11' ,'Description du produit ligne 11' ,'MZM63SGR0RB' , 0, 110, 1080,151, 102, 1),
    (100011, 'Libellé du produit ligne 12' ,'Description du produit ligne 12' ,'OZN35QAY4NA' , 0, 120 ,1452,193, 101, 4),
    (100012, 'Libellé du produit ligne 13' ,'Description du produit ligne 13' ,'FJJ85WSN4LR' , 1, 130, 1193,185, 101, 1),
    (100013, 'Libellé du produit ligne 14' ,'Description du produit ligne 14' ,'HMN41SPD3CO' , 1, 140, 217, 109, 101, 6),
    (100014, 'Libellé du produit ligne 15' ,'Description du produit ligne 15' ,'LIR41EID6VZ' , 1, 150, 1416,112, 100, 3),
    (100015, 'Libellé du produit ligne 16' ,'Description du produit ligne 16' ,'TUB68WCI1OE' , 0, 160, 262,  44, 102, 8),
    (100016, 'Libellé du produit ligne 17' ,'Description du produit ligne 17' ,'IHM26RLO3KP' , 0, 170, 933, 103, 100, 8),
    (100017, 'Libellé du produit ligne 18' ,'Description du produit ligne 18' ,'FXF92KOF9WT' , 0, 180, 969, 191, 103, 9),
    (100018, 'Libellé du produit ligne 19' ,'Description du produit ligne 19' ,'PMT12KUJ2PY' , 0, 190, 664, 32,  103, 2),
    (100019, 'Libellé du produit ligne 20' ,'Description du produit ligne 20' ,'TGW09ANT2BN' , 1, 200, 1391,194, 100, 6);
 
    
INSERT INTO `panier` (`pro_code`, `com_id`, `pan_qte`, `pan_PVpart`, `pan_PVpro`)
VALUES
    (100000, '202201', 1, 020, 015),
    (100001, '202201', 2, 040, 030),
    (100002, '202202', 3, 060, 040),
    (100003, '202202', 2, 070, 050),
    (100004, '202203', 1, 080, 060),
    (100005, '202203', 2, 090, 070),
    (100006, '202204', 3, 100, 080),
    (100007, '202204', 8, 110, 085),
    (100008, '202205', 3, 180, 110),
    (100009, '202205', 2, 200, 120),
    (100010, '202206', 8, 200, 120),
    (100011, '202206', 9, 150, 130),
    (100012, '202207',12, 200, 145),
    (100013, '202207', 5, 250, 155),
    (100014, '202208', 1, 280, 160),
    (100015, '202208', 5, 300, 200),
    (100016, '202209', 1, 300, 220),
    (100017, '202209', 5, 340, 300),
    (100018, '202210', 1, 400, 220),
    (100019, '202210', 2, 300, 230);
    