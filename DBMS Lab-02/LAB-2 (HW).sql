/*1. Write a query to report orders which were delayed shipped.*/
SELECT * FROM Orders WHERE ShippedDate>RequiredDate

/*2. Our employees belong to how many countries. List the names.*/
SELECT DISTINCT COUNTRY FROM Employees

/*3. Is there any employee whose is not accountable?*/
SELECT * FROM Employees WHERE ReportsTo IS NULL

/*4. List the names of products which have been discontinued.*/
SELECT * FROM Products WHERE Discontinued='1'

/*5. List the IDs the orders on which discount was not provided.*/
SELECT * FROM [Order Details] WHERE Discount='0'

/*6. Enlist the names of customers who have not specified their region.*/
SELECT * FROM Customers WHERE Region IS NULL

/*7. Enlist the names of customers along with contact number who either belongs to UK or USA.*/
SELECT ContactName, Phone FROM Customers WHERE Country= 'UK' OR Country= 'USA'

/*8. Report the names of companies who have provided their web page.*/
SELECT * FROM Suppliers WHERE HomePage IS NOT NULL

/*9. In which countries, products were sold in year 1997.*/
SELECT ShipCountry FROM ORDERS WHERE ShippedDate Like '%1997%'

/*10. List the ids of customers whose orders were never shipped.*/
SELECT CustomerID FROM ORDERS WHERE ShippedDate IS NULL