---2019-CE-36---
--Homework--


------------IF/ELSE------------
--1--
CREATE TABLE [10Multiplesof10While] (multiples INT);
DECLARE @i AS INT =1;
WHILE @i<=10
	BEGIN
		INSERT INTO [10Multiplesof10While] VALUES(@i*10)
		SET @i=@i+1
	END
SELECT * FROM [10Multiplesof10While];

--2--
DECLARE @j AS INT =1;
WHILE @j<=50
	BEGIN
		SELECT ProductName from dbo.Products WHERE ProductID=@j AND UnitsinStock<>0
		SET @j=@j+1
	END


------------CASE------------
--3--
SELECT FirstName+' '+LastName,
CASE WHEN ReportsTo IS NOT NULL THEN 'Subordinate'
	 WHEN ReportsTo IS NULL THEN 'Superior'
END AS Status	
FROM dbo.Employees

------------Stored Procedures------------
--4--
CREATE PROC multiplicationtable
@n AS INT
AS
PRINT CONCAT('Table of ',@n)
DECLARE @k AS INT =1;
WHILE @k<=10
	BEGIN
		PRINT CONCAT(@n,' X ',@k,' = ',@k*@n)
		SET @k=@k+1
	END
EXEC multiplicationtable @n=1;
EXEC multiplicationtable @n=2;
EXEC multiplicationtable @n=3;
EXEC multiplicationtable @n=4;
EXEC multiplicationtable @n=5;

--5--
CREATE PROC calculatebill
@id AS INT
AS
SELECT @id AS OrderID,SUM(UnitPrice * Quantity) AS totalBill FROM dbo.[Order Details] WHERE OrderID=@ID
EXEC calculatebill @id=10248;


------------Error Handling------------

--6--
CREATE PROC ErrorInfo
AS
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;

--7--
BEGIN TRY
DECLARE @quantity AS VARCHAR(200);
SET @quantity=(SELECT Quantity FROM dbo.[Order Details] WHERE OrderID=10248);
SELECT @quantity as Quantity;
END TRY
BEGIN CATCH
	EXEC ErrorInfo
END CATCH



