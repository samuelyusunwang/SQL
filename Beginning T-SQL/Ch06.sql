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

