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
JOIN `order details` ON orders.`OrderID`= `order details`.`OrderID`
GROUP BY `CompanyName`
HAVING ca > 30000
ORDER BY ca ASC, Country ASC;







--  6 – Liste des pays dont les clients ont passé commande de 
--      produits fournis par « Exotic Liquids » :
SELECT customers.Country, suppliers.CompanyName
FROM customers
JOIN orders ON customers.CustomerID = orders.CustomerID
JOIN `order details` ON orders.OrderID = `order details`.OrderID
JOIN products ON `order detail`.ProductID = products.ProductID
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE CompanyName = "Exotic Liquids";





--  7 – Montant des ventes de 1997 :





--  8 – Montant des ventes de 1997 mois par mois :





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

--  fonctionne sur phpmyadmin
--  CALL derniereCommande(`Du monde entier`);




-- sur la requête 10 :

DELIMITER |

    CREATE PROCEDURE delai (IN date1,
                        IN  date2)

        BEGIN
            SELECT AVG(DATEDIFF(date2, date2))
            FROM orders;
        END |

DELIMITER ;
