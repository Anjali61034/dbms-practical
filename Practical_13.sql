-- Practical 13: SQL Subqueries in MS-SQL

USE AdventureWorks2022;
GO

SELECT Name, ListPrice
FROM Production.Product
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product WHERE
ListPrice > 0)
ORDER BY ListPrice DESC;

SELECT BusinessEntityID, JobTitle
FROM HumanResources.Employee
WHERE BusinessEntityID IN (
       SELECT edh.BusinessEntityID
       FROM HumanResources.EmployeeDepartmentHistory edh
       JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
       WHERE d.Name IN ('Engineering', 'Research and Development') AND edh.EndDate
IS NULL
);

SELECT SalesOrderID, OrderDate, CustomerID, TotalDue

FROM Sales.SalesOrderHeader
WHERE TotalDue = (SELECT MAX(TotalDue) FROM Sales.SalesOrderHeader);
GO
