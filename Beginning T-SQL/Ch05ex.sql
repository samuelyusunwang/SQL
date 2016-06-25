USE AdventureWorks2014;

/*
-- Ex 5-1
-- 1
SELECT e.JobTitle, e.BirthDate, p.FirstName, p.LastName
FROM HumanResources.Employee AS e
INNER JOIN Person.Person AS p ON e.BusinessEntityID = p.BusinessEntityID;

-- 2
SELECT c.CustomerID, c.StoreID, c.TerritoryID, p.FirstName, p.LastName
FROM Person.Person AS p
INNER JOIN Sales.Customer AS c ON p.BusinessEntityID = c.PersonID;

-- 3
SELECT c.CustomerID, c.StoreID, c.TerritoryID, 
	p.FirstName, p.LastName,
	soh.SalesOrderID
FROM Person.Person AS p
INNER JOIN Sales.Customer AS c ON p.BusinessEntityID = c.PersonID
INNER JOIN Sales.SalesOrderHeader AS soh ON c.CustomerID = soh.CustomerID;

-- 4
SELECT soh.SalesOrderID, sp.SalesQuota, sp.Bonus
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesPerson AS sp ON soh.SalesPersonID  = sp.BusinessEntityID;

-- 5
SELECT p.FirstName, p.LastName, soh.SalesOrderID, sp.SalesQuota, sp.Bonus
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesPerson AS sp ON soh.SalesPersonID  = sp.BusinessEntityID
INNER JOIN Person.Person AS p ON sp.BusinessEntityID = p.BusinessEntityID;

-- 6
SELECT p.Color, p.Size, pm.CatalogDescription
FROM Production.Product AS p
INNER JOIN Production.ProductModel AS pm ON p.ProductModelID = pm.ProductModelID;

-- 7
SELECT p.FirstName, p.LastName, pr.Name
FROM Person.Person AS p
INNER JOIN Sales.Customer AS c on p.BusinessEntityID = c.PersonID
INNER JOIN Sales.SalesOrderHeader as soh on c.CustomerID = soh.CustomerID
INNER JOIN Sales.SalesOrderDetail as sod on soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product as pr on sod.ProductID = pr.ProductID
*/


-- Ex 5-2
--1
SELECT p.ProductID, p.Name, sod.SalesOrderID
FROM Production.Product as p 
LEFT OUTER JOIN Sales.SalesOrderDetail AS sod
ON sod.ProductID = p.ProductID;

--2
SELECT p.ProductID, p.Name, sod.SalesOrderID
FROM Production.Product as p 
LEFT OUTER JOIN Sales.SalesOrderDetail AS sod
ON sod.ProductID = p.ProductID
WHERE sod.SalesOrderID IS NULL;

--3
SELECT sp.BusinessEntityID, sp.SalesYTD, soh.SalesOrderID
FROM Sales.SalesPerson AS sp
LEFT OUTER JOIN Sales.SalesOrderHeader as soh
ON sp.BusinessEntityID = soh.SalesPersonID;

--4
SELECT sp.BusinessEntityID, sp.SalesYTD, soh.SalesOrderID, p.FirstName + ' ' + p.LastName as Name
FROM Sales.SalesPerson AS sp
LEFT OUTER JOIN Sales.SalesOrderHeader as soh ON sp.BusinessEntityID = soh.SalesPersonID
LEFT OUTER JOIN Person.Person as p on sp.BusinessEntityID = p.BusinessEntityID;

--5
SELECT soh.SalesOrderID, cr.CurrencyRateID, cr.AverageRate, sm.ShipBase
FROM Sales.SalesOrderHeader as soh
LEFT OUTER JOIN Sales.CurrencyRate as cr ON soh.CurrencyRateID = cr.CurrencyRateID
LEFT OUTER JOIN Purchasing.ShipMethod as sm on soh.ShipMethodID = sm.ShipMethodID;

--6
SELECT sp.BusinessEntityID, p.ProductID
FROM Production.Product as p
LEFT OUTER JOIN Sales.SalesOrderDetail as sod ON p.ProductID = sod.ProductID
LEFT OUTER JOIN Sales.SalesOrderHeader as soh ON sod.SalesOrderID = soh.SalesOrderID
LEFT OUTER JOIN Sales.SalesPerson as sp ON soh.SalesPersonID = sp.BusinessEntityID;