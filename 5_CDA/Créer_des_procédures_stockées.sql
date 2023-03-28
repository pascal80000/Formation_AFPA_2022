-- Active: 1679405822381@@127.0.0.1@3306@hotel
DELIMITER |

CREATE PROCEDURE listeClients()
BEGIN
    SELECT cli_id, cli_nom, cli_prenom, cli_ville FROM clients;
END |

DELIMITER ;


CALL listeClients();

--  =========  DANGER DE CHUTE !!!    ==============
-- DROP PROCEDURE listeClients;
-- =================================================
SHOW CREATE PROCEDURE listeClients;



DELIMITER |

CREATE PROCEDURE listeClientParVille(In ville Varchar(50))

BEGIN
   SELECT cli_id, cli_nom, cli_prenom, cli_ville 
   FROM clients
   WHERE cli_ville = ville;
END |

DELIMITER ;




CALL listeClientParVille('Londre');




--  =========  DANGER DE CHUTE !!!    ==============
DROP PROCEDURE listeClientParVille;
-- =================================================


SHOW PROCEDURE STATUS;




