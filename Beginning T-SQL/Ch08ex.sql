USE AdventureWorks2014;
GO

-- Ex 8-1
-- 1

SELECT TOP 10 *
FROM Production.ProductSubcategory

SELECT TOP 10 *
FROM Production.ProductCategory;

SELECT TOP 10 *
FROM Production.Product


SELECT ProductID, ROW_NUMBER() OVER(PARTITION BY ProductSubcategoryID ORDER BY ProductID) as RowNum,
	   ProductSubcategoryID, Name
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL;


-- 2
SELECT top 10 *
FROM Sales.SalesOrderDetail

SELECT top 10 *
FROM Sales.SalesOrderHeader

SELECT CustomerID,
	SUM(LineTotal) AS TotalSales, 
	NTILE(10) OVER(ORDER BY SUM(LineTotal)) AS SalesBucket
FROM Sales.SalesOrderHeader AS soh
LEFT JOIN Sales.SalesOrderDetail as sod ON soh.SalesOrderID = sod.SalesOrderID
WHERE YEAR(OrderDate) = 2011
GROUP BY CustomerID
ORDER BY TotalSales;


-- Ex 8-2
--1
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
	,AVG(TotalDue) OVER() AS AvgOrderTotal
FROM Sales.SalesOrderHeader
ORDER BY TotalDue;

--2
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
	,AVG(TotalDue) OVER(PARTITION BY CustomerID) AS AvgOrderTotal
FROM Sales.SalesOrderHeader
ORDER BY CustomerID, TotalDue;


-- Ex 8-3
SELECT ProductID, SalesOrderID, COUNT(*)
FROM Sales.SalesOrderDetail
GROUP BY ProductID, SalesOrderID
HAVING COUNT(*) > 1
ORDER BY ProductID, SalesOrderID;

SELECT ProductID, SalesOrderID, LineTotal,
	SUM(LineTotal) OVER(PARTITION BY ProductID ORDER BY SalesOrderID) AS CumSumLine
FROM Sales.SalesOrderDetail
ORDER BY ProductID, SalesOrderID;


-- Ex 8-4
CREATE TABLE #Stock (
	Symbol VARCHAR(4),
	TradingDate DATE,
	OpeningPrice MONEY,
	ClosingPrice MONEY);

INSERT INTO #Stock(Symbol, TradingDate, OpeningPrice, ClosingPrice)
VALUES ('A', '2014/01/02', 5.03, 4.90),
	('B','2014/01/02',10.99,11.25),
	('C','2014/01/02',23.42,23.44),
	('A','2014/01/03',4.93,5.10),
	('B','2014/01/03',11.25,11.25),
	('C','2014/01/03',25.15,25.06),
	('A','2014/01/06',5.15,5.20),
	('B','2014/01/06',11.30,11.12),
	('C','2014/01/06',25.20,26.00);

-- Check
SELECT *
FROM #Stock

-- 1. calculate difference in closing price
SELECT *, 
	LAG(ClosingPrice, 1) OVER(PARTITION BY Symbol ORDER BY TradingDate) AS PrevClose,
	ClosingPrice / LAG(ClosingPrice, 1) OVER(PARTITION BY Symbol ORDER BY TradingDate) - 1 AS Ret
FROM #Stock

SELECT *, 
	LAG(ClosingPrice, 1) OVER(PARTITION BY Symbol ORDER BY TradingDate) AS PrevClose,
	ClosingPrice / LAG(ClosingPrice, 1, ClosingPrice) OVER(PARTITION BY Symbol ORDER BY TradingDate) - 1 AS Ret
FROM #Stock

