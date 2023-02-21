# 6 Quelles sont les commandes passées en mars et en avril ?

SELECT entcom.numcom, entcom.datcom
FROM entcom
WHERE (MONTH(entcom.datcom) = 3 OR MONTH(entcom.datcom) = 4);
