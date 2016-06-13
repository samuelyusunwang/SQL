USE AdventureWorks2014;


--Listing 5.1 Join
SELECT s.SalesOrderID, s.OrderDate, s.TotalDue,
	d.ProductID, d.OrderQty
FROM Sales.SalesOrderHeader As s
INNER JOIN Sales.SalesOrderDetail As d
ON s.SalesOrderID = d.SalesOrderID