-- Practical 7: DML Commands (NOT, BETWEEN, IN, AND, OR, LIKE, TOP, FETCH)

USE AdventureWorks2022;
GO

SELECT Name, ListPrice FROM Production.Product WHERE ListPrice BETWEEN 500 AND
1000;

SELECT Name, Color FROM Production.Product WHERE Color IN ('Red', 'Black',
'Blue');

SELECT Name, Color FROM Production.Product WHERE Color NOT IN ('Black',
'Silver');

SELECT Name, ListPrice FROM Production.Product WHERE Name LIKE 'Mountain%';

SELECT Name, Color, ListPrice FROM Production.Product WHERE Color = 'Red' AND
ListPrice > 1000;

SELECT BusinessEntityID, JobTitle FROM HumanResources.Employee WHERE JobTitle =
'Buyer' OR JobTitle = 'Accountant';

SELECT Name, FinishedGoodsFlag FROM Production.Product WHERE NOT
FinishedGoodsFlag = 0;

SELECT TOP 10 Name, ListPrice FROM Production.Product ORDER BY ListPrice DESC;

SELECT TOP 5 PERCENT Name, ListPrice FROM Production.Product ORDER BY ListPrice
DESC;

SELECT Name, ListPrice FROM Production.Product ORDER BY ProductID OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;

SELECT Name, Color, ListPrice FROM Production.Product WHERE (Color = 'Red' OR
Color = 'Blue') AND ListPrice BETWEEN 1000 AND 2500;

SELECT BusinessEntityID, JobTitle, HireDate FROM HumanResources.Employee WHERE
HireDate NOT BETWEEN '2009-01-01' AND '2010-12-31';

SELECT FirstName, LastName FROM Person.Person WHERE LastName LIKE '[A-C]%'
ORDER BY LastName;

SELECT ProductNumber, Name FROM Production.Product WHERE ProductNumber LIKE
'BK-R__R-%';

SELECT TOP 10 WITH TIES Name, ListPrice FROM Production.Product ORDER BY
ListPrice DESC;

SELECT SalesOrderID, OrderDate, TotalDue FROM Sales.SalesOrderHeader ORDER BY
TotalDue DESC OFFSET 20 ROWS FETCH NEXT 15 ROWS ONLY;

SELECT TOP 10 PERCENT SalesOrderID, OrderDate, TotalDue FROM
Sales.SalesOrderHeader WHERE OnlineOrderFlag = 1 ORDER BY TotalDue DESC;

SELECT BusinessEntityID, JobTitle FROM HumanResources.Employee WHERE JobTitle
NOT LIKE '%Technician%' AND JobTitle NOT LIKE '%Manager%';

SELECT Name, Color, Size, ListPrice FROM Production.Product WHERE Color IN
('Black', 'Red', 'Yellow') AND Size IN ('M', 'L', 'XL');

SELECT SalesOrderID, OrderDate, TotalDue FROM Sales.SalesOrderHeader WHERE
OrderDate BETWEEN '2013-01-01' AND '2013-06-30' AND TotalDue > 25000;

SELECT BusinessEntityID, Gender, MaritalStatus, VacationHours FROM
HumanResources.Employee WHERE NOT (Gender = 'M' AND MaritalStatus = 'S');

SELECT Name, ListPrice FROM Production.Product WHERE (Name LIKE '%Bike%' OR
Name LIKE '%Frame%') AND ListPrice > 500;

SELECT TOP 15 Name, Color, ListPrice FROM Production.Product WHERE
FinishedGoodsFlag = 1 AND Color <> 'Black' ORDER BY ListPrice DESC;

SELECT BusinessEntityID, JobTitle, VacationHours FROM HumanResources.Employee
ORDER BY VacationHours DESC OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT SalesOrderID, TerritoryID, TotalDue FROM Sales.SalesOrderHeader WHERE
TerritoryID IN (1, 4, 6) AND NOT OnlineOrderFlag = 1;

SELECT Name FROM HumanResources.Department WHERE Name LIKE '[^A-M]%' ORDER BY
Name;

SELECT TOP 20 SalesOrderID, ProductID, OrderQty, UnitPrice, UnitPriceDiscount
FROM Sales.SalesOrderDetail WHERE OrderQty BETWEEN 5 AND 20 AND
UnitPriceDiscount > 0 ORDER BY LineTotal DESC;

SELECT TOP 2 PERCENT SalesOrderID, ProductID, LineTotal FROM
Sales.SalesOrderDetail ORDER BY LineTotal DESC;

SELECT Name, ProductLine, Class, Style, ListPrice FROM Production.Product WHERE
ProductLine IN ('R', 'M') AND (Class = 'H' OR Style = 'U') AND ListPrice
BETWEEN 800 AND 3000;

SELECT BusinessEntityID, FirstName, LastName FROM Person.Person WHERE FirstName
LIKE 'A%' AND LastName LIKE '%son' ORDER BY LastName, FirstName OFFSET 0 ROWS
FETCH NEXT 10 ROWS ONLY;
GO
