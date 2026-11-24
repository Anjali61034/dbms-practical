-- Practical 12: Set Operations and Joins in MS-SQL

USE AdventureWorks2022;
GO

SELECT ProductID FROM Production.Product WHERE ListPrice > 3000
UNION
SELECT ProductID FROM Sales.SalesOrderDetail WHERE UnitPrice > 3000;

SELECT Color FROM Production.Product WHERE ListPrice > 2000 AND Color IS NOT
NULL
UNION ALL
SELECT Color FROM Production.Product WHERE ListPrice < 100 AND Color IS NOT
NULL;

SELECT ProductID FROM Production.Product
INTERSECT
SELECT ProductID FROM Sales.SalesOrderDetail;

SELECT ProductID FROM Production.Product
EXCEPT
SELECT ProductID FROM Sales.SalesOrderDetail;

SELECT TOP 15 p.Name AS ProductName, ps.Name AS SubcategoryName, p.ListPrice
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID =
ps.ProductSubcategoryID;

SELECT TOP 15 p.Name AS ProductName, ps.Name AS SubcategoryName
FROM Production.Product p
LEFT OUTER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID =
ps.ProductSubcategoryID;

SELECT TOP 15 p.Name AS ProductName, ps.Name AS SubcategoryName
FROM Production.Product p
RIGHT OUTER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID =
ps.ProductSubcategoryID;

SELECT sp.BusinessEntityID, st.Name AS TerritoryName, sp.SalesYTD
FROM Sales.SalesPerson sp
FULL OUTER JOIN Sales.SalesTerritory st ON sp.TerritoryID = st.TerritoryID;

SELECT TOP 20 d.Name AS DeptName, pc.Name AS CategoryName
FROM HumanResources.Department d
CROSS JOIN Production.ProductCategory pc;

SELECT TOP 15 e1.BusinessEntityID AS Emp1, e2.BusinessEntityID AS Emp2,
e1.HireDate
FROM HumanResources.Employee e1
INNER JOIN HumanResources.Employee e2 ON e1.HireDate = e2.HireDate AND
e1.BusinessEntityID < e2.BusinessEntityID;

SELECT TOP 15 p.Name AS ProductName, ps.Name AS Subcategory, pc.Name AS
Category
FROM Production.Product p
INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID =
ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON ps.ProductCategoryID =
pc.ProductCategoryID;

SELECT st.Name AS TerritoryName, COUNT(soh.SalesOrderID) AS Orders,
SUM(soh.TotalDue) AS Revenue
FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name ORDER BY Revenue DESC;

SELECT TOP 15 p.FirstName + ' ' + p.LastName AS EmployeeName, e.JobTitle,
d.Name AS DeptName
FROM HumanResources.Employee e
INNER JOIN Person.Person p ON e.BusinessEntityID = p.BusinessEntityID
INNER JOIN HumanResources.EmployeeDepartmentHistory edh ON e.BusinessEntityID =
edh.BusinessEntityID
INNER JOIN HumanResources.Department d ON edh.DepartmentID = d.DepartmentID
WHERE edh.EndDate IS NULL;

SELECT TOP 15 c.CustomerID, c.AccountNumber
FROM Sales.Customer c
LEFT JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
WHERE soh.SalesOrderID IS NULL;

SELECT pc.Name AS Category, SUM(sod.LineTotal) AS TotalRevenue
FROM Sales.SalesOrderDetail sod

INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID =
ps.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON ps.ProductCategoryID =
pc.ProductCategoryID
GROUP BY pc.Name HAVING SUM(sod.LineTotal) > 1000000 ORDER BY TotalRevenue
DESC;
GO
