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




















