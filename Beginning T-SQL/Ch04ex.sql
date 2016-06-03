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
	YEAR(OrderDate) AS OrderYear, MONTH( AS OrderMonth
FROM Sales.SalesOrderHeader



