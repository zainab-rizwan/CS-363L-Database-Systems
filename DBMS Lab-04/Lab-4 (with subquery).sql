----QUESTION 1 Give the list of all stations (Station Name) from where the rides were taken in year 2004.----
 SELECT S.Station_ID, S.Location FROM Stations AS S
 WHERE S.Station_ID 
 IN (SELECT BR.Station_ID FROM Bike_Rentals AS BR WHERE BR.Customer_ID
 IN (SELECT P.Customer_ID FROM Payments AS P  WHERE YEAR(Date_stamp)= '2004' ))

----QUESTION 2 Give the total repairing cost of each bike. Schema should be like this. (Bike Id, Repairing Cost) ---
SELECT Bike_ID, SUM(Price) AS [Repairing Cost] 
FROM Repairs R, Bike_Status B
WHERE EXISTS (SELECT B_Status_ID FROM Bike_Status WHERE B.B_Status_ID=R.B_Status_ID)
GROUP BY Bike_ID

----QUESTION 3 Bikes of which station are need most repairing. Give the station name----
SELECT TOP 3 B.Bike_ID, SUM(Price) AS [Highest Repairing Cost] 
FROM Repairs R, Bike_Status BS, Bikes B
WHERE EXISTS (SELECT B_Status_ID FROM Bike_Status WHERE BS.B_Status_ID=R.B_Status_ID AND B.Bike_ID=BS.Bike_ID)
GROUP BY B.Bike_ID
ORDER BY [Highest Repairing Cost] DESC

----QUESTION 4 How many bikes are owned by each station? Schema should be (StationName, TotalBikes)----
SELECT Station_ID, COUNT(Bike_ID) AS TotalBikes FROM Bikes
GROUP BY Station_ID

----QUESTION 5 Given the name customers who never rented a bike. Schema is as follow. (CustomerFullName)----
SELECT CONCAT(Fname, ' ',Lname) AS CustomerFullName FROM Customer_Details AS CD
LEFT JOIN (SELECT Customer_ID FROM Bike_Rentals) AS BR
ON CD.Customer_ID=BR.Customer_ID
WHERE BR.Customer_ID IS NULL

----QUESTION 6 Give the bike ids of those bikes who were renter after year 2016. ----
SELECT BR.Bike_ID FROM Bike_Rentals AS BR
WHERE BR.Customer_ID
IN (SELECT P.Customer_ID FROM Payments AS P WHERE YEAR(Date_stamp)= '2016')
GROUP BY BR.Bike_ID

----QUESTION 7 Identify the customers who always pay using mastercard. Give the full name of customers----
SELECT CONCAT(Fname, ' ',Lname) AS CustomerFullName FROM Customer_Details AS CD
WHERE CD.Customer_ID 
IN (SELECT P.Customer_ID FROM Payments AS P WHERE P.Method_ID
IN (SELECT PM.Method_ID FROM Payment_Method AS PM WHERE PM.Method='mastercard'))

----QUESTION 8 For which station (Station Name) the most bikes are moved using vans in year 2015.----
SELECT TOP 10  SUM(Bikes) AS Bikes, (S.Station_ID) 
FROM Stations S, Vans V
WHERE EXISTS (SELECT Station_ID FROM Vans WHERE S.Station_ID=V.Station_ID)
AND YEAR(Date_stamp)=2015
GROUP BY S.Station_ID
ORDER BY Bikes DESC

----QUESTION 9 Give the average cost of repairing that was spent on each bike. Schema includes (BikeId, AverageCost)----
SELECT B.Bike_ID AS BikeId, AVG(Price) AS [Average Cost] 
FROM Repairs R, Bike_Status BS, Bikes B
WHERE EXISTS (SELECT B_Status_ID FROM Bike_Status WHERE BS.B_Status_ID=R.B_Status_ID AND B.Bike_ID=BS.Bike_ID)
GROUP BY B.Bike_ID

----QUESTION 10 Give the BikeIds which were repaired in at least 3 year
SELECT BS.Bike_ID FROM Bike_Status AS BS
WHERE BS.Bike_ID 
IN (SELECT B.Bike_ID FROM Bikes AS B WHERE B_Status_ID
IN (SELECT R.B_Status_ID FROM Repairs AS R WHERE YEAR(Delivered) BETWEEN 2015 AND 2017))
GROUP BY BS.Bike_ID
