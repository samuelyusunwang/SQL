USE AdventureWorks2014;
GO

-- EX 7-1
-- Ex 1.
SELECT top 100 *
FROM Sales.SalesOrderDetail;

SELECT COUNT(DISTINCT CustomerID) AS CountOfCustomers
FROM Sales.Customer;

-- Ex 2.
SELECT COUNT(*) AS TotalNumOfProducts
FROM Sales.SalesOrderDetail

-- Ex 3.
SELECT MAX(UnitPrice) AS MaxPrice
FROM Sales.SalesOrderDetail

-- Ex 4.
SELECT AVG(Freight) AS AvgFreight
FROM Sales.SalesOrderHeader;

-- Ex 5.
SELECT MIN(ListPrice) AS MinPrice, 
	   MAX(ListPrice) AS MaxPrice,
	   AVG(ListPrice) AS AvgPrice
FROM Production.Product


-- EX 7-2
-- 1.
SELECT SUM(OrderQty) AS TotalNumOfItems,
	   ProductID
FROM Sales.SalesOrderDetail
GROUP BY ProductID;

-- 2.
SELECT COUNT(SalesOrderDetailID) AS NumOfDetailLines,
	   SalesOrderID
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID;

-- 3
SELECT TOP 10 *
FROM Production.Product

SELECT COUNT(ProductID) AS NumOfProducts,
	   ProductLine
FROM Production.Product
GROUP BY ProductLine

-- 4
SELECT top 10 *
FROM Sales.SalesOrderHeader;

SELECT COUNT(SalesOrderID) AS NumOfOrders,
	   YEAR(OrderDate) AS OrderYear,
	   CustomerID
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), CustomerID
ORDER BY CustomerID, YEAR(OrderDate)


-- Ex 7.3
--1
SELECT Top 10 *
FROM Sales.SalesOrderDetail

SELECT SalesOrderID, COUNT(SalesOrderDetailID) AS NumOfDetailLines
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING COUNT(SalesOrderDetailID) > 3
ORDER BY SalesOrderID

-- 2
SELECT SalesOrderID, SUM(LineTotal) AS SumLineTotal
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID
HAVING SUM(LineTotal) > 1000
ORDER BY SumLineTotal

--3, 4
SELECT TOP 10 *
FROM Production.Product
WHERE Color in ('Blue', 'Red')

SELECT ProductModelID, COUNT(ProductID) AS NumOfProducts
FROM Production.Product
WHERE Color in ('Blue', 'Red')
GROUP BY ProductModelID
HAVING COUNT(ProductID) = 1
ORDER BY ProductModelID;


-- Ex 7.4
-- 1 
SELECT COUNT(DISTINCT ProductID) AS CountOfUniqueProductID
FROM Sales.SalesOrderDetail;

-- 2
SELECT CustomerID, COUNT(DISTINCT TerritoryID) AS NumOfUniqueTerritory
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
ORDER BY NumOfUniqueTerritory;


-- Ex 7.5
-- 1
SELECT p.FirstName, p.MiddleName, p.LastName, MAX(c.CustomerID) AS CustomerID, COUNT(DISTINCT SalesOrderID) AS NumOfOrders
FROM Person.Person as p
LEFT JOIN Sales.Customer as c ON p.BusinessEntityID = c.CustomerID
LEFT JOIN Sales.SalesOrderHeader as s ON p.BusinessEntityID = s.CustomerID
GROUP BY p.FirstName, p.MiddleName, p.LastName

-- 2
SELECT h.OrderDate, p.Name, SUM(d.OrderQty) AS SumQty 
FROM Sales.SalesOrderHeader as h
LEFT JOIN Sales.SalesOrderDetail as d ON h.SalesOrderID = d.SalesOrderID
LEFT JOIN Production.Product as p ON d.ProductID = p.ProductID
GROUP BY h.OrderDate, p.Name
ORDER BY h.OrderDate, p.Name