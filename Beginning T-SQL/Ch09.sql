USE AdventureWorks2014;
GO

-- Listing 9-1 LIKE
SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Sand%';

SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName NOT LIKE 'Sand%';

SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE '%Z%';

SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Bec_';

-- Listing 9-2 Use square brackets with LIKE
SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Cho[i-k]';

SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Cho[ijk]';

SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Cho[^iw]';

-- Lsiting 9-3. Combining Wildcards in One Pattern
SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Ber[rg]%';

SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Ber[^r]%';


SELECT DISTINCT LastName
FROM Person.Person
WHERE LastName LIKE 'Be%n_';


-- Listing 9-4 PATINDEX()
--1
SELECT LastName, PATINDEX('Ber[rg]%', LastName) AS Position
FROM Person.Person
WHERE PATINDEX('Ber[r,g]%', LastName) > 0;

--2
SELECT LastName, PATINDEX('%r%', LastName) AS Position
FROM Person.Person
WHERE PATINDEX('%r%', LastName) > 0;


-- Listing 9-5 WHERE Clauses with 3 Predicates
--1
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName = 'Ken' AND LastName = 'Myer' OR LastName = 'Meyer';

--2
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE LastName = 'Meyer' OR LastName = 'Myer' AND FirstName = 'Ken';

--3
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE LastName = 'Meyer' AND FirstName = 'Ken' OR LastName = 'Myer';

--4
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName = 'Ken' AND (LastName = 'Myer' OR LastName = 'Meyer');


-- Listing 9-6. Using NOT with Parentheses
--1
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName='Ken' AND LastName <> 'Myer' AND LastName <> 'Meyer'

-- 2
SELECT BusinessEntityID, FirstName, MiddleName, LastName
FROM Person.Person
WHERE FirstName='Ken' AND NOT (LastName = 'Myer' OR LastName = 'Meyer')