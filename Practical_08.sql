-- Practical 8: DML Commands (GROUP BY, HAVING, and Aggregate Functions)

USE AdventureWorks2022;
GO

SELECT COUNT(*) AS TotalProducts FROM Production.Product;

SELECT AVG(ListPrice) AS AvgPrice, MIN(ListPrice) AS MinPrice, MAX(ListPrice)
AS MaxPrice FROM Production.Product WHERE ListPrice > 0;

SELECT SUM(TotalDue) AS TotalRevenue FROM Sales.SalesOrderHeader;

SELECT Color, COUNT(*) AS ProductCount FROM Production.Product GROUP BY Color;

SELECT Gender, COUNT(*) AS EmpCount FROM HumanResources.Employee GROUP BY
Gender;

SELECT ProductID, SUM(OrderQty) AS TotalQty FROM Sales.SalesOrderDetail GROUP
BY ProductID;

SELECT MaritalStatus, AVG(VacationHours) AS AvgVacation FROM
HumanResources.Employee GROUP BY MaritalStatus;

SELECT TerritoryID, COUNT(SalesOrderID) AS OrderCount FROM
Sales.SalesOrderHeader GROUP BY TerritoryID;

SELECT GroupName, COUNT(*) AS DeptCount FROM HumanResources.Department GROUP BY
GroupName;

SELECT OnlineOrderFlag, MAX(TotalDue) AS MaxOrder FROM Sales.SalesOrderHeader
GROUP BY OnlineOrderFlag;

SELECT Color, COUNT(*) AS ProductCount FROM Production.Product WHERE Color IS
NOT NULL GROUP BY Color HAVING COUNT(*) > 20 ORDER BY ProductCount DESC;

SELECT ProductSubcategoryID, AVG(ListPrice) AS AvgPrice, COUNT(*) AS Cnt FROM
Production.Product WHERE ProductSubcategoryID IS NOT NULL GROUP BY
ProductSubcategoryID HAVING AVG(ListPrice) > 500 ORDER BY AvgPrice DESC;

SELECT CustomerID, COUNT(*) AS Orders, SUM(TotalDue) AS TotalSpend FROM
Sales.SalesOrderHeader GROUP BY CustomerID HAVING SUM(TotalDue) > 100000 ORDER
BY TotalSpend DESC;

SELECT YEAR(OrderDate) AS OrderYear, COUNT(*) AS OrderCount, SUM(TotalDue) AS
YearlyRevenue FROM Sales.SalesOrderHeader GROUP BY YEAR(OrderDate) ORDER BY
OrderYear;

SELECT MONTH(OrderDate) AS OrderMonth, SUM(TotalDue) AS MonthlySales FROM
Sales.SalesOrderHeader WHERE YEAR(OrderDate) = 2013 GROUP BY MONTH(OrderDate)
HAVING SUM(TotalDue) > 3000000 ORDER BY OrderMonth;

SELECT ProductID, SUM(OrderQty) AS UnitsSold, SUM(LineTotal) AS Revenue FROM
Sales.SalesOrderDetail GROUP BY ProductID HAVING SUM(OrderQty) > 1000 ORDER BY
UnitsSold DESC;

SELECT SalesPersonID, COUNT(*) AS Orders, SUM(TotalDue) AS TotalSales FROM
Sales.SalesOrderHeader WHERE SalesPersonID IS NOT NULL GROUP BY SalesPersonID
HAVING COUNT(*) > 50 AND SUM(TotalDue) > 1000000 ORDER BY TotalSales DESC;

SELECT JobTitle, Gender, COUNT(*) AS Cnt, AVG(VacationHours) AS AvgVac FROM
HumanResources.Employee GROUP BY JobTitle, Gender HAVING AVG(VacationHours) >
40 ORDER BY AvgVac DESC;

SELECT TerritoryID, AVG(TotalDue) AS AvgOrderVal, MAX(TotalDue) AS MaxOrderVal
FROM Sales.SalesOrderHeader GROUP BY TerritoryID HAVING AVG(TotalDue) > 3000
ORDER BY AvgOrderVal DESC;

SELECT TerritoryID, COUNT(DISTINCT CustomerID) AS UniqueCustomers FROM
Sales.SalesOrderHeader GROUP BY TerritoryID ORDER BY UniqueCustomers DESC;

SELECT SalesOrderID, COUNT(*) AS LineItems, SUM(LineTotal) AS OrderSum FROM
Sales.SalesOrderDetail GROUP BY SalesOrderID HAVING COUNT(*) > 10 ORDER BY
LineItems DESC;

SELECT ProductLine, Class, COUNT(*) AS Cnt, MIN(ListPrice) AS MinP,
MAX(ListPrice) AS MaxP, MAX(ListPrice) - MIN(ListPrice) AS PriceSpread FROM
Production.Product WHERE ProductLine IS NOT NULL GROUP BY ProductLine, Class
HAVING COUNT(*) >= 5;

SELECT TerritoryID, OnlineOrderFlag, SUM(TotalDue) AS Revenue FROM
Sales.SalesOrderHeader GROUP BY ROLLUP(TerritoryID, OnlineOrderFlag);

SELECT ProductLine, Style, COUNT(*) AS Cnt FROM Production.Product WHERE
ProductLine IS NOT NULL AND Style IS NOT NULL GROUP BY CUBE(ProductLine,
Style);

SELECT YEAR(OrderDate) AS Yr,
    SUM(CASE WHEN OnlineOrderFlag = 1 THEN TotalDue ELSE 0 END) AS OnlineRev,
    SUM(CASE WHEN OnlineOrderFlag = 0 THEN TotalDue ELSE 0 END) AS ResellerRev
FROM Sales.SalesOrderHeader GROUP BY YEAR(OrderDate) ORDER BY Yr;

SELECT ProductID, COUNT(*) AS DiscountedLines, AVG(UnitPriceDiscount) AS
AvgDiscount FROM Sales.SalesOrderDetail WHERE UnitPriceDiscount > 0 GROUP BY
ProductID HAVING COUNT(*) >= 10 ORDER BY AvgDiscount DESC;

SELECT PersonType, COUNT(*) AS PersonCount FROM Person.Person GROUP BY
PersonType HAVING COUNT(*) > 100 ORDER BY PersonCount DESC;

SELECT Color, AVG(ListPrice) AS AvgP, STDEV(ListPrice) AS StdDevP,
VAR(ListPrice) AS VarP FROM Production.Product WHERE Color IS NOT NULL AND
ListPrice > 0 GROUP BY Color HAVING COUNT(*) > 5;

SELECT TerritoryID, SUM(Freight) AS TotalFreight, SUM(SubTotal) AS TotalSub,
(SUM(Freight)/SUM(SubTotal))*100 AS FreightRatio FROM Sales.SalesOrderHeader
GROUP BY TerritoryID HAVING SUM(SubTotal) > 1000000 ORDER BY FreightRatio DESC;

SELECT YEAR(HireDate) AS HireYear, COUNT(*) AS Hires, AVG(SickLeaveHours) AS
AvgSick FROM HumanResources.Employee GROUP BY YEAR(HireDate) HAVING COUNT(*) >=
10 ORDER BY HireYear;
GO
