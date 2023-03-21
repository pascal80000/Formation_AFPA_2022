-- Active: 1679299363968@@127.0.0.1@3306@papyrus
CREATE VIEW IF NOT EXISTS v_affiche
AS
    SELECT prix1, prix2
    FROM vente;

SHOW CREATE VIEW v_affiche  --  OK
;
SELECT * FROM v_affiche --  OK
;
DROP VIEW v_affiche -- OK
;



CREATE OR REPLACE VIEW  v_augmentation-- !!!!!
AS                              --  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    UPDATE papyrus.vente        -- !!!!  une VIEW ne peut contenir!!!!!
    SET prix1 = prix1 * 1.04,   -- !!!!  ce type d'instructions !!!!!!!
        prix2 = prix2 * 1.02    -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    WHERE numfou = 9180     -- !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;


UPDATE papyrus.vente                        --  applique les augmentations
    SET prix1 = prix1 * 1.04,
        prix2 = prix2 * 1.02
    WHERE numfou = 9180;

SELECT prix1, prix2                 --  affiche les prix
    FROM vente
    WHERE numfou = 9180;

CREATE OR REPLACE VIEW v_augmentation
AS SELECT prix1, prix2
    FROM vente
    WHERE numfou = 9180;

SELECT * FROM v_augmentation

;


SHOW CREATE VIEW v_augmentation
;

DROP VIEW v_augmentation
;



SELECT * FROM information_schema.views
;




-- ================================================
-- ======  Exercice 1 vues base hotel     =========
-- ================================================

USE hotel;



-- 1. Afficher la liste des hôtels avec leur station

CREATE OR REPLACE VIEW v_cli_sta
AS
SELECT hot_nom, sta_nom
FROM station
JOIN hotel ON station.sta_id = hotel.hot_sta_id;

SELECT * FROM v_cli_sta;
DROP VIEW v_cli_sta;


-- 2. Afficher la liste des chambres et leur hôtel

CREATE VIEW IF NOT EXISTS v_cha_hot
AS
SELECT cha_numero, hot_nom
FROM hotel
JOIN chambre ON hotel.hot_id = chambre.cha_hot_id;

SELECT * FROM v_cha_hot;
DROP VIEW v_cha_hot;


-- 3. Afficher la liste des réservations avec le nom des clients

SELECT res_id, cli_nom, cli_prenom
FROM reservation
JOIN client ON reservation.res_cli_id = client.cli_id;


-- 4. Afficher la liste des chambres avec le nom de l’hôtel et le nom de la station

SELECT cha_numero, hot_nom, sta_nom
FROM chambre
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id;


-- 5. Afficher les réservations avec le nom du client et le nom de l’hôtel


SELECT res_id, cli_nom, cli_prenom, res_id
FROM reservation
JOIN client ON reservation.res_cli_id = client.cli_id;




-- =============================================
-- ======  Exercice 2 vues base papyrus   ======
-- =============================================

USE papyrus;


-- 1. v_GlobalCde correspondant à la requête : 
--    A partir de la table Ligcom, afficher par code produit,
--    la somme des quantités commandées et le prix total correspondant : on nommera la colonne correspondant 
--    à la somme des quantités commandées, QteTot et le prix total, 
--    PrixTot. 


CREATE VIEW IF NOT EXISTS v_GlobalCde
AS
(
SELECT codart, SUM(qtecde), SUM(qtecde * priuni)
FROM ligcom
GROUP BY codart
);

SELECT * FROM v_GlobalCde;
DROP VIEW v_GlobalCde;



-- 2. v_VentesI100 correspondant à la requête : 
--    Afficher les ventes dont le code produit est le I100 
--    (affichage de toutes les colonnes de la table Vente).

CREATE VIEW v_VentesI100
AS
SELECT * FROM vente
WHERE `codart` = 'I100';

SELECT * FROM v_VentesI100;
DROP VIEW v_VentesI100;





-- 3. A partir de la vue précédente, 
--    créez v_VentesI100Grobrigan remontant toutes 
--    les ventes concernant le produit I100 
--    et le fournisseur 00120. 

CREATE VIEW v_VentesI100Grobrigan
AS
SELECT * FROM v_VentesI100
WHERE numfou = 120;

SELECT * FROM v_VentesI100Grobrigan;
DROP VIEW v_VentesI100Grobrigan;



-- Listing des vues existantes

SELECT * FROM information_schema.views
-- WHERE SECURITY TYPE = DEFINER
;

