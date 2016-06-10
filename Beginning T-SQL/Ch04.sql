-- Ch04 Function/Expression
USE AdventureWorks2014;

/*
-- Listing 4-1. Concatenating string
--1
SELECT 'ab' + 'c';

--2
SELECT BusinessEntityID, FirstName + ' ' + LastName AS 'Full Name'
FROM Person.Person;
*/

/*
-- Listing 4-2 NULL
SELECT BusinessEntityID, FirstName + ' ' + MiddleName + ' ' + LastName AS 'Full Name'
FROM Person.Person;
*/


/*
-- Listing 4-3 CONCAT
-- Try them at home.
--1
SELECT CONCAT ('I ', 'love', 'writing ', 'T-SQL');

--2 Using variable with CONCAT
DECLARE @a VARCHAR(30) = 'My birthday is on'
DECLARE @b DATE = '1980/08/25'
SELECT CONCAT (@a, @b) AS RESULT;

--3 Using CONCAT with table rows
SELECT CONCAT (AddressLine1, PostalCode) AS Address
FROM Person.Address;

--4 Using CONCAT with NULL
SELECT CONCAT ('Using NULL in CONCAT, ', 'I see it vanishes. ', NULL)
*/

/*
--Listing 4-4. ISNULL and COALESCE
--1
SELECT BusinessEntityID, 
	   FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS 'Full Name'
FROM Person.Person;

--2
SELECT BusinessEntityID, 
	   FirstName + ISNULL(' ' + MiddleName, '') + ' ' + LastName AS 'Full Name'
FROM Person.Person;

--3 
SELECT BusinessEntityID, 
	   FirstName + COALESCE(' ' + MiddleName, '') + ' ' + LastName AS 'Full Name'
FROM Person.Person;
*/


--SELECT '1' + 1
--SELECT 1 + 'a'


/*
-- Listing 4-5. Using CAST and CONVERT
--1
SELECT CAST(BusinessEntityID as nvarchar) + ': ' + LastName + ', ' + FirstName AS ID_Name
FROM Person.Person;

--2
SELECT CONVERT(nvarchar(10), BusinessEntityID) + ': ' + LastName + ', ' + FirstName AS ID_Name
FROM Person.Person;

--3
SELECT BusinessEntityID, 
	BusinessEntityID + 1 AS "Adds 1",
	CAST(BusinessEntityID AS nvarchar(10)) + '1' AS "Appends 1"
FROM Person.Person;
*/

/*
-- Listing 4-6. Using Mathematical Operators
--1
SELECT 1 + 1 AS ADDITION,
	10.0 / 3 AS DIVISION,
	10 / 3 AS [Integer Division],
	10 % 3 AS MODULO;

--2
SELECT OrderQty, OrderQty * 10 AS Times10
FROM Sales.SalesOrderDetail;

--3
SELECT OrderQty * UnitPrice * (1.0 - UnitPriceDiscount) AS Calculated, 
	LineTotal
FROM Sales.SalesOrderDetail

--4
SELECT SpecialOfferID, MaxQty, DiscountPct,
	DiscountPct * ISNULL(MaxQty, 1000) AS MaxDiscount
FROM Sales.SpecialOffer
*/

/*
-- Listing 4-7. RTRIM(), LTRIM()
-- Create a temp table
CREATE TABLE #trimExample (COL1 VARCHAR(10));
GO
-- Populate the table
INSERT INTO #trimExample (COL1)
VALUES ('a'), ('b   '), ('   c'), ('  d    ');

-- 
SELECT COL1, '*' + RTRIM(COL1) + '*' AS "RTRIM", 
	'*' + LTRIM(COL1) + '*' AS 'LTRIM'
FROM #trimExample

-- Clean up
DROP TABLE #trimExample
*/

/*
-- Listing 4-8 LEFT(), RIGHT()
SELECT LastName, LEFT(LastName, 5) AS "LEFT",
	RIGHT(LastName, 5) AS "RIGHT"
FROM Person.Person
WHERE BusinessEntityID IN (293, 295, 211, 297, 299, 3057, 15027);
*/

/*
-- Listing 4-9. LEN(), DATALENGTH()
SELECT LastName, LEN(LastName) as "Length",
	DATALENGTH(LastName) as "Internal Data Length"
FROM Person.Person
WHERE BusinessEntityID in (293, 295, 211, 297, 299, 3057, 15027);
*/

/*
-- Listing 4-10. CHARINDEX()
SELECT LastName, CHARINDEX('e', LastName) AS "Find e",
	CHARINDEX('e', LastName, 4) AS "Skip 3 Characters",
	CHARINDEX('be',LastName) AS "Find be",
	CHARINDEX('Be', LastName) AS "Find Be"
FROM Person.Person
WHERE BusinessEntityID in (293, 295, 211, 297, 299, 3057, 15027);
*/

/*
-- Listing 4-11. SUBSTRING()
SELECT LastName, SUBSTRING(LastName, 1, 4) AS "First 4",
	SUBSTRING(LastName, 5, 50) AS [Characters 5 and later]
FROM Person.Person
WHERE BusinessEntityID in (293, 295, 211, 297, 299, 3057, 15027);

-- Listing 4-12 CHOOSE()
SELECT CHOOSE(4, 'a', 'b', 'c', 'd', 'e')
*/

/*
SELECT REVERSE('!dlroW, olleH')

SELECT LastName, UPPER(LastName) AS [Upper],
	LOWER(LastName) AS [Lower]
FROM Person.Person
WHERE BusinessEntityID in (293, 295, 211, 297, 299, 3057, 15027);
*/

/*
-- Listing 4-14 REPLACE()
--1
SELECT LastName, REPLACE(LastName, 'A', 'Z') AS [Replace A],
	REPLACE(LastName, 'A', 'ZZ') AS [Replace with 2 Characters],
	REPLACE(LastName, 'ab', '') AS [Remove String]
FROM Person.Person
WHERE BusinessEntityID in (293, 295, 211, 297, 299, 3057, 15027);

--2
SELECT BusinessEntityID, LastName, MiddleName,
	REPLACE(LastName, 'a', MiddleName) AS "Replace with MiddleName",
	REPLACE(LastName, MiddleName, 'a') as "Replace MiddleName"
FROM Person.Person
WHERE BusinessEntityID IN (285, 293, 10314);
*/

/*
-- Listing 4.15 Nesting Functions
--1 
SELECT EmailAddress,
	SUBSTRING(EmailAddress, CHARINDEX('@',EmailAddress)+1, 50) AS DOMAIN
FROM Production.ProductReview;

--2
SELECT physical_name,
	RIGHT(physical_name, CHARINDEX('\', REVERSE(physical_name))-1) AS FileName
FROM sys.database_files;
*/

/*
SELECT GETDATE(), SYSDATETIME();

-- Listing 4-16. Using the DATEADD function
--1
SELECT OrderDate, DATEADD(year, 1, OrderDate) AS OneMoreYear,
	DATEADD(month, 1, OrderDate) AS OneMoreMonth,
	DATEADD(day, -1, OrderDate) AS OneLessDay
FROM Sales.SalesOrderHeader
WHERE SalesOrderID in (43659, 43714, 60621);

--2
SELECT DATEADD(month, 1, '1/31/2009') AS FebDate;
*/

/*
-- Listing 4-17. DATEDIFF()
--1
SELECT OrderDate, GETDATE() CurrentDateTime,
	DATEDIFF(year, OrderDate, GETDATE()) AS YearDiff,
	DATEDIFF(month, OrderDate, GETDATE()) AS MonthDiff,
	DATEDIFF(day, OrderDate, GETDATE()) AS DayDiff
FROM Sales.SalesOrderHeader
WHERE SalesOrderID in (43659, 43714, 60621);

--2
SELECT DATEDIFF(year, '12/31/2008', '1/1/2009') AS YearDiff,
	DATEDIFF(month, '12/31/2008', '1/1/2009') AS MonthDiff,
	DATEDIFF(d, '12/31/2008', '1/1/2009') AS DayDiff;
*/

/*
-- Listing 4-18 DATEPART, DATENAME
--1
SELECT OrderDate, DATEPART(year, OrderDate) AS OrderYear,
	DATEPART(month, OrderDate) AS OrderMonth,
	DATEPART(day, OrderDate) AS OrderDay,
	DATEPART(weekday, OrderDate) AS OrderWeekday
FROM Sales.SalesOrderHeader
WHERE SalesOrderID in (43659, 43714, 60621);

--2
SELECT OrderDate, DATEPART(year, OrderDate) AS OrderYear,
	DATENAME(month, OrderDate) AS OrderMonth,
	DATENAME(day, OrderDate) AS OrderDay,
	DATENAME(weekday, OrderDate) AS OrderWeekday
FROM Sales.SalesOrderHeader
WHERE SalesOrderID in (43659, 43714, 60621);

-- Listing 4-19 YEAR, MONTH, DAY
SELECT OrderDate, YEAR(OrderDate) AS OrderYear,
	MONTH(OrderDate) AS OrderMonth,
	DAY(OrderDate) AS OrderDay
FROM Sales.SalesOrderHeader
WHERE SalesOrderID in (43659, 43714, 60621);
*/

/*
-- Listing 4-20. Using CONVERT 
--1 The hard way
SELECT CAST(DATEPART(YYYY, GETDATE()) AS VARCHAR) + '/' +
	CAST(DATEPART(MM, GETDATE()) AS VARCHAR) + '/' +
	CAST(DATEPART(DD, GETDATE()) AS VARCHAR) AS DateCast;

--2 Easy way
SELECT CONVERT(VARCHAR, GETDATE(), 111) AS DateConvert;

--3
SELECT CONVERT(VARCHAR, OrderDate, 1) AS "1",
	CONVERT(VARCHAR, OrderDate, 101) AS "101",
	CONVERT(VARCHAR, OrderDate, 2) AS "2",
	CONVERT(VARCHAR, OrderDate, 102) AS "102"
FROM Sales.SalesOrderHeader
WHERE SalesOrderID in (43659, 43714, 60621)
*/


/*
--Listing 4-21
DECLARE @d DATETIME = GETDATE();

SELECT FORMAT( @d, 'dd', 'en-US' ) AS Result;
SELECT FORMAT( @d, 'yyyy-M-d' ) AS Result;
SELECT FORMAT( @d, 'MM/dd/yyyy', 'en-US' ) AS Result;
*/

/*
SELECT EOMONTH(GETDATE()) AS [End of this month],
	EOMONTH(GETDATE(),1) AS [End of next month],
	EOMONTH('2009-01-01') AS [Another month];
*/

/*
--MATH
SELECT ABS(2) AS "2", ABS(-2) AS "-2"

--Listing 4-23 POWER()
SELECT POWER(10,1) AS "Ten to the First",
	POWER(10,2) AS "Ten to the Second",
	POWER(10,3) AS "Ten to the Third";

--Listing 4-24 SQUARE(), SQRT()
SELECT SQUARE(10) AS "Square of 10",
	SQRT(10) AS "Square root of 10",
	SQRT(SQUARE(10)) AS "The Square Root fo the Square of 10";

--Listing 4-25
SELECT ROUND(1234.1294, 2) AS "2 places on the right",
	ROUND(1254.1294, -2) AS "2 places on the left",
	ROUND(1234.1294, 2, 1) AS "Truncate 2",
	ROUND(1254.1294, -2, 1) AS "Truncate -2";	
*/

/*
--Listing 4-26
SELECT CAST(RAND() * 100 AS INT) + 1 AS "1 to 100",
	CAST(RAND() * 1000 AS INT) + 900 AS "900 to 1900",
	CAST(RAND() * 5 AS INT) + 1 AS "1 to 5";

SELECT RAND(3), RAND(), RAND();

SELECT RAND(), RAND(), RAND()
FROM sys.objects;
*/

/*
--Listing 4-27 CASE
SELECT BusinessEntityID, Title,
	CASE Title
		WHEN 'Mr.' Then 'Male'
		WHEN 'Ms.' THEN 'Female'
		WHEN 'Mrs.' THEN 'Female'
		WHEN 'Miss' THEN 'Female'
		ELSE 'Unknown'
	END AS Gender
FROM Person.Person
WHERE BusinessEntityID IN (1,5,6,357,358,11621,423)
*/

/*
-- Listing 4-28 CASE
SELECT BusinessEntityID, Title,
	CASE WHEN Title in ('Ms.', 'Mrs.', 'Miss') Then 'Female'
		 WHEN Title = 'Mr.' THEN 'Male'
		 ELSE 'Unknown'
	END AS Gender
FROM Person.Person
WHERE BusinessEntityID IN (1,5,6,357,358,11621,423);

-- Listing 4-29 CASE
SELECT VacationHours, SickLeaveHours,
	CASE WHEN VacationHours > SickLeaveHours THEN VacationHours
		ELSE SickLeaveHours
	END AS "More Hours"
FROM HumanResources.Employee;
*/

/*
--Listing 4-30 IIF
--1
SELECT IIF(50>20, "TRUE", "FALSE") AS RESULT;

DECLARE @a INT = 50
DECLARE @b INT = 25
SELECT IIF (@a > @b, "TRUE", "FALSE") AS RESULT;
*/

/*
-- Listing 4-31 COALESCE
SELECT ProductID, Size, Color,
	COALESCE(Size, Color, 'No Color or Size') AS 'Description'
FROM Production.Product
WHERE ProductID in (1,2, 317, 320, 680, 706);

-- Listing 4-32. Admin function
SELECT DB_NAME() AS "Database Name",
	HOST_NAME() AS "Host Name",
	CURRENT_USER AS "Current User",
	SUSER_NAME() AS "Login",
	USER_NAME() AS "User Name",
	APP_NAME() AS "App Name";
*/

/*
-- Listing 4-33
SELECT FirstName
FROM Person.Person
WHERE CHARINDEX('ke',FirstName) > 0;

SELECT LastName, REVERSE(LastName)
FROM Person.Person
ORDER BY REVERSE(LastName);

SELECT BirthDate
FROM HumanResources.Employee
ORDER BY YEAR(BirthDate)
*/

/*
--Listing 4-34
DECLARE @Rows INT = 2;
SELECT TOP(@Rows) PERCENT CustomerID, OrderDate, SalesOrderID
FROM Sales.SalesOrderHeader
ORDER BY SalesOrderID;

SELECT TOP(2) CustomerID, OrderDate, SalesOrderID
FROM Sales.SalesOrderHeader
ORDER BY OrderDate;

SELECT TOP(2) WITH TIES CustomerID, OrderDate, SalesOrderID
FROM Sales.SalesOrderHeader
ORDER BY OrderDate;

SELECT TOP(2) WITH TIES CustomerID, OrderDate, SalesOrderID
FROM Sales.SalesOrderHeader
ORDER BY NEWID();
*/

/*
-- Add an index
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = 
	OBJECT_ID(N'[Sales].[SalesOrderHeader]')
	AND name = N'DEMO_SalesOrderHeader_OrderDate')
DROP INDEX [DEMO_SalesOrderHeader_OrderDate]
	ON [Sales].[SalesOrderHeader] WITH (ONLINE = OFF);
GO

CREATE NONCLUSTERED INDEX [DEMO_SalesOrderHeader_OrderDate]
	ON [Sales].[SalesOrderHeader]
([OrderDate] ASC);
*/


--Remove Index
IF EXISTS (SELECT * FROM sys.indexes WHERE object_id = 
	OBJECT_ID(N'[Sales].[SalesOrderHeader]')
	AND name = N'DEMO_SalesOrderHeader_OrderDate')
DROP INDEX [DEMO_SalesOrderHeader_OrderDate]
	ON [Sales].[SalesOrderHeader] WITH (ONLINE=OFF);


-- Listing 4-35
--1 
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2011-01-01 00:00:00'
	AND OrderDate <= '2012-01-01 00:00:00';

--2 
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011;