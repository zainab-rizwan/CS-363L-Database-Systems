USE BikeStores
GO

--1-Select categories with id less than 5
SELECT * FROM production.categories WHERE category_id<5;

--2-View the first and last names of all customers--
SELECT first_name, last_name FROM sales.customers;

--3-Select production stocks quantity of store located in city 527
SELECT store_name, quantity FROM sales.stores as ss INNER JOIN production.stocks as ps ON ss.store_id=ps.store_id WHERE city='City - 527'

--4-Return the top 5 most inexpensive products--
SELECT TOP 5 product_name, list_price FROM production.products ORDER BY list_price ASC;

--5-Select products with the model year 2017 AND brand id 9
SELECT * FROM production.products WHERE brand_id=9 AND model_year= 2017;

--6-Select most expensive product of each company
SELECT P.product_name AS "Product Name", P.list_price AS "Price",B.brand_name AS Brand
FROM production.brands B, production.products P
WHERE P.brand_id = B.brand_id
AND P.list_price = (SELECT MAX(P.list_price) FROM production.products P WHERE P.brand_id = B.brand_id);

--7-Select customers with the same last name
SELECT a.first_name, a.last_name, b.first_name, b.last_name
FROM sales.customers as a, sales.customers as b
WHERE a.last_name = b.last_name and a.customer_id < b.customer_id

--8-Select staff which has less than 1 customer
SELECT staff_id,first_name,last_name
FROM sales.staffs a 
WHERE 1 > (SELECT COUNT(*) FROM sales.customers WHERE staff_id=a.staff_id);

--9-Receive product information from products and categories table
SELECT product_name,category_name,list_price
FROM production.products p
JOIN production.categories c 
ON c.category_id = p.category_id 

--10-This view gets products along with their brand names
/*
CREATE VIEW ProductBrands AD
SELECT                                    
    product_name,                         
    brand_name,
    list_price
FROM
    production.products p
JOIN production.brands b
    ON p.brand_id = b.brand_id
*/
SELECT * FROM production.categories;




