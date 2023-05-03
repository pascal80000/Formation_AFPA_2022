-- Active: 1679405822381@@127.0.0.1@3306@northwind
-- Eval   PERSISTANCE DES DONNEES
-- ==============================

--  =======================================================================================
--  ==========   1) Requêtes d'interrogation sur la base NorthWind        =================
--  =======================================================================================



--  1 - Liste des contacts français :

SELECT `SupplierID`, `CompanyName`, `ContactName`, `ContactTitle`, `Phone`
FROM suppliers
WHERE Country = "France";




--  2 - Produits vendus par le fournisseur « Exotic Liquids » :

SELECT ProductID, ProductName, UnitPrice
FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE CompanyName = "Exotic Liquids";




--  3 - Nombre de produits vendus par les fournisseurs Français dans l’ordre décroissant :

SELECT CompanyName, COUNT(productID) somme
FROM suppliers
JOIN products ON suppliers.SupplierID = products.SupplierID

WHERE Country = "France"
GROUP BY CompanyName
ORDER BY somme DESC;




--  4 - Liste des clients Français ayant plus de 10 commandes :

SELECT customers.CustomerID, CompanyName, Country, (COUNT (OrderID))
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
GROUP BY CompanyName
HAVING  customers.Country = "France" AND (COUNT (OrderID)) >10;




--  5 - Liste des clients ayant un chiffre d’affaires > 30.000 :

SELECT customers.CompanyName, SUM(UnitPrice*Quantity) AS ca, Country
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN order_details ON orders.`OrderID`= order_details.`OrderID`
GROUP BY `CompanyName`
HAVING ca > 30000
ORDER BY ca ASC, Country ASC;




--  6 – Liste des pays dont les clients ont passé commande de 
--      produits fournis par « Exotic Liquids » :

SELECT DISTINCT customers.Country, suppliers.CompanyName
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN order_details ON orders.OrderID = order_details.OrderID
JOIN products ON order_details.ProductID = products.ProductID
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.CompanyName = "Exotic Liquids";




--  7 – Montant des ventes de 1997 :

SELECT SUM(UnitPrice*Quantity)
FROM order_details d
JOIN orders o ON d.`OrderID` = o.`OrderID`
WHERE LEFT(`OrderDate`,4) = 1997;




--  8 – Montant des ventes de 1997 mois par mois :

SELECT SUM(UnitPrice*Quantity)
FROM order_details d
JOIN orders o ON d.`OrderID` = o.`OrderID`
WHERE LEFT(`OrderDate`,4) = 1997
GROUP BY DATE_FORMAT(`OrderDate`, %m);






--  9 – Depuis quelle date le client « Du monde entier » n’a plus commandé ?

SELECT CompanyName, MAX(OrderDate)
    FROM orders
    JOIN customers ON orders.`CustomerID` = customers.`CustomerID`
    WHERE CompanyName = "Du monde entier";




--  10 – Quel est le délai moyen de livraison en jours ?

SELECT AVG(DATEDIFF(ShippedDate,OrderDate))
    FROM orders;





--  =======================================================================================
--  ==========   2) Procédures stockées              ======================================
--  =======================================================================================


--  Codez deux procédures stockées correspondant aux requêtes 9 et 10. 
--  Les procédures stockées doivent prendre en compte les éventuels paramètres.

-- sur la requête 9 :

DELIMITER |
    CREATE PROCEDURE derniereCommande(IN company VARCHAR(50))
        BEGIN
            SELECT CompanyName, MAX(OrderDate)
            FROM orders
            JOIN customers ON orders.`CustomerID` = customers.`CustomerID`
            WHERE CompanyName = company;
        END |
DELIMITER ;


CALL derniereCommande("Du monde entier");




-- sur la requête 10 :

DELIMITER |
    CREATE PROCEDURE delai (IN date1 VARCHAR(20),date2 VARCHAR(20))
        BEGIN
            SELECT AVG(DATEDIFF(date1, date2))
            FROM orders;
        END |
DELIMITER ;





--  ====================================================================================
--  ==========   3) Règle de gestion              ======================================
--  ====================================================================================

DELIMITER |
CREATE TRIGGER controle_pays_commande BEFORE INSERT ON order_details
    FOR EACH ROW
    BEGIN
        DECLARE paysLivraison VARCHAR(15);
        DECLARE paysFournisseur VARCHAR(15);
        DECLARE numCommande INT(11);
        DECLARE numProduit INT(11);

        SET numCommande = NEW.OrderID;
        SET numProduit = NEW.ProductID;

        SET paysFournisseur = 
        (
            SELECT Country
            FROM suppliers s
            JOIN products p ON s.SupplierID = p.SupplierID
            WHERE ProductID= numProduit
        );

        SET paysLivraison = 
        (
            SELECT DISTINCT ShipCountry     --  bien mettre le 'DISTINCT' sinon erreur 'Subquery returns more than 1 row '
            FROM customers c
            JOIN orders o ON c.CustomerID = o.CustomerID
            JOIN order_details d ON o.OrderID = d.OrderID
            WHERE o.OrderID = numCommande
        );



        IF paysLivraison != paysFournisseur
            THEN SIGNAL SQLSTATE '40000' SET MESSAGE_TEXT = 'Livraison impossible';
        END IF;
    END;

DELIMITER ;



DROP TRIGGER controle_pays_commande;



--  =============  Test ajout produit refusé  ==========================

INSERT INTO `order_details` (`OrderID`, `ProductID`, `UnitPrice`, `Quantity`, `Discount`) 
            VALUES (10248, 30, 34, 5,0);



--  ================ Test ajout de produit OK  =========================

INSERT INTO `order_details` (`OrderID`, `ProductID`, `UnitPrice`, `Quantity`, `Discount`) 
            VALUES (10248, 39, 34, 5,0);



--  =============  Suppression de la ligne ajoutée avec le prod. 39  ===

DELETE FROM `order_details`
WHERE `ProductID`=39 AND `OrderID`=10248;

