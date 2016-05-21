-- Ex 3-1
/*
SELECT [CustomerID], [StoreID], [AccountNumber]
FROM Sales.Customer;

SELECT Name, ProductNumber, Color
FROM Production.Product;

SELECT CustomerID, SalesOrderID
FROM Sales.SalesOrderHeader;
*/

/*
-- Ex 3-2
SELECT BusinessEntityID, LoginID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle = 'Research and Development Engineer';

SELECT FirstName, LastName, MiddleName, BusinessEntityID
FROM Person.Person
WHERE MiddleName = 'J.';

SELECT ProductID, StartDate, EndDate, StandardCost, ModifiedDate
FROM Production.ProductCostHistory
WHERE StandardCost BETWEEN 10 and 13

SELECT BusinessEntityID, LoginID, JobTitle
FROM HumanResources.Employee
WHERE JobTitle <> 'Research and Development Engineer';
*/

-- Ex 3-3
USE AdventureWorks2014;

SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE MONTH(OrderDate) = 5 AND YEAR(OrderDate) = 2012

SELECT SalesOrderID, OrderDate, TotalDue
FROM Sales.SalesOrderHeader
WHERE TotalDue >= 10000 AND TotalDue < 43000

