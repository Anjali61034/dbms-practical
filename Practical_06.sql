-- Practical 6: DML Commands (SELECT, CASE, DISTINCT, WHERE, ORDER BY)

USE AdventureWorks2022;
GO

SELECT * FROM HumanResources.Department;

SELECT ProductID, Name, ListPrice FROM Production.Product;

SELECT 'Product: ' + Name AS ProductLabel, ListPrice FROM Production.Product;

SELECT DISTINCT Color FROM Production.Product;

SELECT Name, ListPrice FROM Production.Product WHERE ListPrice > 1000;

SELECT BusinessEntityID, JobTitle, HireDate FROM HumanResources.Employee ORDER
BY HireDate ASC;

SELECT BusinessEntityID, JobTitle, Gender FROM HumanResources.Employee WHERE
Gender = 'F';

SELECT DISTINCT JobTitle FROM HumanResources.Employee;

SELECT Name, ListPrice, ListPrice * 1.18 AS PriceWithGST FROM
Production.Product WHERE ListPrice > 0;

SELECT Name, Color, ListPrice FROM Production.Product ORDER BY ListPrice DESC;

SELECT Name, ListPrice,
    CASE
        WHEN ListPrice = 0 THEN 'Not For Sale'
        WHEN ListPrice < 500 THEN 'Budget'
        WHEN ListPrice < 1500 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS PriceTier
FROM Production.Product ORDER BY ListPrice DESC;

SELECT BusinessEntityID, JobTitle,
    CASE MaritalStatus WHEN 'M' THEN 'Married' ELSE 'Single' END AS
MaritalDesc,
    CASE Gender WHEN 'M' THEN 'Male' ELSE 'Female' END AS GenderDesc
FROM HumanResources.Employee ORDER BY BusinessEntityID;

SELECT DISTINCT Color, Size FROM Production.Product WHERE Color IS NOT NULL AND
Size IS NOT NULL ORDER BY Color, Size;

SELECT Name, StandardCost, ListPrice, (ListPrice - StandardCost) AS
ProfitMargin
FROM Production.Product WHERE ListPrice > StandardCost ORDER BY ProfitMargin
DESC;

SELECT SalesOrderID, OrderDate, TotalDue,
    CASE
        WHEN TotalDue >= 50000 THEN 'Enterprise Order'
        WHEN TotalDue >= 10000 THEN 'Large Order'
        ELSE 'Standard Order'
    END AS OrderCategory
FROM Sales.SalesOrderHeader ORDER BY TotalDue DESC;

SELECT BusinessEntityID, JobTitle, VacationHours, SickLeaveHours
FROM HumanResources.Employee WHERE VacationHours > 50 ORDER BY VacationHours
DESC, SickLeaveHours ASC;

SELECT Name, Color, ListPrice FROM Production.Product

WHERE Color IS NOT NULL
ORDER BY CASE WHEN Color = 'Red' THEN 0 ELSE 1 END, ListPrice DESC;

SELECT BusinessEntityID,
    ISNULL(Title + ' ', '') + FirstName + ' ' + LastName AS FullName,
    CASE EmailPromotion WHEN 0 THEN 'No Promo' WHEN 1 THEN 'AW Only' ELSE 'AW & Partners' END AS PromoStatus
FROM Person.Person ORDER BY LastName, FirstName;

SELECT Name, StandardCost, ListPrice, ((ListPrice - StandardCost) /
StandardCost) * 100 AS MarkupPct
FROM Production.Product WHERE StandardCost > 0 AND ((ListPrice -
StandardCost) / StandardCost) > 0.50 ORDER BY MarkupPct DESC;

SELECT SalesOrderID, OrderDate, DueDate, ShipDate, TotalDue
FROM Sales.SalesOrderHeader WHERE ShipDate > DueDate ORDER BY TotalDue DESC;

SELECT DISTINCT TerritoryID, OnlineOrderFlag FROM Sales.SalesOrderHeader ORDER
BY TerritoryID, OnlineOrderFlag;

SELECT Name, DaysToManufacture,
    CASE WHEN DaysToManufacture = 0 THEN 'Purchased' WHEN DaysToManufacture <=
2 THEN 'Fast Build' ELSE 'Complex Build' END AS BuildType
FROM Production.Product ORDER BY DaysToManufacture DESC, Name ASC;

SELECT BusinessEntityID, SalesQuota, SalesYTD,
    CASE WHEN SalesYTD >= SalesQuota THEN 'Quota Met' WHEN SalesQuota IS NULL
THEN 'No Quota' ELSE 'Below Quota' END AS QuotaStatus
FROM Sales.SalesPerson ORDER BY SalesYTD DESC;

SELECT SalesOrderID, SubTotal, Freight, (Freight / SubTotal) * 100 AS
FreightPct,
    CASE OnlineOrderFlag WHEN 1 THEN 'Online' ELSE 'Reseller' END AS Channel
FROM Sales.SalesOrderHeader WHERE SubTotal > 0 ORDER BY FreightPct DESC;

SELECT Name, Weight, Weight * 0.453592 AS WeightApproxKg
FROM Production.Product WHERE Weight IS NOT NULL ORDER BY Weight DESC;

SELECT DISTINCT JobTitle, SalariedFlag FROM HumanResources.Employee ORDER BY
SalariedFlag DESC, JobTitle ASC;

SELECT SalesOrderID, ProductID, OrderQty, UnitPrice, UnitPriceDiscount,
LineTotal

FROM Sales.SalesOrderDetail WHERE UnitPriceDiscount > 0 AND LineTotal > 5000
ORDER BY LineTotal DESC;

SELECT Name, CountryRegionCode, SalesLastYear, SalesYTD, (SalesYTD -
SalesLastYear) AS YoYGrowth
FROM Sales.SalesTerritory ORDER BY YoYGrowth DESC;

SELECT BusinessEntityID, JobTitle, HireDate,
     CASE WHEN HireDate < '2009-01-01' THEN 'Veteran' WHEN HireDate <
'2011-01-01' THEN 'Experienced' ELSE 'Recent' END AS TenureGroup
FROM HumanResources.Employee ORDER BY HireDate ASC;

SELECT Name, SafetyStockLevel, ReorderPoint, (SafetyStockLevel - ReorderPoint)
AS BufferStock
FROM Production.Product WHERE ReorderPoint < SafetyStockLevel ORDER BY
BufferStock DESC;
GO
