USE [DBMS-10]

-------------Question 1-------------
BEGIN TRANSACTION;  
       INSERT INTO ORDERS VALUES('202217','2000','800','3-17-2022','C202217','A202217','COD');
COMMIT; 

-------------Question 2-------------
BEGIN TRANSACTION;  
	   DELETE FROM ORDERS WHERE ORD_NUM LIKE '202217'
COMMIT; 

-------------Question 3-------------
BEGIN TRANSACTION;  
	   UPDATE ORDERS SET ORD_DESCRIPTION='COD' WHERE ORD_NUM LIKE '200103'
COMMIT; 

-------------Question 4-------------
BEGIN TRANSACTION;
	ALTER TABLE dbo.CUSTOMER DROP COLUMN CUST_NAME
	ALTER TABLE dbo.CUSTOMER ADD CUST_FIRST_NAME VARCHAR(50)
	ALTER TABLE dbo.CUSTOMER ADD CUST_LAST_NAME VARCHAR(50)
COMMIT;

-------------Question 5-------------
BEGIN TRANSACTION;  
	   ALTER TABLE AGENTS DROP COLUMN COMMISSION;
COMMIT; 

-------------Question 6-------------
BEGIN TRANSACTION T1 WITH MARK 'marking';  
	  SELECT * FROM AGENTS WHERE AGENT_CODE LIKE 'A001';
COMMIT;

-------------Question 7-------------
BEGIN TRANSACTION
SAVE TRANSACTION S1;
DELETE FROM ORDERS Where ORD_AMOUNT>1000
SAVE TRANSACTION S2;
ROLLBACK TRAN S1;
COMMIT;

-------------Question 8-------------
BEGIN TRANSACTION updateGrade
	UPDATE dbo.CUSTOMER SET GRADE=GRADE+1 WHERE CUST_CODE IN (SELECT DISTINCT CUST_CODE FROM dbo.ORDERS)
COMMIT;

-------------Question 9-------------
BEGIN TRANSACTION;
	UPDATE ORDERS SET ORD_DESCRIPTION='SOD' WHERE ORD_AMOUNT >1000
	SELECT * FROM ORDERS
	ROLLBACK TRANSACTION
	SELECT * FROM dbo.ORDERS

-------------Question 10-------------
BEGIN TRANSACTION
SAVE TRANSACTION S1;
	UPDATE AGENTS SET WORKING_AREA='Bangalore' WHERE AGENT_NAME='Mukesh'
	SELECT * FROM AGENTS WHERE AGENT_NAME='Mukesh'
SAVE TRANSACTION S2;
ROLLBACK TRAN S1;
SELECT * FROM AGENTS WHERE AGENT_NAME='Mukesh'
COMMIT;	



