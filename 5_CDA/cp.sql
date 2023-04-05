-- Active: 1679405822381@@127.0.0.1@3306@cp
DROP DATABASE cp;

CREATE DATABASE cp;

USE cp;

CREATE TABLE client (
	id_client 	    INT AUTO_INCREMENT  NOT NULL,
	nom 			VARCHAR(30) NOT NULL,
	prenom 			VARCHAR(30) NOT NULL,
	adresse 		VARCHAR(30) NOT NULL,
	ville 			VARCHAR(30) NOT NULL,
	PRIMARY KEY (id_client)
);

CREATE TABLE produit (
	id_produit		INT AUTO_INCREMENT NOT NULL,
	designation 	VARCHAR(30),
	prix_achat 		DOUBLE NOT NULL,
	prix_vente 		DOUBLE NOT NULL,
	PRIMARY KEY (id_produit)
);


DROP TABLE commande;

CREATE TABLE commande (
	id_commande		INT AUTO_INCREMENT NOT NULL,
	id_client 		INT ,
	date_commande 	DATETIME DEFAULT NOW(),
	remise 			INT NOT NULL,
	total			DOUBLE,
	PRIMARY KEY (id_commande),
	FOREIGN KEY (id_client) REFERENCES client(id_client)
);
DROP TABLE lignedecommande;

CREATE TABLE lignedecommande (
	id_commande	    INT,
	id_produit 		INT,
	prix		 	DOUBLE,
	quantite 		INT,
	FOREIGN KEY (id_commande) REFERENCES commande(id_commande),
	FOREIGN KEY (id_produit) REFERENCES produit(id_produit)
);


INSERT INTO client (id_client, nom, prenom, adresse, ville) VALUES (1, 'dupontel', 'bernard', 'rue du bas', 'flichcourt');
INSERT INTO client (id_client, nom, prenom, adresse, ville) VALUES (2, 'gates', 'bill', 'rue du haut', 'amiens');
INSERT INTO client (id_client, nom, prenom, adresse, ville) VALUES (3, 'apple', 'alfred', 'rue du milieu', 'abbeville');
INSERT INTO client (id_client, nom, prenom, adresse, ville) VALUES (4, 'bb', 'raoul', 'rue du bas', 'dreuil');
INSERT INTO client (id_client, nom, prenom, adresse, ville) VALUES (5, 'dupontel', 'jacques', 'rue du bas', 'paris');

INSERT INTO produit (id_produit, designation, prix_achat, prix_vente) VALUES (1, 'Lot de 10', 34, 6700);
INSERT INTO produit (id_produit, designation, prix_achat, prix_vente) VALUES (2, 'Lot de 40', 34, 6700);
INSERT INTO produit (id_produit, designation, prix_achat, prix_vente) VALUES (3, 'Gazon', 364, 700);
INSERT INTO produit (id_produit, designation, prix_achat, prix_vente) VALUES (4, 'Lot de 1', 34, 6700);
INSERT INTO produit (id_produit, designation, prix_achat, prix_vente) VALUES (5, 'Lot de 0', 34, 6700);

INSERT INTO commande (id_client, date_commande, remise) VALUES (2, '2018-09-01', 50);
INSERT INTO commande (id_client, date_commande, remise) VALUES (1, '2018-09-01', 10);
INSERT INTO commande (id_client, date_commande, remise) VALUES (2, '2018-09-01', 10);


INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (2, 3, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (2, 2, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (2, 1, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (2, 5, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (2, 4, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (1, 3, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (1, 2, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (1, 1, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (3, 3, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (3, 2, 10, 2);
INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (3, 2, 10, 2);



USE cp;

-- ==================================================================
CREATE PROCEDURE ajouter()
BEGIN
    INSERT INTO lignedecommande (id_commande, id_produit, prix, quantite) VALUES (5, 12, 15, 15);
END;

DROP PROCEDURE ajouter;

CALL ajouter();




CREATE TRIGGER maj_total AFTER INSERT ON lignedecommande
    FOR EACH ROW
    BEGIN
        DECLARE id_c INT;
        DECLARE tot DOUBLE;
        SET id_c = NEW.id_commande;
        SET tot = (SELECT sum(prix*quantite) FROM lignedecommande WHERE id_commande = id_c); 
        UPDATE commande SET total=tot WHERE id_commande=id_c;
END;


DROP TRIGGER maj_total;


