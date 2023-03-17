-- Active: 1678803646529@@127.0.0.1@3306@papyrus
CREATE VIEW v_affiche
AS
    SELECT prix1, prix2
    FROM vente;

CREATE VIEW v_hausse
AS  (
    UPDATE vente
    SET prix1 = prix1 * 1.04,
        prix2 = prix2 * 1.02
    WHERE numfou = 9180
);

SHOW CREATE VIEW v_affiche




