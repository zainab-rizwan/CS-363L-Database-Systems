----QUESTION 1 Give the list of all stations (Station Name) from where the rides were taken in year 2004.----
SELECT S.Station_ID, Location FROM Stations AS S
INNER JOIN Bike_Rentals AS BR
ON BR.Station_ID=S.Station_ID
INNER JOIN Payments AS P
ON P.Customer_ID=BR.Customer_ID
 WHERE YEAR(Date_stamp)= '2004'

----QUESTION 2 Give the total repairing cost of each bike. Schema should be like this. (Bike Id, Repairing Cost) ---
SELECT Bike_ID, SUM(Price) AS [Repairing Cost] FROM Repairs AS R
INNER JOIN Bike_Status AS B
ON B.B_Status_ID=R.B_Status_ID
GROUP BY Bike_ID

----QUESTION 3 Bikes of which station are need most repairing. Give the station name----
SELECT TOP 3 B.Bike_ID, SUM(Price) AS [Highest Repairing Cost] FROM Repairs AS R
INNER JOIN Bike_Status AS BS
ON BS.B_Status_ID=R.B_Status_ID
INNER JOIN Bikes AS B
ON B.Bike_ID=BS.Bike_ID
GROUP BY B.Bike_ID
ORDER BY [Highest Repairing Cost] DESC

----QUESTION 4 How many bikes are owned by each station? Schema should be (StationName, TotalBikes)----
SELECT Station_ID, COUNT(Bike_ID) AS TotalBikes FROM Bikes
GROUP BY Station_ID

----QUESTION 5 Given the name customers who never rented a bike. Schema is as follow. (CustomerFullName)----
SELECT CONCAT(Fname, ' ',Lname) AS CustomerFullName FROM Customer_Details AS CD
LEFT JOIN Bike_Rentals AS BR
ON CD.Customer_ID=BR.Customer_ID
WHERE BR.Customer_ID IS NULL

----QUESTION 6 Give the bike ids of those bikes who were renter after year 2016. ----
SELECT BR.Bike_ID FROM Bike_Rentals AS BR
INNER JOIN Payments AS P
ON P.Customer_ID=BR.Customer_ID
WHERE YEAR(Date_stamp)= '2016'
GROUP BY BR.Bike_ID

----QUESTION 7 Identify the customers who always pay using mastercard. Give the full name of customers----
SELECT CONCAT(Fname, ' ',Lname) AS CustomerFullName FROM Customer_Details AS CD
INNER JOIN Payments AS P
ON CD.Customer_ID=P.Customer_ID
INNER JOIN Payment_Method AS PM
ON P.Method_ID=PM.Method_ID
WHERE PM.Method='mastercard'
GROUP BY  CONCAT(Fname, ' ',Lname)

----QUESTION 8 For which station (Station Name) the most bikes are moved using vans in year 2015.----
SELECT TOP 10  SUM(Bikes) AS Bikes, (S.Station_ID) FROM Stations AS S
INNER JOIN Vans AS V
ON S.Station_ID=V.Station_ID
WHERE YEAR(Date_stamp)=2015
GROUP BY S.Station_ID
ORDER BY Bikes DESC

----QUESTION 9 Give the average cost of repairing that was spent on each bike. Schema includes (BikeId, AverageCost)----
SELECT B.Bike_ID AS BikeId, AVG(Price) AS [Average Cost] FROM Repairs AS R
INNER JOIN Bike_Status AS BS
ON BS.B_Status_ID=R.B_Status_ID
INNER JOIN Bikes AS B
ON B.Bike_ID=BS.Bike_ID
GROUP BY B.Bike_ID

----QUESTION 10 Give the BikeIds which were repaired in at least 3 year----
SELECT BS.Bike_ID FROM Repairs AS R
INNER JOIN Bike_Status AS BS
ON R.B_Status_ID=BS.B_Status_ID
INNER JOIN Bikes AS B
ON B.Bike_ID=BS.Bike_ID
WHERE YEAR(Delivered) BETWEEN 2015 AND 2017
GROUP BY Bike_ID
