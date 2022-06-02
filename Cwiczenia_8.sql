--Zadanie 1
USE AdventureWorks2019;
WITH TempEmployeeInfo AS
(SELECT p.FirstName, p.LastName, h.Rate
FROM Person.Person AS p
JOIN HumanResources.EmployeePayHistory AS h
ON p.BusinessEntityID = h.BusinessEntityID)

SELECT * FROM TempEmployeeInfo

GO


--Zadanie 2
USE AdventureWorksLT2019;
WITH RevenueInfo AS
(SELECT c.CompanyName + ' (' + c.FirstName + ' ' + c.LastName + ')' AS CompanyContact,
TotalDue AS Revenue
FROM SalesLT.Customer AS c
JOIN SalesLT.SalesOrderHeader AS s
ON c.CustomerID = s.CustomerID)

SELECT * FROM RevenueInfo
ORDER BY CompanyContact ASC

GO


--Zadanie 3
USE AdventureWorksLT2019;
WITH CategoryInfo AS
(SELECT pc.Name AS Category, CAST(SUM(s.LineTotal) AS DECIMAL(10,2)) AS SalesValue
FROM SalesLT.ProductCategory AS pc
JOIN SalesLT.Product AS p
ON pc.ProductCategoryID = p.ProductCategoryID
JOIN SalesLT.SalesOrderDetail AS s
ON p.ProductID = s.ProductID
GROUP BY pc.Name)

SELECT * FROM CategoryInfo
ORDER BY Category



