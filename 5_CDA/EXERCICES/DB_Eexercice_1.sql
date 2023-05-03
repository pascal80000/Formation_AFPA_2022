DROP DATABASE IF EXISTS Exercice1;
CREATE DATABASE Exercice1;
USE Exercice1;


CREATE TABLE Personne(
    per_num INT AUTO_INCREMENT,
    per_nom VARCHAR,
    per_prenom VARCHAR,
    per_adresse VARCHAR,
    per_ville VARCHAR,
    PRIMARY KEY(per_num)
);


CREATE TABLE Groupe(
    gro_num INT AUTO_INCREMENT,
    gro_libelle VARCHAR,
    PRIMARY KEY(gro_num)
);


CREATE TABLE Appartient(
    per_num INT,
    gro_num INT,
    PRIMARY KEY(per_num,gro_num),
    FOREIGN KEY(per_num) REFERENCES Personne(per_num),
    FOREIGN KEY(gro_num) REFERENCES Groupe(gro_num)
);

