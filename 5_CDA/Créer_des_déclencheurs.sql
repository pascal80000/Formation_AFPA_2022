-- Active: 1679405822381@@127.0.0.1@3306@hotel


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

CREATE TRIGGER modif_reservation AFTER UPDATE ON reservation
    FOR EACH ROW
        BEGIN
        SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Impossible de modifier !';
    END;




-- Exercice 2. insert_reservation : 
--             interdire l'ajout de réservation pour 
--             les hôtels possédant déjà 10 réservations.








-- Exercice 3. insert_reservation2 : interdire les réservations si 
--             le client possède déjà 3 réservations.








-- Exercice 4. insert_chambre : lors d'une insertion, 
--             on calcule le total des capacités des chambres pour l'hôtel, 
--             si ce total est supérieur à 50,
--             on interdit l'insertion de la chambre.





