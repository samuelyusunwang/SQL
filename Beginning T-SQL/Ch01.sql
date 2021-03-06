SELECT * FROM sys.databases;

--CREATE DATABASE AdventureWorks ON
--(FILENAME = 'C:\Users\ywang\Desktop\Download\AdventureWorks2012_Data.mdf')
--FOR ATTACH_REBUILD_LOG;

--USE [master]
--RESTORE DATABASE AdventureWorks
--FROM disk= 'C:\Users\ywang\Desktop\Download\AdventureWorks2014.bak'

--Readme for Adventure Works 2014 Sample Databases
--Use Script to create the database and update the data

USE [AdventureWorks2014]
GO

SELECT TOP 1000 [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [HumanResources].[Employee]

  SELECT * FROM HumanResources.Employee
  SELECT * FROM HumanResources.Department