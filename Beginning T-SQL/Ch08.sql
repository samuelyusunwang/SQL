-- Chapter 8
USE AdventureWorks2014;
GO

-- Listing 8-1. Using the ranking functions
--1
SELECT CustomerID,
	ROW_NUMBER() OVER(ORDER BY CustomerID) AS RowNum,
	RANK() OVER(ORDER BY CustomerID) AS RankNum,
	DENSE_RANK() OVER(ORDER BY CustomerID) AS DenseRankNum,
	ROW_NUMBER() OVER(ORDER BY CustomerID DESC) AS ReverseRank
FROM Sales.Customer
WHERE CustomerID BETWEEN 11000 AND 12000
ORDER BY CustomerID

--2 
SELECT SalesOrderID, CustomerID,
	ROW_NUMBER() OVER(ORDER BY CustomerID) AS RowNum,
	RANK() OVER(ORDER BY CustomerID) AS RankNum,
	DENSE_RANK() OVER(ORDER BY CustomerID) AS DenseRankNum
FROM Sales.SalesOrderHeader
WHERE CustomerID BETWEEN 11000 AND 12000
ORDER BY CustomerID;

-- Listing 8-2 PARTITION
SELECT SalesOrderID, OrderDate, CustomerID,
	ROW_NUMBER() OVER(PARTITION BY CustomerID ORDER BY OrderDate) AS RowNum
FROM Sales.SalesOrderHeader
ORDER BY CustomerID


-- Listing 8-3 Using the NTILE
SELECT SP.FirstName, SP.LastName,
	ROUND(SUM(SOH.TotalDue),1) AS TotalSales,
	NTILE(4) OVER(ORDER BY SUM(SOH.TotalDue)) AS Bucket
FROM Sales.vSalesPerson SP
JOIN Sales.SalesOrderHeader SOH ON SP.BusinessEntityID = SOH.SalesPersonID
WHERE SOH.OrderDate >= '2010-01-01' AND SOH.OrderDate < '2016-01-01'
GROUP BY FirstName, LastName
ORDER BY TotalSales;

--2
SELECT SP.FirstName, SP.LastName,
	ROUND(SUM(SOH.TotalDue),1) AS TotalSales,
	NTILE(4) OVER(ORDER BY SUM(SOH.TotalDue)) * 1000 AS Bonus
FROM Sales.vSalesPerson SP
JOIN Sales.SalesOrderHeader SOH ON SP.BusinessEntityID = SOH.SalesPersonID
WHERE SOH.OrderDate >= '2010-01-01' AND SOH.OrderDate < '2016-01-01'
GROUP BY FirstName, LastName
ORDER BY TotalSales;


-- Listing 8-4. Using Window Aggregates
--1
SELECT SalesOrderID, CustomerID,
	COUNT(*) OVER() AS CountOfSales,
	COUNT(*) OVER(PARTITION BY CustomerID) AS CountOfCustSales,
	SUM(TotalDue) OVER(PARTITION BY CustomerID) AS SumOfCustSales
FROM Sales.SalesOrderHeader
ORDER BY CustomerID;

--2
SELECT SalesOrderID, CustomerID,
	COUNT(*) OVER() AS CountOfSales,
	COUNT(*) OVER(PARTITION BY CustomerID) AS CountOfCustSales,
	SUM(TotalDue) OVER(PARTITION BY CustomerID) AS SumOfCustSales
FROM Sales.SalesOrderHeader
WHERE SalesORderId > 55000
ORDER BY CustomerID;


-- Listing 8-5 Running Totals
--1
SELECT SalesOrderID, CustomerID, TotalDue
	   ,SUM(TotalDue) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID) AS RunningTotal
FROM Sales.SalesOrderHeader
ORDER BY CustomerID, SalesOrderID;

--2
SELECT SalesOrderID, CustomerID, TotalDue
	   ,SUM(TotalDue) OVER(
						   PARTITION BY CustomerID 
						   ORDER BY SalesOrderID
						   ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
						   ) AS RunningTotal
FROM Sales.SalesOrderHeader
ORDER BY CustomerID, SalesOrderID;


-- Listing 8-6. Difference b/w ROWS and RANGE
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue,
	SUM(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ROWS_RT,
	SUM(TotalDue) OVER(PARTITION BY CustomerID ORDER BY OrderDate
		RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RANGE_RT
FROM Sales.SalesOrderHeader
WHERE CustomerID = 29837


-- Listing 8-7. Using LAG and LEAD
--1
SELECT SalesOrderID, OrderDate, CustomerID,
	LAG(OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID) AS PrevOrderDate,
	LEAD(OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID) AS FollowingOrderDate
FROM Sales.SalesOrderHeader

--2
SELECT SalesOrderID, OrderDate, CustomerID,
	DATEDIFF(d, LAG(OrderDate,1,OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID), OrderDate) 
		AS DaysSinceLastOrder
FROM Sales.SalesOrderHeader


-- Listing 8-8. Using FIRST_VALUE and LAST_VALUE
SELECT SalesOrderID, OrderDate, CustomerID,
	FIRST_VALUE(OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderId 
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS FirstOrderDate,
 	LAST_VALUE(OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderId 
		ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS LastOrderDate,
	LAST_VALUE(OrderDate) OVER(PARTITION BY CustomerID ORDER BY SalesOrderId)
		AS DefaultFrame
FROM Sales.SalesOrderHeader
ORDER BY CustomerID, SalesOrderID;


-- Listing 8-9 Using PERCENT_RANK and CUME_DIST
SELECT COUNT(*) NumberOfOrders, MONTH(OrderDate) AS OrderMonth,
	PERCENT_RANK() OVER(ORDER BY COUNT(*)) AS PercentRank,
	CUME_DIST() OVER(ORDER BY COUNT(*)) AS CumeDist
FROM Sales.SalesOrderHeader
GROUP BY Month(OrderDate)


-- Listing 8-10. Using PERCENTILE_COUNT and PERCENTILE_DISC
SELECT COUNT(*) NumberOfOrder, Month(OrderDate) AS OrderMonth,
	PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY COUNT(*)) OVER() AS PercentileCont,
	PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY COUNT(*)) OVER() AS PercentileDisc
FROM Sales.SalesOrderHeader
GROUP BY MONTH(OrderDate)


-- Listing 8-12 The Difference Between Using Window Aggregates and Traditional Techniques
-- 1
SET STATISTICS IO ON

SELECT CustomerID, SalesOrderID, TotalDue,
	SUM(TotalDue) OVER(PARTITION BY CustomerID) AS CustTotal
FROM Sales.SalesOrderHeader;

-- 2
;WITH Totals AS (
	SELECT CustomerID, SUM(TotalDue) AS CustTotal
	FROM Sales.SalesOrderHeader
	GROUP BY CustomerID)
SELECT Totals.CustomerID, SalesOrderID, TotalDue, CustTotal
FROM Sales.SalesOrderHeader AS SOH
INNER JOIN Totals ON SOH.CustomerID = Totals.CustomerID

SET STATISTICS IO OFF