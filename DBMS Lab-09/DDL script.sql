use [DBMS-9]
---------------------------------------------------------------------

GO
CREATE FUNCTION dbo.statuschange(@status varchar(10), @quantity int)
RETURNS varchar(10)
AS
BEGIN
	IF @quantity<50
		BEGIN
			SET @status='NA'
		END
	ELSE IF @quantity>=50
		BEGIN
			SET @status='A'
		END
RETURN @status
END;
GO

---------------------------------------------------------------------

CREATE TABLE order_items (
order_id int PRIMARY KEY,
product_id int NOT NULL,
quantity int NOT NULL,
);

CREATE TABLE orders (
id int PRIMARY KEY,
user_id varchar(20) NOT NULL,
status varchar(10) NOT NULL,
created_at varchar(20) NOT NULL,
FOREIGN KEY (id) REFERENCES order_items(order_id)
);

CREATE TABLE products (
id int,
merchant_id int,
name varchar(50) NOT NULL,
price int NOT NULL,
quantity int NOT NULL,
status varchar(10) NOT NULL,
created_at varchar(20) NOT NULL,
PRIMARY KEY(id, merchant_id),
);

CREATE TABLE merchants (
id int PRIMARY KEY,
merchant_name varchar(50) NOT NULL,
admin_id int NOT NULL,
country_code int NOT NULL,
created_at varchar(20) NOT NULL,
);

CREATE TABLE users (
id int PRIMARY KEY,
full_name varchar(50) NOT NULL,
email varchar(50) NOT NULL,
gender varchar(10) NOT NULL,
date_of_birth varchar(20) NOT NULL,
country_code int NOT NULL,
created_at varchar(20) NOT NULL,
);

CREATE TABLE countries (
code int PRIMARY KEY,
name varchar(50) NOT NULL,
continent_name varchar(50),
);

---------------------------------------------------------------------

insert into order_items values (
'12345','010','60');
insert into order_items values (
'67890','020','70')
insert into order_items values (
'11121','030','130')

insert into orders values (
'12345','1a2b','A','20-9-2002')
insert into orders values (
'67890','3c4d','A','20-9-2001')
insert into orders values (
'11121','5e6g','NA','20-9-2005')

insert into products values (
'010','111','zainab','40','700','A','20-9-2002')
insert into products values (
'020','222','rizwan','10','10','NA','20-9-2005')
insert into products values (
'030','333','tayyaba','30','50','A','20-9-2025')

insert into merchants values (
'111','asif','444','99','20-9-2002')
insert into merchants values (
'222','maryam','555','43','20-9-2005')
insert into merchants values (
'333','nasir','666','76','20-9-2025')

insert into countries values (
'91','India','Asia')
insert into countries values (
'43','Pakistan','Asia')
insert into countries values (
'76','Iraq','Asia')

insert into users values (
'10000','Tayyaba Asif','2019ce05@gmail.com','female','20-9-2002','91','15-08-2001')
insert into users values (
'20000','Esha Sajid','eshasajid@hotmail.com','female','20-9-2002','43','15-08-2005')
insert into users values (
'30000','Zainab Rizwan','zainabrizwan@student.uet.edu.pk','female','20-9-2002','43','15-08-2007')

---------------------------------------------------------------------

ALTER TABLE order_items
ADD CONSTRAINT check_order_items CHECK (quantity>=50);

ALTER TABLE merchants
ADD CONSTRAINT check_merchants CHECK (country_code!=91);

ALTER TABLE users
ADD CONSTRAINT check_users CHECK (email LIKE '%_@__%.__%')




















