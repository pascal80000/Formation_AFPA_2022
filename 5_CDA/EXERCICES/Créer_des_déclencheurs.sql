-- Active: 1679405822381@@127.0.0.1@3306@hotel

USE hotel;

insert into station (sta_nom, sta_altitude) values ('station du bas', 666);

CREATE TRIGGER insert_station AFTER INSERT ON station
    FOR EACH ROW
    BEGIN
        DECLARE altitude INT;
        SET altitude = NEW.sta_altitude;
        IF altitude<1000 THEN
            SIGNAL SQLSTATE '40000' 
            SET MESSAGE_TEXT = 'Un problème est survenu. Règle de gestion altitude !';
        END IF;
END;

DROP TRIGGER insert_station;



--  ========================================================
--  =======    EXERCICES    ================================
--  ========================================================



-- Exercice 1. modif_reservation : 
--             interdire la modification des réservations 
--             (on autorise l'ajout et la suppression).

CREATE OR REPLACE TRIGGER modif_reservation AFTER UPDATE ON reservation
    FOR EACH ROW
        BEGIN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Impossible de modifier !';
    END;


UPDATE reservation
SET res_date = "2017-01-10"
WHERE res_cli_id = "1";



-- Exercice 2. insert_reservation : 
--             interdire l'ajout de réservation pour 
--             les hôtels possédant déjà 10 réservations.
CREATE OR REPLACE TRIGGER insert_reservation AFTER INSERT ON reservation
    FOR EACH ROW
        BEGIN
            IF (COUNT(reservation.res_date)>100)
                THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Max 10 réservations atteint !';
            END IF;
        END;

INSERT INTO reservation (res_cha_id, res_cli_id, res_date, res_date_debut, res_date_fin, res_prix, res_arrhes) VALUES
(1,1,'2018-01-01', '2018-08-15', '2018-08-21', 3600, 10);


-- Exercice 3. insert_reservation2 : interdire les réservations si 
--             le client possède déjà 3 réservations.

/*CREATE TRIGGER insert_reservation2 BEFORE INSERT ON reservation
    -- FOR EACH ROW
        BEGIN
            IF 

*/




-- Exercice 4. insert_chambre : lors d'une insertion, 
--             on calcule le total des capacités des chambres pour l'hôtel, 
--             si ce total est supérieur à 50,
--             on interdit l'insertion de la chambre.

CREATE TRIGGER insert_chambre BEFORE INSERT ON chambre

        BEGIN
            SELECT SUM(cha_capacite) FROM chambre;
            IF SUM(cha_capacite)>=500 THEN
                SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Max capacité atteint !';
    END;






--  =============================================================
--  ======= Exercice papyrus     ================================
--  =============================================================


USE papyrus;


CREATE TABLE `articles_a_commander`
    (
    `codart` char(4),
    `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
    `qte` int(11),
    `deja` int(11),
    PRIMARY KEY (`codart`)
    );


--  ajout de la référence I120 dans la table produit.
INSERT INTO `produit` (`codart`, `libart`, `stkale`, `stkphy`, `qteann`, `unimes`) 
    VALUES
        ('I120','nouveau i120', 5, 20, 0, 'unite');

--  vérif de l'ajout ci-dessus = Ok
SELECT * FROM produit WHERE codart =("I120");

--  vérif que la table 'article_a_commander' est bien créée = Ok
SELECT * FROM articles_a_commander;




-- CREATION du déclencheur

CREATE TRIGGER a_commander AFTER UPDATE
ON produit FOR EACH ROW
    BEGIN
        SELECT stkphy, stkale, (stkale-stkphy)AS diff
        FROM produit
        JOIN articles_a_commander ON produit.codart = articles_a_commander.codart
            
                SELECT diff;

            IF (NEW.diff < 0) 
                THEN 
                    UPDATE articles_a_commander
                    SET qte=(qte+(stkale-stkphy))
            END IF;
    END;

DROP TRIGGER a_commander;

-- SHOW SESSION VARIABLES;

-- GRANT ALL PRIVILEGES ON papyrus.* TO 'admin'@'localhost';
-- FLUSH PRIVILEGES;

-- mysqldump --user='admin'@'localhost' --password='code' papyrus >bkp_papyrus_29_03_2023.sql
SHOW TRIGGERS;

