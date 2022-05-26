--Zadanie 1

CREATE FUNCTION CountFibonacci (@n INT)
RETURNS INT
AS
BEGIN
	DECLARE 
	@i INT,
	@j INT,
	@temp INT,
	@counter INT
	SET @i = 1;
	SET @j = 1;
	SET @temp = 1;
	SET @counter = 2;
	WHILE @counter < @n
	BEGIN
		SET @temp = @i + @j;
		SET @i = @j;
		SET @j = @temp;
		SET @counter = @counter + 1;
	END
	RETURN @temp
END;
GO

CREATE PROCEDURE PrintFibonacci @n INT
AS
BEGIN
	DECLARE
		@counter INT = 1,
		@result INT
	WHILE @counter <= @n
	BEGIN
		SET @result=dbo.CountFibonacci(@counter)
		PRINT CONVERT(VARCHAR,@counter) + ' term of a Fibonacci sequence is: ' + CONVERT(VARCHAR,@result)
		SET @counter = @counter + 1
	END
END


EXEC PrintFibonacci 5


DROP FUNCTION dbo.CountFibonacci
DROP PROCEDURE dbo.PrintFibonacci


--Zadanie 2

GO
CREATE TRIGGER UpdateSurname
ON Person.Person
AFTER INSERT
AS
BEGIN 
  UPDATE p SET p.LastName = UPPER(i.LastName)
  FROM Person.Person AS p
  INNER JOIN Inserted AS i
  ON p.LastName = i.LastName;
END


DROP TRIGGER Person.UpdateSurname;

SELECT TOP 10 * FROM [Person].[Person] ORDER BY BusinessEntityID DESC

INSERT INTO [Person].[Person] VALUES(20778, 'IN', 0, NULL, 'Crystal', 'C', 'Kaminsky', NULL, 1, NULL, NULL, '1773C8F3-2CC7-4826-A7F5-30D3F36543CB', GETDATE()) 
DELETE FROM [Person].[Person] WHERE BusinessEntityID = 20778;


--Zadanie 3

GO
CREATE TRIGGER taxRateMonitoring
ON Sales.SalesTaxRate 
AFTER UPDATE
AS
BEGIN
	IF EXISTS (SELECT i.TaxRate, d.TaxRate FROM deleted AS d
	INNER JOIN Inserted AS i
	ON d.TaxRate * 1.3 < i.TaxRate OR d.TaxRate * 0.7 > i.TaxRate) 
	BEGIN
	PRINT 'ERROR! The new TaxRate value differs by more than 30% from the old TaxRate value!';
	END
END


DROP TRIGGER Sales.taxRateMonitoring

UPDATE Sales.SalesTaxRate
SET TaxRate = 14
WHERE SalesTaxRateID = 1

