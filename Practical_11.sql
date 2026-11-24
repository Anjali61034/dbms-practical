-- Practical 11: Math Functions in MS-SQL

USE AdventureWorks2022;
GO

SELECT TOP 10 Name, StandardCost - ListPrice AS Diff, ABS(StandardCost -
ListPrice) AS AbsDiff FROM Production.Product WHERE ListPrice > 0;

SELECT TOP 10 Name, ListPrice, CEILING(ListPrice) AS CeilPrice FROM
Production.Product WHERE ListPrice > 0;

SELECT TOP 10 Name, ListPrice, FLOOR(ListPrice) AS FloorPrice FROM
Production.Product WHERE ListPrice > 0;

SELECT TOP 10 SalesOrderID, TotalDue, ROUND(TotalDue, 1) AS Rounded1,
ROUND(TotalDue, -1) AS RoundedTens FROM Sales.SalesOrderHeader;

SELECT POWER(2, 10) AS TwoPowerTen, POWER(5, 3) AS FiveCubed;

SELECT TOP 10 Name, ListPrice, SQRT(ListPrice) AS SqrtPrice FROM
Production.Product WHERE ListPrice > 0;

SELECT TOP 10 ProductID, OrderQty, SQUARE(OrderQty) AS QtySquared FROM
Sales.SalesOrderDetail;

SELECT TOP 10 Name, SalesYTD - SalesLastYear AS Growth, SIGN(SalesYTD -
SalesLastYear) AS GrowthSign FROM Sales.SalesTerritory;

SELECT PI() AS PiValue, ROUND(PI() * SQUARE(7), 2) AS CircleAreaRadius7;

SELECT TOP 10 Name, ListPrice, LOG(ListPrice) AS NaturalLog FROM
Production.Product WHERE ListPrice > 0;

SELECT TOP 10 Name, ListPrice, LOG10(ListPrice) AS Base10Log FROM
Production.Product WHERE ListPrice > 0;

SELECT EXP(1) AS EulerE, EXP(2) AS ESquared;

SELECT RAND() AS RandomFloat, FLOOR(RAND() * 100) + 1 AS Random1To100;

SELECT SIN(PI()/2) AS Sin90, COS(0) AS Cos0, TAN(PI()/4) AS Tan45;

SELECT DEGREES(PI()) AS PiInDegrees, RADIANS(180.0) AS Deg180InRadians;
GO
