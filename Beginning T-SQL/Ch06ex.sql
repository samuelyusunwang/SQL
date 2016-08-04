USE AdventureWorks2014;

/*
-- Ex 6-1
--1
SELECT ProductID, Name 
FROM Production.Product
WHERE ProductID IN (
	SELECT ProductID
	FROM Sales.SalesOrderDetail);

--2
SELECT ProductID, Name 
FROM Production.Product
WHERE ProductID NOT IN (
	SELECT ProductID
	FROM Sales.SalesOrderDetail);

--3
IF OBJECT_ID('Production.ProductColor') IS NOT NULL BEGIN
	DROP TABLE Production.ProductColor;
END
CREATE table Production.ProductColor
	(Color nvarchar(15) NOT NULL PRIMARY KEY);
GO
--Insert most of the existing colors
INSERT INTO Production.ProductColor
SELECT DISTINCT Color 
FROM Production.Product
WHERE Color IS NOT NULL and Color <> 'Silver';
--Insert some additional colors
INSERT INTO Production.ProductColor
VALUES ('Green'), ('Orange'), ('Purple');
--subquery
SELECT *
FROM Production.ProductColor as pc
WHERE NOT EXISTS
	(SELECT * FROM Production.Product as p
	 WHERE pc.Color = p.Color);

--4
SELECT DISTINCT p.Color
FROM Production.Product as p
WHERE NOT EXISTS
	(SELECT * FROM Production.ProductColor as pc
	 WHERE pc.Color = p.Color
		AND p.Color IS NOT NULL);

--5
SELECT ModifiedDate
FROM Person.Person
UNION
SELECT HireDate
FROM HumanResources.Employee

DROP TABLE Production.ProductColor;
*/


-- Ex 6-2
--1
SELECT soh.SalesOrderID, soh.OrderDate, sod.ProductID
FROM Sales.SalesOrderHeader AS soh
INNER JOIN 
	(SELECT SalesOrderID, ProductID
	 FROM Sales.SalesOrderDetail) AS sod
ON soh.SalesOrderID = sod.SalesOrderID;

--2
;WITH sod AS (
	SELECT SalesOrderID, ProductID
	FROM Sales.SalesOrderDetail)
SELECT soh.SalesOrderID, soh.OrderDate, sod.ProductID
FROM Sales.SalesOrderHeader AS soh
INNER JOIN sod
ON soh.SalesOrderID = sod.SalesOrderID;

--3
;WITH soh AS (
	SELECT SalesOrderID, OrderDate, CustomerID
	FROM Sales.SalesOrderHeader
	WHERE YEAR(OrderDate) = 2011)
SELECT c.CustomerID, soh.SalesOrderID, soh.OrderDate
FROM Sales.Customer AS c
LEFT JOIN soh
ON c.CustomerID = soh.CustomerID
ORDER BY OrderDate DESC;