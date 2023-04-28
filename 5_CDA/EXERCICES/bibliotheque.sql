-- Active: 1679405822381@@127.0.0.1@3306@bibliotheque
DROP DATABASE IF EXISTS bibliotheque;

CREATE DATABASE bibliotheque;

USE bibliotheque;

DROP TABLE personnel;

CREATE TABLE personnel(
   id_personnel INT,
   fonction_personnel VARCHAR(50),
   date_entree DATE,
   PRIMARY KEY(id_personnel)
);


INSERT INTO personnel(id_personnel, fonction_personnel, date_entree) VALUES
(1, 'Responsable RH', '2020-01-01'),
(2, 'Ingénieur logiciel', '2019-05-15'),
(3, 'Comptable', '2021-03-02'),
(4, 'Développeur web', '2020-07-10'),
(5, 'Assistant administratif', '2022-02-15'),
(6, 'Analyste financier', '2018-11-01'),
(7, 'Gestionnaire de projet', '2017-09-20'),
(8, 'Technicien de maintenance', '2021-01-10'),
(9, 'Spécialiste en marketing', '2019-08-15'),
(10, 'Assistant des ressources humaines', '2022-03-01');




CREATE TABLE visionneuse(
   id_visionneuse VARCHAR(50),
   PRIMARY KEY(id_visionneuse)
);
DROP TABLE client;

CREATE TABLE client(
   id_client INT,
   nom VARCHAR(50),
   prenom VARCHAR(50),
   adresse_client VARCHAR(50),
   ville_client VARCHAR(50),
   CP_client CHAR(5),
   tel_client VARCHAR(50),
   date_cotisation DATE,
   id_visionneuse VARCHAR(50),
   PRIMARY KEY(id_client),
   -- UNIQUE(id_visionneuse),
   FOREIGN KEY(id_visionneuse) REFERENCES visionneuse(id_visionneuse)
);

INSERT INTO client (id_client, nom, prenom, adresse_client, ville_client, CP_client, tel_client, date_cotisation, id_visionneuse) VALUES
(1, 'Dupont', 'Jean', '12 rue des Lilas', 'Paris', '75001', '0123456789', '2022-01-15', 'ABC123'),
(2, 'Martin', 'Sophie', '8 rue du Château', 'Lyon', '69002', '0612345678', '2022-03-12', 'DEF456'),
(3, 'Dufour', 'Pierre', '20 avenue de la Gare', 'Marseille', '13001', '0612345678', '2022-05-20', 'GHI789'),
(4, 'Lecomte', 'Marie', '16 rue de la Paix', 'Lille', '59000', '0321654987', '2022-02-28', 'JKL012'),
(5, 'Roux', 'Luc', '5 avenue des Fleurs', 'Nice', '06000', '0498765432', '2022-04-15', 'MNO345');




CREATE TABLE document(
   id_document INT AUTO_INCREMENT,
   type_document VARCHAR(50),
   cote_document VARCHAR(50),
   statut_document VARCHAR(50),
   date_sortie DATE,
   id_lecteur INT,
   PRIMARY KEY(id_document),
   FOREIGN KEY(id_lecteur) REFERENCES client(id_lecteur)
);

CREATE TABLE gere(
   id_personnel INT,
   id_document INT,
   caution VARCHAR(50),
   achete VARCHAR(50),
   PRIMARY KEY(id_personnel, id_document),
   FOREIGN KEY(id_personnel) REFERENCES personnel(id_personnel),
   FOREIGN KEY(id_document) REFERENCES document(id_document)
);

CREATE TABLE occupe(
   id_lecteur INT,
   id_personnel INT,
   PRIMARY KEY(id_lecteur, id_personnel),
   FOREIGN KEY(id_lecteur) REFERENCES client(id_lecteur),
   FOREIGN KEY(id_personnel) REFERENCES personnel(id_personnel)
);



