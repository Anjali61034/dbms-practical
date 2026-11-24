-- Practical 9: String Functions in MS-SQL

USE AdventureWorks2022;
GO

SELECT TOP 10 Name, LEN(Name) AS NameLength FROM Production.Product;

SELECT TOP 10 FirstName, UPPER(FirstName) AS UpperFirst FROM Person.Person;

SELECT TOP 10 LastName, LOWER(LastName) AS LowerLast FROM Person.Person;

SELECT TOP 10 ProductNumber, LEFT(ProductNumber, 2) AS Prefix FROM
Production.Product;

SELECT TOP 10 ProductNumber, RIGHT(ProductNumber, 4) AS Suffix FROM
Production.Product;

SELECT TOP 10 Name, SUBSTRING(Name, 1, 8) AS ShortName FROM Production.Product;

SELECT TOP 10 LoginID, CHARINDEX('\', LoginID) AS SlashPos FROM
HumanResources.Employee;

SELECT TOP 10 Name, REPLACE(Name, 'Mountain', 'Mtn') AS ReplacedName FROM
Production.Product WHERE Name LIKE '%Mountain%';

SELECT TOP 10 CONCAT(FirstName, ' ', LastName) AS FullName FROM Person.Person;

SELECT TOP 10 CONCAT_WS('-', ProductNumber, Color, Size) AS ProductTag FROM
Production.Product WHERE Color IS NOT NULL;

SELECT TRIM('   SQL Server Practical   ') AS TrimmedText, LTRIM('     LeftSpace')
AS LeftTrimmed, RTRIM('RightSpace   ') AS RightTrimmed;

SELECT TOP 10 FirstName, REVERSE(FirstName) AS ReversedName FROM Person.Person;

SELECT TOP 10 Name, REPLICATE('*', 5) + ' ' + Name AS StarredName FROM
Production.Product;

SELECT TOP 10 ProductNumber, STUFF(ProductNumber, 1, 2, 'XX') AS MaskedNumber
FROM Production.Product;

SELECT TOP 10 Name, PATINDEX('%[0-9]%', Name) AS FirstDigitPos FROM
Production.Product WHERE Name LIKE '%[0-9]%';
GO
