USE AdventureWorks2014;

/*
--Listing 5.1 Join
SELECT s.SalesOrderID, s.OrderDate, s.TotalDue,
	d.ProductID, d.OrderQty
FROM Sales.SalesOrderHeader As s
INNER JOIN Sales.SalesOrderDetail As d
ON s.SalesOrderID = d.SalesOrderID

--Listing 5-3 Join with different column names
SELECT c.CustomerID, c.PersonID, p.BusinessEntityID, p.LastName
FROM Sales.Customer AS c
INNER JOIN Person.Person AS p
ON c.PersonID = p.BusinessEntityID;
*/

/*
-- Listing 5-4
SELECT sod.SalesOrderID, sod.SalesOrderDetailID,
	so.ProductID, so.SpecialOfferID, so.ModifiedDate
FROM Sales.SalesOrderDetail AS sod
INNER JOIN Sales.SpecialOfferProduct AS so
	ON so.ProductID = sod.ProductID AND
	so.SpecialOfferID = sod.SpecialOfferID
WHERE sod.SalesOrderID IN (51116, 51112);
*/


--Listing 5-5 join 3 tables
SELECT soh.SalesOrderID, soh.OrderDate, p.ProductID, p.Name
FROM Sales.SalesOrderHeader as soh
INNER JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p ON sod.ProductID = p.ProductID
ORDER BY soh.SalesOrderID;

