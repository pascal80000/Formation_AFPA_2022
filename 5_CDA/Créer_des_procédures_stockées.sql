-- Active: 1679405822381@@127.0.0.1@3306@hotel


CREATE PROCEDURE listeClients()
BEGIN
    SELECT cli_id, cli_nom, cli_prenom, cli_ville FROM clients;
END;


CALL listeClients();

--  =========  DANGER DE CHUTE !!!    ==============
-- DROP PROCEDURE listeClients;
-- =================================================
SHOW CREATE PROCEDURE listeClients;





DROP PROCEDURE listeClientParVille;

CREATE PROCEDURE listeClientParVille (IN  ville VARCHAR(50))
BEGIN
SELECT cli_id, cli_nom, cli_prenom, cli_ville 
FROM clients
WHERE cli_ville = ville ;
END ;





CALL listeClientParVille('LA');



-- =========  DANGER DE CHUTE !!!    ==============

-- DROP PROCEDURE listeClientParVille;
-- =================================================


--  SHOW PROCEDURE STATUS;



   SELECT cli_id, cli_nom, cli_prenom, cli_ville 
   FROM clients
   WHERE clients.cli_ville='LA';



