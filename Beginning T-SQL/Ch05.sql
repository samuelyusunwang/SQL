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

/*
--Listing 5-5 join 3 tables
SELECT soh.SalesOrderID, soh.OrderDate, p.ProductID, p.Name
FROM Sales.SalesOrderHeader as soh
INNER JOIN Sales.SalesOrderDetail AS sod ON soh.SalesOrderID = sod.SalesOrderID
INNER JOIN Production.Product AS p ON sod.ProductID = p.ProductID
ORDER BY soh.SalesOrderID;
*/

/*
-- Listing 5-6 Left Outer Join
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate
FROM Sales.Customer AS c
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID
WHERE c.CustomerID IN (11028, 11029, 1, 2, 3, 4);

-- Listing 5-7 Right Outer Join
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate
FROM Sales.SalesOrderHeader AS s
RIGHT OUTER JOIN Sales.Customer AS c ON c.CustomerID = s.CustomerID
WHERE c.CustomerID IN (11028, 11029, 1, 2, 3, 4);

-- Listing 5-8 Find no match
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate
FROM Sales.Customer AS c
LEFT OUTER JOIN Sales.SalesOrderHeader AS s ON c.CustomerID = s.CustomerID
WHERE s.SalesOrderID IS NULL;

-- Listing 5-9 join 3 tables with LEFT OUTER JOIN
SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID, SOD.ProductID
FROM Sales.Customer as C
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID
WHERE C.CustomerID IN (11028, 11029, 1, 2, 3, 4)

-- Listing 5-10
SELECT C.CustomerID, SOH.SalesOrderID, SOD.SalesOrderDetailID, SOD.ProductID, T.Name
FROM Sales.Customer as C
LEFT OUTER JOIN Sales.SalesOrderHeader AS SOH ON C.CustomerID = SOH.CustomerID
LEFT OUTER JOIN Sales.SalesOrderDetail AS SOD ON SOH.SalesOrderID = SOD.SalesOrderID
LEFT OUTER JOIN Sales.SalesTerritory AS T ON C.TerritoryID = T.TerritoryID
WHERE C.CustomerID IN (11028, 11029, 1, 2, 3, 4)
*/

/*
-- Listing 5-11 Full Outer Join
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
-- Here is the query
SELECT c.Color AS "Color from list", p.Color, p.ProductID
FROM Production.Product as p
FULL OUTER JOIN Production.ProductColor AS c ON p.Color = c.Color
ORDER BY p.ProductID;
*/

/*
-- Listing 5-12 Cross Join
--1
SELECT p.ProductID, l.LocationID
FROM Production.Product as p
CROSS JOIN Production.Location AS l
ORDER BY ProductID;
--2
SELECT p.ProductID, l.LocationID
FROM Production.Product as p
CROSS JOIN Production.Location AS l
ORDER BY LocationID;
*/

/*
-- Listing 5-13 Self Join
IF OBJECT_ID('tempdb..#Employee') IS NOT NULL
DROP TABLE #Employee;

CREATE TABLE #Employee (
EmployeeID int,
MangerID int,
Title nvarchar(50));

INSERT INTO #Employee
Values (1, NULL, 'Chief Executive Officer');
INSERT INTO #Employee
Values (2, 1, 'Engineering Manager');
INSERT INTO #Employee
Values (3, 2, 'Senior Tool Designer');
INSERT INTO #Employee
Values (4, 2, 'Design Engineer');
INSERT INTO #Employee
Values (5, 2, 'Research and Development');
INSERT INTO #Employee
Values (6, 1, 'Marketing Manager');
INSERT INTO #Employee
Values (7, 2, 'Marketing Specialist');

SELECT a.EmployeeID AS Employee,
	a.Title AS EmployeeTitle,
	b.EmployeeID AS ManagerID,
	b.Title AS ManagerID
FROM #Employee AS a
LEFT OUTER JOIN #Employee AS b ON a.MangerID = b.EmployeeID;

DROP TABLE #Employee;
*/

/*
--Listing 5-14 Merge join
SELECT soh.SalesOrderID, sod.OrderQty, sod.ProductID
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail as sod
ON soh.SalesOrderID = sod.SalesOrderID;
*/

/*
--Listing 5-15 nested loop
SELECT soh.SalesOrderID, sod.OrderQty, sod.ProductID
FROM Sales.SalesOrderHeader AS soh
INNER JOIN Sales.SalesOrderDetail as sod
ON soh.SalesOrderID = sod.SalesOrderID
WHERE soh.CustomerID = 11000;
*/

--Listing 5-16 hash match
SELECT C.CustomerID, TotalDue
FROM Sales.Customer AS C
JOIN Sales.SalesOrderHeader as S
on C.CustomerID = s.CustomerID;














