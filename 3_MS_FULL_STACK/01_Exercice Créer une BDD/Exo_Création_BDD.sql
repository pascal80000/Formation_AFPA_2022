
/*
// ===================================================
// ====== 1 Création dde la base et ses tables =======
// ===================================================
*/

DROP DATABASE IF EXISTS Exercice;
CREATE DATABASE Exercice;
USE Exercice;


CREATE TABLE `client` (
    `cli_num` INT NOT NULL AUTO_INCREMENT,
    `cli_nom` VARCHAR(50) NOT NULL,
    `cli_adresse` VARCHAR(50) NOT NULL,
    `cli_tel` VARCHAR(30)
);




CREATE TABLE `produit` (
    `pro_num` INT NOT NULL,
    `pro_libelle` VARCHAR(64) NOT NULL,
    `pro_description` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`pro_num`)
);


CREATE TABLE `commande` (
    `com_num` INT NOT NULL,
    `cli_num` INT NOT NULL,
    `com_date` DATE NOT NULL,
    `com_obs` VARCHAR(255)
);


CREATE TABLE `detail` (
    `com_num` INT NOT NULL,
    `pro_num` INT NOT NULL,
    `det_qte` INT NOT NULL
);



ALTER TABLE client ADD PRIMARY KEY (`cli_num`);
ALTER TABLE `cli_num` AUTO_INCREMENT=50;            /* donne la valeur '50' au premier numéro de client */
ALTER TABLE commande ADD PRIMARY KEY (`com_num`);
ALTER TABLE commande ADD KEY `cli_num` (`cli_num`);
ALTER TABLE commande ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`cli_num`) REFERENCES `client` (`cli_num`);
ALTER TABLE detail ADD PRIMARY KEY (`com_num`,`pro_num`);
ALTER TABLE detail ADD KEY `pro_num` (`pro_num`);
ALTER TABLE detail ADD CONSTRAINT `detail_ibfk_1` FOREIGN KEY (`com_num`) REFERENCES `commande` (`com_num`);
ALTER TABLE detail ADD CONSTRAINT `detail_ibfk_2` FOREIGN KEY (`pro_num`) REFERENCES `produit` (`pro_num`);



/*
// ========================================================================================================================
// ====== 2 Renommez les attributs (champs) des différentes tables pour obtenir un système de codification uniforme  ======
// ========================================================================================================================
...........  ?? 


// ========================================================================================================================
// ====== 3 Listez les différentes contraintes d’intégrité à respecter  ===================================================
// ========================================================================================================================


TABLE `client` (
    `cli_num` INT NOT NULL,                 INT: c'est un nombre entier,  NOT NULL : ne peut être nul ou vide.
    `cli_nom` VARCHAR(50) NOT NULL,         VARCHAR(50): c'est une chaîne de caractères, limitée à 50 caractères, 
    `cli_adresse` VARCHAR(50) NOT NULL,                     ne peut être vide.
    `cli_tel` VARCHAR(30)                     ..........   chaîne limitée à 30 caractères, peut être vide.


TABLE `produit` (
    `pro_num` INT NOT NULL,                         nombre non nul attendu.
    `pro_libelle` VARCHAR(64) NOT NULL,             chaîne de 64 caractères MAX attendue.
    `pro_description` VARCHAR(255) NOT NULL,        chaîne de 255 caractères MAX attendue.


TABLE `commande` (
    `com_num` INT NOT NULL,                         nombre non nul attendu.
    `cli_num` INT NOT NULL,                         nombre non nul attendu.
    `com_date` DATE NOT NULL,                       DATE valide attendue.
    `com_obs` VARCHAR(255)                          chaîne de 255 caractères MAX, facultative.


TABLE `detail` (
    `com_num` INT NOT NULL,                         nombre non nul attendu.
    `pro_num` INT NOT NULL,                         nombre non nul attendu.
    `det_qte` INT NOT NULL                          nombre non nul attendu.



// ========================================================================================================================
// ====== 4 Définissez les clés primaires et les clés étrangères sur les différentes tables.  =============================
// ========================================================================================================================


                    Clés primaires              Clés étrangères

TABLE `client`      cli_num

TABLE `produit`     pro_num                     

TABLE `commande`    com_num                     cli_num
                    cli_num

TABLE `detail`      com_num
                    pro_num


*/