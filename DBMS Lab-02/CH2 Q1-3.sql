/****QUESTION 1******/
SELECT orderid, orderdate, custid, empid FROM Sales.Orders WHERE YEAR(orderdate) = 2007 AND MONTH(orderdate) = 6

/****QUESTION 2******/
SELECT orderid, orderdate, custid, empid FROM Sales.Orders WHERE orderdate = EOMONTH(orderdate)

/****QUESTION 3******/
SELECT empid, firstname, lastname FROM HR.Employees WHERE lastname LIKE '%a%a%'

