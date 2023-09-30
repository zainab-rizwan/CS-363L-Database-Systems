USE [DMBS_2]
GO

/******ACTIIVTY 1******/
SELECT * FROM STUDENT
SELECT RegNo FROM STUDENT 
SELECT * FROM STUDENT WHERE GPA>3.5
SELECT * FROM STUDENT WHERE GPA<=3.5
/****No all the data has not been dispayed by the last 2 queries**********/
SELECT CONCAT(FirstName,' ',LastName) FROM STUDENT

/******ACTIVTY 2******/
SELECT entry1-entry2*entry3 FROM Enteries 
SELECT (entry1-entry2)*entry3 FROM Enteries 


SELECT entry1-entry2 FROM Enteries
SELECT entry1+entry2 FROM Enteries
SELECT entry1*entry2 FROM Enteries

/******DISTINCT******/
SELECT DISTINCT Contact FROM STUDENT

