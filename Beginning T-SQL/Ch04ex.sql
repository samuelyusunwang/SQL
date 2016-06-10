USE AdventureWorks2014;

/*
-- Exercise 4-1
--1
SELECT City + ' ' + CAST(PostalCode as varchar) AS AddressLine1
FROM Person.Address;

--2
SELECT ProductID, ISNULL(Color, 'No Color') AS Color1, COALESCE(Color, 'No Color') AS Color2, Name
FROM Production.Product;

--3
SELECT ProductID, Name + ': ' + ISNULL(Color, 'No Color') AS Description
FROM Production.Product;

--4
SELECT COALESCE(CAST(ProductID AS varchar) + ': ' + Name, 'No Data') AS Description
FROM Production.Product
*/

/*
-- Exercise 4-2
--1
SELECT MaxQty-MinQty AS DiffQty, SpecialOfferID, Description
FROM Sales.SpecialOffer

--2
SELECT MinQty * DiscountPct AS MinDiscount, SpecialOfferID, Description
FROM Sales.SpecialOffer

--3
SELECT ISNULL(MaxQty * DiscountPct, 10) AS MaxDiscount, SpecialOfferID, Description
FROM Sales.SpecialOffer
*/

/*
-- Exercise 4-3
--1
SELECT LEFT(AddressLine1, 10) AS AddressLine1First10
FROM Person.Address

--2
SELECT SUBSTRING(AddressLine1, 10, 6) AS AddressLine1First10
FROM Person.Address

--3
SELECT UPPER(FirstName) AS FIRST_NAME,
	UPPER(LastName) AS LAST_NAME
FROM Person.Person

--4
SELECT ProductNumber, 
	SUBSTRING(ProductNumber, CHARINDEX('-', ProductNumber)+1, 50) AS [AfterHyphen]
FROM Production.Product
*/


/*
-- Ex 4-4
--1
SELECT SalesOrderID, OrderDate, ShipDate,
	DATEDIFF(day, OrderDate, ShipDate)  AS DayDiff
FROM Sales.SalesOrderHeader

--2 
SELECT SalesOrderID, CONVERT(VARCHAR, OrderDate, 111) AS OrderDate, CONVERT(VARCHAR, ShipDate, 111) AS ShipDate,
	DATEDIFF(day, OrderDate, ShipDate)  AS DayDiff
FROM Sales.SalesOrderHeader

--3
SELECT SalesOrderID, OrderDate, ShipDate,
	DATEADD(month, 6, OrderDate)  AS OrderDatePlus6M
FROM Sales.SalesOrderHeader

--4
SELECT SalesOrderID, OrderDate, ShipDate,
	YEAR(OrderDate) AS OrderYear, MONTH(OrderDate) AS OrderMonth
FROM Sales.SalesOrderHeader

--4
SELECT SalesOrderID, OrderDate, ShipDate,
	YEAR(OrderDate) AS OrderYear, DATENAME(MONTH, OrderDate) As OrderMonth
FROM Sales.SalesOrderHeader
*/

/*
--Ex 4.5
--1
SELECT SalesOrderID, SubTotal, 
	ROUND(SubTotal,2) AS SubTotal1,
	CAST(ROUND(SubTotal,0) AS DECIMAL(10,1)) AS SubTotal2, 
	SQRT(SalesOrderID) AS SQRT_ID, 
	RAND()*9 + 1 AS Rand_1_10
FROM Sales.SalesOrderHeader
*/

/*
--Ex 4.6
SELECT BusinessEntityID,
	CASE WHEN BusinessEntityID % 2 = 1 THEN 'ODD'
		 WHEN BusinessEntityID % 2 = 0 THEN 'Even'
	END AS ID_Type
FROM HumanResources.Employee;

SELECT SalesOrderID, OrderQty,
	CASE WHEN OrderQty < 10 THEN 'Under 10'
		 WHEN OrderQty >=10 AND OrderQty < 20 THEN '10-19'
		 WHEN OrderQty >= 20 AND OrderQty < 30 THEN '20-29'
		 WHEN OrderQty >= 30 AND OrderQty < 40 THEN '30-39'
		 ELSE '40 and over'
	END AS OrderQty_Group
FROM Sales.SalesOrderDetail;

SELECT Title, FirstName, MiddleName, LastName, Suffix,
	COALESCE(Title + ' ', '') + COALESCE(FirstName + ' ', '') + COALESCE(MiddleName + ' ', '') 
	+ COALESCE(LastName + ' ', '') + COALESCE(Suffix, '') AS FullName
FROM Person.Person;

SELECT SERVERPROPERTY('Edition'), 
	SERVERPROPERTY('InstanceName'), 
	SERVERPROPERTY('MachineName');
*/

-- Ex 4.7
SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate) = 2011;

SELECT SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
ORDER BY MONTH(OrderDate), YEAR(OrderDate);

SELECT PersonType, FirstName, MiddleName, LastName
FROM Person.Person
ORDER BY PersonType, 
	CASE WHEN PersonType IN ('IN', 'SP', 'SC') THEN LastName
		 ELSE FirstName
	END
	
	