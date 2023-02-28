DROP DATABASE IF EXISTS Exercice2;
CREATE DATABASE Exercice2;
USE Exercice2;


CREATE TABLE Station(
    num_station INT(2),
    nom_station VARCHAR(50)
);


CREATE TABLE Hotel(
    capacite_hotel INT(3),
    categorie_hotel VARCHAR(15),
    nom_hotel VARCHAR(50),
    asresse_hotel VARCHAR(50),
    num_hotel INT(2),
    num_station INT(2)
);


CREATE TABLE Chambre(
    capacite_chambre INT(3),
    degre_confort INT(2),
    exposition VARCHAR(15),
    type_chambre VARCHAR(15),
    num_chambre INT(3),
    num_hotel INT(2)
);

CREATE TABLE Reservation(
    num_chambre INT(3),
    num_client INT(4),
    date_debut DATE,
    date_fin DATE,
    date_reservation DATE,
    montant_arrhes DECIMAL(3,2),
    prix_total DECIMAL(4,2)
);

CREATE TABLE Client(
    adresse_client VARCHAR(50),
    nom_client VARCHAR(50),
    prenom_client VARCHAR(50),
    num_client INT(4)
);


ALTER TABLE Station	ADD PRIMARY KEY (num_station);

ALTER TABLE Client ADD PRIMARY KEY (num_client);

ALTER TABLE Hotel ADD PRIMARY KEY (num_hotel);

ALTER TABLE Hotel 
ADD CONSTRAINT num_station 
FOREIGN KEY num_station 
REFERENCES Station (num_station);




ALTER TABLE Chambre ADD CONSTRAINT num_chambre PRIMARY KEY (num_chambre);

ALTER TABLE Reservation ADD CONSTRAINT (num_chambre,num_client) PRIMARY KEY (num_chambre,num_client);



ALTER TABLE Reservation ADD CONSTRAINT num_chambre FOREIGN KEY num_chambre REFERENCES Chambre(num_chambre);
ALTER TABLE Reservation ADD CONSTRAINT num_client FOREIGN KEY num_client REFERENCES Client(num_client);


