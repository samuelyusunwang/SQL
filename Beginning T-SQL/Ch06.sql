USE AdventureWorks2014;

/*
-- Listing 6-1 subquery in WHERE and IN
SELECT CustomerID, AccountNumber
FROM Sales.Customer
WHERE CustomerID IN (SELECT CustomerID FROM Sales.SalesOrderHeader);

-- Listing 6-2 subquery with NOT IN
SELECT CustomerID, AccountNumber
FROM Sales.Customer
WHERE CustomerID NOT IN
	(SELECT CustomerID FROM Sales.SalesOrderHeader);
*/

/*
-- Listing 6-3 subquery returns NULL value
--1
SELECT CurrencyRateID, FromCurrencyCode, ToCurrencyCode
FROM Sales.CurrencyRate
WHERE CurrencyRateID NOT IN 
	(SELECT CurrencyRateID
	 FROM Sales.SalesOrderHeader);
--2
SELECT CurrencyRateID, FromCurrencyCode, ToCurrencyCode
FROM Sales.CurrencyRate
WHERE CurrencyRateID NOT IN 
	(SELECT CurrencyRateID
	 FROM Sales.SalesOrderHeader
	 WHERE CurrencyRateID IS NOT NULL);
*/

/*
-- Listing 6-4 Using EXISTS subquery
--1
SELECT CustomerID, AccountNumber
FROM Sales.Customer
WHERE EXISTS
	(SELECT * FROM Sales.SalesOrderHeader AS SOH
	 WHERE SOH.CustomerID = Customer.CustomerID);
--2
SELECT CustomerID, AccountNumber
FROM Sales.Customer
WHERE NOT EXISTS
	(SELECT * FROM Sales.SalesOrderHeader AS SOH
	 WHERE SOH.CustomerID = Customer.CustomerID);
*/

/*
--Listing 6-5 CROSS APPLY and OUTER APPLY
--1
SELECT CustomerID, AccountNumber, SalesOrderID
FROM Sales.Customer AS Cust
CROSS APPLY(SELECT SalesOrderID
FROM Sales.SalesOrderHeader AS SOH
WHERE Cust.CustomerID = SOH.CustomerID) AS A;
--2
SELECT CustomerID, AccountNumber, SalesOrderID
FROM Sales.Customer AS Cust
OUTER APPLY(SELECT SalesOrderID
FROM Sales.SalesOrderHeader AS SOH
WHERE Cust.CustomerID = SOH.CustomerID) AS A;
*/

/*
-- Listing 6-6 Using UNION
--1 
SELECT BusinessEntityID AS ID
FROM HumanResources.Employee
UNION
SELECT BusinessEntityID
FROM Person.Person
UNION
SELECT SalesOrderID
FROM Sales.SalesOrderHeader
ORDER BY ID;
--2
SELECT BusinessEntityID AS ID
FROM HumanResources.Employee
UNION ALL
SELECT BusinessEntityID
FROM Person.Person
UNION ALL
SELECT SalesOrderID
FROM Sales.SalesOrderHeader
ORDER BY ID;
*/


-- Incompatible types
--SELECT 1
--UNION ALL
--SELECT 'a'

--SELECT 1
--UNION ALL
--SELECT 1, 2

/*
-- Listing 6-7 EXCEPT / INTERSECT
--1
SELECT BusinessEntityID AS ID
FROM HumanResources.Employee
EXCEPT
SELECT BusinessEntityID
FROM Person.Person;
--2
SELECT BusinessEntityID AS ID
FROM HumanResources.Employee
INTERSECT
SELECT BusinessEntityID
FROM Person.Person
*/

/*
-- Listing 6-8 Using a Derived Table
SELECT c.CustomerID, s.SalesOrderID
FROM Sales.Customer AS c
INNER JOIN 
(SELECT SalesOrderID, CustomerID
 FROM Sales.SalesOrderHeader) AS s 
ON c.CustomerID = s.CustomerID
*/

/*
-- Listing 6-9 Using CTE
--1
;WITH orders AS (
	SELECT SalesOrderID, CustomerID, TotalDue + Freight AS Total
	FROM Sales.SalesOrderHeader
	)
SELECT * FROM orders;
--2
;WITH orders ([Order ID], [Customer ID], Total)
AS (SELECT SalesOrderID, CustomerID, TotalDue + Freight
	FROM Sales.SalesOrderHeader
	)
SELECT * FROM orders;
*/

/*
-- Lisiting 6-10
--1
SELECT c.CustomerID, s.SalesOrderID, s.OrderDate
FROM Sales.Customer AS c
LEFT OUTER JOIN 
Sales.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID
WHERE s.OrderDate = '2011/07/01'
--2
;WITH orders AS (
	SELECT SalesOrderID, CustomerID, OrderDate
	FROM Sales.SalesOrderHeader
	WHERE OrderDate = '2011/07/01'
	)
SELECT c.CustomerID, orders.SalesOrderID, orders.OrderDate
FROM Sales.Customer AS c
LEFT OUTER JOIN orders ON c.CustomerID = orders.CustomerID
ORDER BY orders.OrderDate DESC;
*/


-- Listing 6-11














