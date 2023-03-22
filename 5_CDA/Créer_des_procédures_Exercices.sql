
-- Active: 1679405822381@@127.0.0.1@3306@papyrus

-- =======================================================
-- ===========  EXERCICE 1   =============================
-- ===  création d'une procédure stockée sans paramètre ==
-- =======================================================

DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT numfou
    FROM entcom
    WHERE numfou != 0;
END |

DELIMITER ;
;



CALL Lst_fournis();

|
SHOW CREATE PROCEDURE Lst_fournis;


SHOW PROCEDURE STATUS Lst_fournis;


DROP PROCEDURE Lst_fournis;



-- =======================================================
-- ===========  EXERCICE 2   =============================
-- ===  création d'une procédure stockée        ==========
-- === avec un paramètre en entrée              ==========
-- =======================================================

DELIMITER \\

CREATE PROCEDURE Lst_commandes(IN obs VARCHAR(50) )
BEGIN
    SELECT DISTINCT produit.codart, libart, obscom
    FROM produit
    JOIN ligcom ON produit.codart = ligcom.codart
    JOIN entcom ON ligcom.numcom = entcom.numcom
    WHERE obscom LIKE obs
    ORDER BY codart;
END \\

DELIMITER ;

DECLARE obs VARCHAR;

SET @obs =  "%urgen%";

SHOW obs;



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
CREATE PROCEDURE CA_Fournisseur(
    IN numero INT,
    IN annee INT
)


SELECT numero INTO fournis.numfou, 



END $$
DELIMITER ;


CALL CA_Fournisseur(120, 1988);









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

CALL ajoutFournis(2222, 'TRUQUEUR','rue de l\'arnaque','60099','PAQUITO','tru fils','1');

SELECT *
FROM fournis;

-- WHERE numfou = 1144 OR numfou = 120;



