-- Practical 10: Date Functions in MS-SQL

USE AdventureWorks2022;
GO

SELECT GETDATE() AS CurrentDateTime;

SELECT SYSDATETIME() AS HighPrecisionDateTime;

SELECT GETUTCDATE() AS CurrentUTCDateTime;

SELECT TOP 10 SalesOrderID, OrderDate, YEAR(OrderDate) AS OrderYear FROM
Sales.SalesOrderHeader;

SELECT TOP 10 SalesOrderID, OrderDate, MONTH(OrderDate) AS OrderMonth FROM
Sales.SalesOrderHeader;

SELECT TOP 10 SalesOrderID, OrderDate, DAY(OrderDate) AS OrderDay FROM
Sales.SalesOrderHeader;

SELECT TOP 10 SalesOrderID, OrderDate, DATEPART(QUARTER, OrderDate) AS
OrderQuarter FROM Sales.SalesOrderHeader;

SELECT TOP 10 SalesOrderID, OrderDate, DATENAME(WEEKDAY, OrderDate) AS
OrderWeekday, DATENAME(MONTH, OrderDate) AS MonthName FROM
Sales.SalesOrderHeader;

SELECT TOP 10 SalesOrderID, OrderDate, DATEADD(DAY, 30, OrderDate) AS
PaymentDue30Days FROM Sales.SalesOrderHeader;

SELECT TOP 10 SalesOrderID, OrderDate, ShipDate, DATEDIFF(DAY, OrderDate,
ShipDate) AS DaysToShip FROM Sales.SalesOrderHeader;

SELECT TOP 10 SalesOrderID, OrderDate, EOMONTH(OrderDate) AS EndOfOrderMonth
FROM Sales.SalesOrderHeader;

SELECT DATEFROMPARTS(2026, 11, 25) AS PracticalExamDate;

SELECT TOP 10 SalesOrderID, FORMAT(OrderDate, 'dd-MMM-yyyy') AS FormattedDate
FROM Sales.SalesOrderHeader;

SELECT ISDATE('2026-11-25') AS ValidDateCheck, ISDATE('2026-13-40') AS
InvalidDateCheck;

SELECT TOP 10 BusinessEntityID, BirthDate, HireDate,
     DATEDIFF(YEAR, BirthDate, GETDATE()) AS ApproxAge,
     DATEDIFF(YEAR, HireDate, GETDATE()) AS YearsWithCompany
FROM HumanResources.Employee;
GO
