-- Practical 14: Correlated Subqueries in MS-SQL

USE AdventureWorks2022;
GO

SELECT p1.Name, p1.ProductSubcategoryID, p1.ListPrice
FROM Production.Product p1
WHERE p1.ProductSubcategoryID IS NOT NULL
  AND p1.ListPrice > (
        SELECT AVG(p2.ListPrice)
        FROM Production.Product p2
        WHERE p2.ProductSubcategoryID = p1.ProductSubcategoryID
  )
ORDER BY p1.ProductSubcategoryID, p1.ListPrice DESC;

SELECT TOP 20 c.CustomerID, c.AccountNumber
FROM Sales.Customer c
WHERE EXISTS (
      SELECT 1
      FROM Sales.SalesOrderHeader soh
      WHERE soh.CustomerID = c.CustomerID AND soh.TotalDue > 50000
);

SELECT p1.Name, p1.Color, p1.ListPrice
FROM Production.Product p1
WHERE p1.Color IS NOT NULL
  AND p1.ListPrice = (
        SELECT MAX(p2.ListPrice)
        FROM Production.Product p2
        WHERE p2.Color = p1.Color
  )
ORDER BY p1.ListPrice DESC;
GO
