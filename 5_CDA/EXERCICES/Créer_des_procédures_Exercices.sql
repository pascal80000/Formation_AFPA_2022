
-- Active: 1679405822381@@127.0.0.1@3306

-- =======================================================
-- ===========  EXERCICE 1   =============================
-- ===  création d'une procédure stockée sans paramètre ==
-- =======================================================


CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT DISTINCT numfou
    FROM entcom
    WHERE numfou != 0;
END;






CALL Lst_fournis();


SHOW CREATE PROCEDURE Lst_fournis;


DROP PROCEDURE Lst_fournis;



-- =======================================================
-- ===========  EXERCICE 2   =============================
-- ===  création d'une procédure stockée        ==========
-- === avec un paramètre en entrée              ==========
-- =======================================================


CREATE PROCEDURE Lst_commandes(IN obs VARCHAR(50) )
BEGIN
    SELECT DISTINCT produit.codart, libart, obscom
    FROM produit
    JOIN ligcom ON produit.codart = ligcom.codart
    JOIN entcom ON ligcom.numcom = entcom.numcom
    WHERE obscom LIKE obs;
    
END;








CALL Lst_commandes(%urgen%);

DROP PROCEDURE Lst_commandes;



/*
SELECT DISTINCT produit.codart, libart, obscom
    FROM produit
    JOIN ligcom ON produit.codart = ligcom.codart
    JOIN entcom ON ligcom.numcom = entcom.numcom
    WHERE obscom LIKE '%urgen%'
ORDER BY codart;
*/




-- =======================================================
-- ===========  EXERCICE 3   =============================
-- ===  création d'une procédure stockée        ==========
-- === avec plusieurs paramètres                ==========
-- =======================================================


DELIMITER $$
CREATE PROCEDURE CA_Fournisseur(IN numero INT, annee INT)
BEGIN
    SELECT numero INTO numfou, nomfou, SUM(priuni*qteliv)
    FROM entcom
    JOIN ligcom ON entcom.numcom = ligcom.numcom
    JOIN fournis ON ligcom.numcom = fournis.numfou
END $$

DELIMITER ;


CALL CA_Fournisseur(120, 1988);


DROP PROCEDURE CA_Fournisseur








-- =============================================
-- ============ TESTS BETA  ====================
-- ============ ajout de fournisseur  ==========

DELIMITER |

CREATE PROCEDURE ajoutFournis(
    IN numero INT,
    IN nom VARCHAR(25),
    IN rue VARCHAR(50),
    IN postal CHAR(5),
    IN ville VARCHAR(30),
    IN contact VARCHAR(15),
    IN satisf TINYINT(4)
)

BEGIN
   INSERT INTO fournis (numfou,nomfou, ruefou, posfou, vilfou, confou, satisf) 
    VALUES (numero, nom, rue, postal, ville, contact, satisf);
END |

DELIMITER ;

CALL ajoutFournis(2228, 'TROCQUEUR','allée de l\'art','80019','PAQARITO','tru fils','3');

SELECT *
FROM fournis;

-- WHERE numfou = 1144 OR numfou = 120;



