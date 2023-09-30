----------QUESTION 1: Write a query that generates five copies of each employee row: Tables involved: HR.Employees and dbo.Nums ----------
SELECT empid, 
		firstname, 
		lastname, 
		n 
FROM HR.Employees 
CROSS JOIN dbo.Nums 
WHERE n <= 5 
ORDER BY n;

----------QUESTION 2: Write a query that returns a row for each employee and day in the range June 12, 2016 through June 16, 2016: Tables involved: HR.Employees and dbo.Nums ----------
SELECT empid, 
	   hiredate AS dt 
FROM HR.Employees 
CROSS JOIN dbo.NUMS 
WHERE hiredate BETWEEN '20010505' AND '20010510';

----------QUESTION 3: Explain what’s wrong in the following query, and provide a correct alternative:----------
--SELECT Customers.custid, Customers.companyname, Orders.orderid, Orders.orderdate FROM Sales.Customers AS C INNER JOIN Sales.Orders AS O ON Customers.custid = Orders.custid;--
SELECT c.custid, 
	   c.companyname, 
	   o.orderid, 
	   o.orderdate
FROM Sales.Customers AS c 
INNER JOIN Sales.Orders AS o 
ON c.custid= o.custid 
ORDER BY custid;

----------QUESTION 4: Return US customers, and for each customer return the total number of orders and total quantities: Tables involved: Sales.Customers, Sales.Orders, and Sales.OrderDetails ----------
SELECT C.custid AS id,
	   COUNT(DISTINCT O.orderid) AS numorders,
	   SUM (OD.qty) AS totalqty	   
FROM Sales.Customers AS C 
INNER JOIN Sales.Orders AS O 
	ON C.custid= O.custid
INNER JOIN Sales.OrderDetails AS OD
	ON O.orderid= OD.orderid
GROUP BY C.custid

----------QUESTION 5: Return customers and their orders, including customers who placed no orders: Tables involved: Sales.Customers and Sales.Orders ----------
SELECT C.custid,
	   C.companyname,
	   O.orderid,
	   O.orderdate
FROM Sales.Customers AS C 
LEFT JOIN Sales.Orders AS O 
	ON C.custid= O.custid

----------QUESTION 6: Return customers who placed no orders: Tables involved: Sales.Customers and Sales.Orders----------
SELECT C.custid,
	   C.companyname
FROM Sales.Customers AS C 
LEFT JOIN Sales.Orders AS O 
	ON C.custid= O.custid
WHERE O.orderid IS NULL

----------QUESTION 7: Return customers with orders placed on February 12, 2016, along with their orders: Tables involved: Sales.Customers and Sales.Orders ----------
SELECT C.custid,
	   C.companyname,
	   O.orderid,
	   O.orderdate
FROM Sales.Customers AS C 
INNER JOIN Sales.Orders AS O 
	ON C.custid= O.custid
WHERE O.orderdate = '20060712';

----------QUESTION 8: Write a query that returns all customers in the output, but matches them with their respective orders only if 
they were placed on February 12, 2016: Tables involved: Sales.Customers and Sales.Orders ----------
SELECT C.custid,
	   C.companyname,
	   O.orderid,
	   O.orderdate
FROM Sales.Customers AS C 
LEFT JOIN Sales.Orders AS O 
	ON C.custid=O.custid
	AND O.orderdate='20060712'
	OR O.orderid is NULL;

----------QUESTION 9: Explain why the following query isn’t a correct solution query for Exercise 8----------
--The WHERE clause is the reason why this query isn't the correct answer.












