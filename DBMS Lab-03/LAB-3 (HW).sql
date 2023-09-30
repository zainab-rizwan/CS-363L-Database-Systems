----QUESTION 1: Give the names of customers whose orders were delayed. Your answer should have the following schema Customers(CustomerId, CustomerName) ----
SELECT DISTINCT C.CustomerID, ContactName AS CustomerName FROM Customers AS C 
INNER JOIN Orders AS O 
ON C.CustomerID = O.CustomerID 
WHERE RequiredDate<ShippedDate

----QUESTION 2: Give the products details with its supplier company. Products(ProductName, SupplierName) ----
SELECT P.ProductName, S.CompanyName AS SupplierName FROM PRODUCTS AS P
INNER JOIN Suppliers AS S
ON P.SupplierID= S.SupplierID

----QUESTION 3: Give the name of top products which have highest sale in the year 1998.----
SELECT TOP 10 P.ProductName FROM [Order Details] AS OD
INNER JOIN Orders AS O
ON OD.OrderID=O.OrderID 
INNER JOIN Products AS P
ON P.ProductID=OD.ProductID
WHERE YEAR(OrderDate)= 1998

----QUESTION 4: Give the name of employees with its manager name. Schema should have the following schema. (EmployeeName, ManagerName) ----
SELECT CONCAT(a.FirstName,' ',a.LastName) AS EmployeeName, CONCAT(b.FirstName,' ',b.LastName) AS ManagerName 
FROM Employees a, Employees b
WHERE a.ReportsTo=b.EmployeeID

----QUESTION 5: Give the full names of managers who have less than two employees.----
SELECT CONCAT(b.FirstName,b.LastName) as ManagerName
FROM Employees a,Employees b
WHERE a.ReportsTo=b.EmployeeID
GROUP BY CONCAT(b.FirstName,b.LastName)
HAVING COUNT (a.ReportsTo)<2

----QUESTION 6: List all the products whose price is more than average price. ----
SELECT  ProductName, UnitPrice FROM Products 
WHERE UnitPrice> (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice

----QUESTION 7: Find second highest priced product without using TOP statement ----
SELECT MAX(a.UnitPrice) AS Price FROM Products a, Products b
WHERE b.UnitPrice>a.UnitPrice

----QUESTION 8: Are there any employees who are elder than their managers? List that names of those employees. Schema should look like this Employees(EmployeeName,ManagerName,EmployeeAge,ManagerAge)----
SELECT CONCAT(a.FirstName,' ',a.LastName) AS EmployeeName, CONCAT(b.FirstName,' ',b.LastName) AS ManagerName, a.BirthDate AS EmployeeAge, b.BirthDate AS ManagerAge
FROM Employees a, Employees b
WHERE a.ReportsTo=b.EmployeeID AND a.BirthDate<b.BirthDate

----QUESTION 9: List the names of products which were ordered on 8th August 1997. ----
SELECT P.ProductName, O.OrderDate FROM [Order Details] AS OD
INNER JOIN Orders AS O
ON OD.OrderID=O.OrderID 
INNER JOIN Products AS P
ON P.ProductID=OD.ProductID
WHERE O.OrderDate= '1997-08-08 00:00:00.000'

----QUESTION 10: . List the names of suppliers whose supplied products were ordered in 1997.----
SELECT DISTINCT ContactName FROM [Order Details] AS OD
INNER JOIN Orders AS O
ON OD.OrderID=O.OrderID 
INNER JOIN Products AS P
ON P.ProductID=OD.ProductID
INNER JOIN Suppliers AS S
ON P.SupplierID= S.SupplierID
WHERE YEAR(OrderDate)= 1997
GROUP BY ContactName

----QUESTION 11: How many employees are assigned to Eastern region? Give count.----
SELECT COUNT( DISTINCT (E.EmployeeID)) AS Employees FROM EmployeeTerritories AS E
INNER JOIN Territories AS T
ON E.TerritoryID=T.TerritoryID
INNER JOIN Region AS R 
ON T.RegionID=R.RegionID
WHERE R.RegionID=1

----QUESTION 12: Give the name of products which were not ordered in 1996.----
SELECT DISTINCT P.ProductName,P.SupplierID FROM [Order Details] AS OD
INNER JOIN Orders AS O
ON OD.OrderID=O.OrderID 
INNER JOIN Products AS P
ON P.ProductID=OD.ProductID
WHERE YEAR(OrderDate) != 1966
ORDER BY ProductName







