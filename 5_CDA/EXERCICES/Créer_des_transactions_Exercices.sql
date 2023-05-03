-- Active: 1679405822381@@127.0.0.1@3306@papyrus

START TRANSACTION;

SELECT nomfou FROM fournis WHERE numfou=120;

UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120 ;



COMMIT;

ROLLBACK;



LOCK TABLES fournis WRITE;

LOCK TABLES fournis READ;



UNLOCK TABLES;



-- Script complet d'une TRANSACTION

LOCK TABLES fournis WRITE;

START TRANSACTION;

    -- SELECT nomfou FROM fournis WHERE numfou=120;
    UPDATE fournis  SET nomfou= 'GROSBRIGAND' WHERE numfou=120 ;

    COMMIT;             -- validation de la TRANSACTION

--    ROLLBACK;        -- annulation de la transaction

UNLOCK TABLES;

