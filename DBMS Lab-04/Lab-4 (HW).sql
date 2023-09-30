----QUESTION 1----
SELECT DISTINCT CustomerID,  ContactName AS CustomerName 
FROM Customers
WHERE CustomerID 
IN (SELECT O.CustomerID FROM Orders AS O WHERE RequiredDate<ShippedDate)

----QUESTION 2----
SELECT ProductName, CompanyName
FROM Products P, Suppliers S
WHERE EXISTS (SELECT SupplierID FROM Suppliers WHERE P.SupplierID= S.SupplierID)

----QUESTION 3----
SELECT TOP 10 P.ProductName
FROM Products AS P
WHERE P.ProductID 
IN (SELECT OD.ProductID FROM [Order Details] AS OD 
WHERE OD.OrderID 
IN (SELECT O.OrderID FROM Orders AS O WHERE YEAR(O.OrderDate)=1998))

----QUESTION 4----
SELECT CONCAT(a.FirstName,' ',a.LastName) AS EmployeeName, CONCAT(b.FirstName,' ',b.LastName) AS ManagerName 
FROM Employees a, Employees b
WHERE EXISTS (SELECT EmployeeID FROM Employees WHERE a.ReportsTo=b.EmployeeID)

----QUESTION 5----
SELECT CONCAT(b.FirstName,b.LastName) as ManagerName
FROM Employees b WHERE b.EmployeeID
IN (SELECT a.Reportsto FROM Employees a GROUP BY a.ReportsTo HAVING COUNT (a.ReportsTo)<2)
GROUP BY CONCAT(b.FirstName,b.LastName)

----QUESTION 6----
SELECT  ProductName, UnitPrice 
FROM Products 
WHERE UnitPrice> (SELECT AVG(UnitPrice) FROM Products)
ORDER BY UnitPrice

----QUESTION 7----
SELECT MAX(UnitPrice) AS Price 
FROM Products 
WHERE UnitPrice<(SELECT MAX(UnitPrice) FROM Products)

----QUESTION 8----
SELECT CONCAT(a.FirstName,' ',a.LastName) AS EmployeeName, CONCAT(b.FirstName,' ',b.LastName) AS ManagerName, a.BirthDate AS EmployeeAge, b.BirthDate AS ManagerAge
FROM Employees a, Employees b
WHERE EXISTS (SELECT EmployeeID FROM Employees WHERE a.ReportsTo=b.EmployeeID AND a.BirthDate<b.BirthDate)

----QUESTION 9----
SELECT P.ProductName 
FROM Products AS P
WHERE P.ProductID 
IN (SELECT OD.ProductID FROM [Order Details] AS OD 
WHERE OD.OrderID 
IN (SELECT O.OrderID FROM Orders AS O WHERE O.OrderDate='1997-08-08 00:00:00.000'))

----QUESTION 10----
SELECT DISTINCT S.ContactName 
FROM Suppliers AS S
WHERE S.SupplierID 
IN (SELECT P.SupplierID FROM Products AS P WHERE
P.ProductID 
IN (SELECT OD.ProductID FROM [Order Details] AS OD WHERE OD.OrderID 
IN(SELECT O.OrderID FROM Orders AS O WHERE YEAR(O.OrderDate)=1997)))
ORDER BY ContactName

----QUESTION 11----
SELECT COUNT( DISTINCT (E.EmployeeID)) AS Employees FROM EmployeeTerritories AS E
WHERE E.TerritoryID 
IN (SELECT T.TerritoryID FROM Territories AS T WHERE T.RegionID 
IN (SELECT R.RegionID FROM Region AS R WHERE R.RegionID=1))

----QUESTION 12----
SELECT P.ProductName,P.SupplierID FROM Products AS P
WHERE P.ProductID 
IN (SELECT OD.ProductID FROM [Order Details] AS OD WHERE OD.OrderID
IN (SELECT O.OrderID FROM Orders AS O WHERE YEAR(O.OrderDate) != 1966))
ORDER BY ProductName
