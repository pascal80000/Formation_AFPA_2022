DROP DATABASE IF EXISTS Exercice2;
CREATE DATABASE Exercice2;
USE Exercice2;


CREATE TABLE Station(
    num_station INT(2),
    nom_station VARCHAR(50)
);


CREATE TABLE Hotel(
    capacite_hotel INT(3),
    categorie_hotel INT(1),
    nom_hotel VARCHAR(50),
    adresse_hotel VARCHAR(50),
    num_hotel INT(2),
    num_station INT(2)
);


CREATE TABLE Chambre(
    capacite_chambre INT(2),
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
    num_client INT NOT NULL /* AUTO_INCREMENT: marche pas! */
);


ALTER TABLE Station	ADD PRIMARY KEY (num_station);

ALTER TABLE Client ADD PRIMARY KEY (num_client);

ALTER TABLE Hotel ADD PRIMARY KEY (num_hotel);

ALTER TABLE Hotel 
ADD CONSTRAINT num_station 
FOREIGN KEY (num_station) 
REFERENCES Station (num_station);




ALTER TABLE Chambre ADD PRIMARY KEY (num_chambre);

ALTER TABLE Reservation ADD PRIMARY KEY (num_chambre,num_client);

ALTER TABLE Chambre
ADD CONSTRAINT num_hotel
FOREIGN KEY (num_hotel)
REFERENCES Hotel (num_hotel);


ALTER TABLE Reservation
ADD CONSTRAINT num_chambre 
FOREIGN KEY (num_chambre)
REFERENCES Chambre (num_chambre);


ALTER TABLE Reservation
ADD CONSTRAINT num_client
FOREIGN KEY (num_client)
REFERENCES Client (num_client);


CREATE INDEX `num_client` ON Client (`num_client` ASC);


/* MODIFICARION des noms de colonne */

ALTER TABLE Station CHANGE num_station num_sta INT(2);
ALTER TABLE Station CHANGE nom_station nom_sta VARCHAR(50);

ALTER TABLE Hotel CHANGE capacite_hotel cap_htl INT(3);
ALTER TABLE Hotel CHANGE categorie_hotel cat_htl INT(1);
ALTER TABLE Hotel CHANGE nom_hotel nom_htl VARCHAR(50);
ALTER TABLE Hotel CHANGE adresse_hotel adr_htl VARCHAR(50); 
ALTER TABLE Hotel CHANGE num_hotel num_htl INT(2);
ALTER TABLE Hotel CHANGE num_station sta_htl INT(2);

ALTER TABLE Chambre CHANGE capacite_chambre cap_cha INT(2);
ALTER TABLE Chambre CHANGE degre_confort cft_cha INT(2);
ALTER TABLE Chambre CHANGE exposition exp_cha VARCHAR(15);
ALTER TABLE Chambre CHANGE type_chambre typ_cha VARCHAR(15);
ALTER TABLE Chambre CHANGE num_chambre num_cha INT(3);
ALTER TABLE Chambre CHANGE num_hotel htl_cha INT(2);

ALTER TABLE Reservation CHANGE num_chambre cha_res INT(3);
ALTER TABLE Reservation CHANGE num_client cli_res INT(4);
ALTER TABLE Reservation CHANGE date_debut deb_res DATE;
ALTER TABLE Reservation CHANGE date_fin fin_res DATE;
ALTER TABLE Reservation CHANGE date_reservation dat_res DATE;
ALTER TABLE Reservation CHANGE montant_arrhes arh_res DECIMAL(6,2);
ALTER TABLE Reservation CHANGE prix_total tot_res DECIMAL(6,2);

ALTER TABLE Client CHANGE adresse_client adr_cli VARCHAR(50);
ALTER TABLE Client CHANGE nom_client nom_cli VARCHAR(50);
ALTER TABLE Client CHANGE prenom_client pre_cli VARCHAR(50);
ALTER TABLE Client CHANGE num_client num_cli INT NOT NULL;

/* Réécriture des contraintes !!!   INUTILE, c'est automatique.


ALTER TABLE Station	ADD PRIMARY KEY (num_sta);

ALTER TABLE Client ADD PRIMARY KEY (num_cli);

ALTER TABLE Hotel ADD PRIMARY KEY (num_htl);

ALTER TABLE Hotel 
ADD CONSTRAINT num_sta 
FOREIGN KEY (num_sta) 
REFERENCES Station (num_sta);




ALTER TABLE Chambre ADD PRIMARY KEY (num_cha);

ALTER TABLE Reservation ADD PRIMARY KEY (num_cha,num_cli);



ALTER TABLE Reservation
ADD CONSTRAINT num_cham
FOREIGN KEY (num_cha)
REFERENCES Chambre (num_cha);


ALTER TABLE Reservation
ADD CONSTRAINT num_cli
FOREIGN KEY (num_cli)
REFERENCES Client (num_cli);


CREATE INDEX `num_cli` ON Client (`num_cli` ASC);
*/

