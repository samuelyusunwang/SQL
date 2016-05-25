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


-- Listing 4-3 CONCAT
--1
--SELECT CONCAT ('I ', 'love', 'writing ', 'T-SQL');

SELECT @@VERSION