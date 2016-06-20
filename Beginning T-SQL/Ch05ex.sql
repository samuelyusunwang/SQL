USE AdventureWorks2014;

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



