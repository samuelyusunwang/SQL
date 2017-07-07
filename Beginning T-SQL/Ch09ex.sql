USE AdventureWorks2014;
GO

-- Ex 9-1

-- 1.
SELECT ProductID, Name
FROM Production.Product
WHERE Name LIKE 'Chain%'

-- 2.
SELECT ProductID, Name
FROM Production.Product
WHERE Name LIKE '%Paint%'

-- 3.
SELECT ProductID, Name
FROM Production.Product
WHERE Name NOT LIKE '%Paint%'

-- 4.
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE MiddleName LIKE '%[EB]%'

-- 5.
SELECT FirstName, LastName
FROM Person.Person
WHERE LastName LIKE 'Ja%es';

SELECT FirstName, LastName
FROM Person.Person
WHERE LastName LIKE 'Ja_es';


-- Ex 9-2
SELECT TOP 10 *
FROM Sales.SalesOrderDetail