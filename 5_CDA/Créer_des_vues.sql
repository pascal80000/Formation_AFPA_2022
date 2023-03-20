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



CREATE OR REPLACE VIEW  v_augmentation
AS  
    UPDATE papyrus.vente        -- !!!!  une VIEW ne peut contenir
    SET prix1 = prix1 * 1.04,   -- !!!!  ce type d'instructions !!!
        prix2 = prix2 * 1.02
        WHERE numfou = 9180
;


UPDATE vente
    SET prix1 = prix1 * 1.04,
        prix2 = prix2 * 1.02
        WHERE numfou = 9180;

SELECT prix1, prix2
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
-- ======  Exercice vues base hotel     ===========
-- ================================================

USE hotel;

GRANT ALL PRIVILEGES ON hotel.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;


-- 1. Afficher la liste des hôtels avec leur station




