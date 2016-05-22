USE AdventureWorks2014;

-- Chapter 3

/*
-- Literal Values
SELECT 1, 2
SELECT 'ABCV'

USE [AdventureWorks2014];
GO
SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee;

--SELECT *
--FROM HumanResources.Employee;

SELECT 'A Literal Value' AS 'Literal Value',
	BusinessEntityID AS EmployeeID,
	LoginID, JobTitle
FROM HumanResources.Employee;

*/

/*
-- WHERE clause
-- 1
SELECT CustomerID, SalesOrderID
FROM Sales.SalesOrderHeader
WHERE CustomerID = 11000;

--2
SELECT CustomerID, SalesOrderID
FROM Sales.SalesOrderHeader
WHERE SalesOrderID = 43793;

--3
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate = '2011/07/02';

--4
SELECT BusinessEntityID, LoginID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle = 'Chief Executive Officer';
*/

/*
--Using a DateTime column
--1
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate = '2012-07-05'

--12
SELECT BusinessEntityID, FirstName
FROM Person.Person 
WHERE FirstName !> 'M'
ORDER BY FirstName;
*/

/*
--BETWEEN
--1
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate BETWEEN '2012-07-05' AND '2012-7-8'

-- NOT BETWEEN
SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate NOT BETWEEN '2012-07-05' AND '2012-7-8'
*/


-- Listing 3-9 Table Setup for Date/Time Example
/*
CREATE TABLE #DateTimeExample(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	MyDate DATETIME2(0) NOT NULL,
	MyValue VARCHAR(25) NOT NULL
);
GO

INSERT INTO #DateTimeExample
	(MyDate, MyValue)
VALUES ('2009-01-02 10:30', 'Bike'),
	('2009-01-03 13:00', 'Trike'),
	('2009-01-03 13:01', 'Bell'),
	('2009-01-03 17:35', 'Seat');


--Listing 3-10 Filtering on Date and Time Columns
--1
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
--WHERE MyDate = '2009-01-03';

SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate BETWEEN '2009-01-03 00:00:00' AND '2009-01-03 23:59:59';
*/

/*
-- Listing 3-11 AND OR
--1
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName = 'Ken' AND LastName = 'Myer';

--2
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName = 'Ken' OR LastName = 'Myer';

--3
IF OBJECT_ID('tempdb..#DateTimeExample') IS NOT NULL BEGIN
	DROP TABLE #DateTimeExample;
END;
CREATE TABLE #DateTimeExample(
	ID INT NOT NULL IDENTITY PRIMARY KEY,
	MyDate DATETIME2(0) NOT NULL,
	MyValue VARCHAR(25) NOT NULL
);
GO
INSERT INTO #DateTimeExample
	(MyDate, MyValue)
VALUES ('2009-01-02 10:30', 'Bike'),
	('2009-01-03 13:00', 'Trike'),
	('2009-01-03 13:01', 'Bell'),
	('2009-01-03 17:35', 'Seat');

--4
SELECT ID, MyDate, MyValue
FROM #DateTimeExample
WHERE MyDate > '2009-01-02' AND MyDate < '2009-01-04'
*/

/*
-- Listing 3-12 IN
--1
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName = 'Ken' AND LastName IN ('Myer', 'Meyer'); 

--2
SELECT TerritoryID, Name
FROM Sales.SalesTerritory
WHERE TerritoryID IN (2,1,4,5)

--3
SELECT TerritoryID, Name
FROM Sales.SalesTerritory
WHERE TerritoryID NOT IN (2,1,4,5)
*/

/*
-- Listing 3-13. An Example Illustrating NULL
SELECT MiddleName
FROM Person.Person
WHERE MiddleName != 'B';

-- including NULL
SELECT MiddleName
FROM Person.Person
WHERE MiddleName != 'B'
	OR MiddleName IS NULL;
*/

/*
-- Listing 3-14 ORDER BY
SELECT ProductID, LocationID
FROM Production.ProductInventory
ORDER BY ProductID, LocationID DESC;

SELECT BusinessEntityID, 1 as X, LastName, FirstName, MiddleName
FROM Person.Person
ORDER BY LastName 
*/


-- Listing 3-15 View Executaion Plans
--1
SELECT LastName, FirstName
FROM Person.Person
WHERE LastName = 'Smith';

--2
SELECT LastName, FirstName
FROM Person.Person
WHERE FirstName = 'Ken';

--3
SELECT ModifiedDate
FROM Person.Person
WHERE ModifiedDate BETWEEN '2011-01-01' AND '2011-12-31';