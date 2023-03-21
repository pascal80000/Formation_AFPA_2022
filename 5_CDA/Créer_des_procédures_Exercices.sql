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
    WHERE numcom != 0;
END |

DELIMITER ;



CALL Lst_fournis();


SHOW CREATE PROCEDURE Lst_fournis;

SHOW PROCEDURE STATUS Lst_fournis;

DROP PROCEDURE Lst_fournis;



-- =======================================================
-- ===========  EXERCICE 2   =============================
-- ===  création d'une procédure stockée        ==========
-- === avec un paramètre en entrée              ==========
-- =======================================================

DELIMITER |

CREATE PROCEDURE Lst_commandes(In obscom VARCHAR(50))
BEGIN
    SELECT DISTINCT produit.codart, libart  /*, obscom*/
    FROM produit,ligcom,entcom
    WHERE obscom LIKE '%urgen%'
    ORDER BY codart;
END |

DELIMITER ;


CALL