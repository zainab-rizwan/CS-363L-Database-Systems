---2019-ce-36---
----Lab work----

USE Northwind
GO

-------------Variables--------------
--1--
DECLARE @title AS VARCHAR(200);
SET @title =(SELECT ContactTitle FROM dbo.Customers WHERE CustomerID='BERGS');
SELECT @title as ContactTitle;

--2--
DECLARE @name AS VARCHAR(200);
DECLARE @title2 AS VARCHAR(200);
DECLARE @address AS VARCHAR(200);
SET @name =(SELECT ContactName FROM dbo.Customers WHERE CustomerID='BERGS');
SET @title2 =(SELECT ContactTitle FROM dbo.Customers WHERE CustomerID='BERGS');
SET @address =(SELECT Address FROM dbo.Customers WHERE CustomerID='BERGS');
SELECT @name,@title2,@address;

--3--
DECLARE @quantity AS VARCHAR(200);
SET @quantity=(SELECT Quantity FROM dbo.[Order Details] WHERE OrderID=10248 AND Quantity=12);
SELECT @quantity as Quantity;

-------------Batch--------------
--4--
CREATE PROC CustomerDetails 
@custid AS VARCHAR(50)
AS
SELECT * FROM dbo.Customers WHERE CustomerID=@custid
GO

EXEC CustomerDetails @custid='ANTON';


---GON, SET NCOUNT N, GENERATING SEQUENCES, IDENTITY----
--5--

CREATE TABLE FirstMultiplesOf10(multiple INT);
CREATE SEQUENCE sequence_1
START WITH 10
increment by 10
minvalue 10
maxvalue 100
cycle;
INSERT INTO FirstMultiplesOf10 VALUES(NEXT VALUE FOR sequence_1)
GO 10
SELECT * FROM  FirstMultiplesOf10

--6--
CREATE SEQUENCE sequence_2
START WITH 10
increment by 10
minvalue 10
maxvalue 200
cycle;
CREATE TABLE SecondMultiplesOf10(multiple INT);
INSERT INTO SecondMultiplesOf10 VALUES(NEXT VALUE FOR sequence_2)
GO 20
SELECT * FROM  SecondMultiplesOf10


--7--
CREATE TABLE IdentityExamples(
	id INT IDENTITY(1,3),
	ProductName VARCHAR(50)
);
INSERT INTO IdentityExamples(ProductName) VALUES ('Pen');
INSERT INTO IdentityExamples(ProductName) VALUES ('Pencil');
SELECT * FROM IdentityExamples;
