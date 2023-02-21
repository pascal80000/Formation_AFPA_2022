# 1- Liste des clients français :

SELECT CompanyName, Country
FROM customers
WHERE Country = 'France';
ORDER BY CompanyName ASC;




# 2- Liste des produits vendus par le fournisseur "Exotic Liquids" :

SELECT ProductName, products.SupplierID
FROM products
JOIN suppliers ON products.SupplierID = suppliers.SupplierID
WHERE suppliers.CompanyName LIKE 'Exotic Liquids';







# 3- Nombre de produits mis à disposition par les fournisseurs français 
#   (tri par nombre de produits décroissant) :

SELECT suppliers.CompanyName , COUNT(ProductName) AS "NP"
FROM suppliers
JOIN products ON suppliers.SupplierID = products.SupplierID
WHERE Country LIKE 'France'
GROUP BY CompanyName
ORDER BY NP DESC;







# 4- Liste des clients français ayant passé plus de 10 commandes :

SELECT customers.CompanyName, COUNT(orders.OrderID), ShipCountry 
FROM customers
JOIN orders ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON orders.OrderID = `order details`.OrderID
GROUP BY orders.OrderID
HAVING  orders.ShipCountry LIKE 'France' AND COUNT(orders.OrderID)>10;









# 5- Liste des clients dont le montant cumulé de toutes les commandes passées 
#   est supérieur à 30000 € :
#	NB: chiffre d affaires (CA) = total des ventes

SELECT orders.CustomerID, customers.CompanyName, orders.OrderID, SUM(ordet.UnitPrice * ordet.Quantity) AS 'somme'
FROM orders
JOIN customers ON orders.CustomerID = customers.CustomerID
JOIN `order details` ordet ON orders.OrderID = ordet.OrderID
GROUP BY CustomerID
HAVING  somme > 30000
ORDER BY somme;







# 6- Liste des pays dans lesquels des produits fournis par "Exotic Liquids" ont été livrés :

SELECT DISTINCT ShipCountry
FROM orders
JOIN `order details` odet ON orders.OrderID = odet.OrderID 
JOIN products ON odet.ProductID = products.ProductID 
JOIN suppliers ON products.SupplierID = suppliers.SupplierID 
WHERE suppliers.CompanyName = "Exotic Liquids"
ORDER BY ShipCountry ASC;






# 7- Chiffre d affaires global sur les ventes de 1997 :
#	NB: chiffre d affaires (CA) = total des ventes

SELECT SUM(UnitPrice * Quantity) AS 'CA global Année 1997'
FROM `order details` odet
JOIN orders ON odet.OrderID = orders. OrderID
WHERE OrderDate LIKE '1997%';







# 8- Chiffre d affaires détaillé par mois, sur les ventes de 1997 : 

SELECT MONTH(OrderDate) AS 'mois', SUM(UnitPrice * Quantity) AS 'CA mensuel'
FROM `order details` odet
JOIN orders ON odet.OrderID = orders. OrderID
WHERE OrderDate LIKE '1997%'
GROUP BY mois;







# 9- A quand remonte la dernière commande du client nommé "Du monde entier" ?

SELECT CompanyName AS 'Client', MAX(OrderDate) AS 'Dernière commande :'
FROM orders
JOIN customers ON orders.CustomerID = customers.CustomerID
WHERE CompanyName LIKE 'Du monde entier';








# 10- Quel est le délai moyen de livraison en jours ?

SELECT COUNT(OrderDate) AS 'Nb de commandes', AVG(DATEDIFF(ShippedDate, OrderDate)) AS 'Délai moyen de livraison (en jours)'
FROM orders








