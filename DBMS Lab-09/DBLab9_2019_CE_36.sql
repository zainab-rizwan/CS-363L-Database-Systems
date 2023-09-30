use [old8]
---------------------------------------------------------------------

CREATE TABLE order_items (
order_id int PRIMARY KEY,
product_id int NOT NULL,
quantity int NOT NULL CHECK(quantity>=50),
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
CONSTRAINT myconstraint CHECK(country_code!=91),
);

CREATE TABLE users (
id varchar(50) PRIMARY KEY,
full_name varchar(50) NOT NULL,
email varchar(50) NOT NULL CHECK(email LIKE '%_@__%.__%'),
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
insert into order_items values (
'31415','040','130')
insert into order_items values (
'61718','050','130')
insert into order_items values (
'19202','060','130')
insert into order_items values (
'12223','070','60');
insert into order_items values (
'24252','080','70')
insert into order_items values (
'62728','090','130')
insert into order_items values (
'29303','0100','130')
insert into order_items values (
'13233','0110','130')
insert into order_items values (
'34353','0120','130')
insert into order_items values (
'63738','0130','60');
insert into order_items values (
'39404','0140','70')
insert into order_items values (
'14243','0150','130')
insert into order_items values (
'44454','0160','130')
insert into order_items values (
'64748','0170','130')
insert into order_items values (
'49505','0180','130')
insert into order_items values (
'15253','0190','130')
insert into order_items values (
'54555','0200','130')


insert into orders values (
'12345','1a2b','A','20-9-2002')
insert into orders values (
'67890','3c4d','A','20-9-2001')
insert into orders values (
'11121','5e6g','NA','20-9-2005')
insert into orders values (
'31415','1a2b','A','20-9-2002')
insert into orders values (
'61718','3c4d','A','20-9-2001')
insert into orders values (
'19202','5e6g','NA','20-9-2005')
insert into orders values (
'12223','1a2b','A','20-9-2002')
insert into orders values (
'24252','3c4d','A','20-9-2001')
insert into orders values (
'62728','5e6g','NA','20-9-2005')
insert into orders values (
'29303','1a2b','A','20-9-2002')
insert into orders values (
'13233','3c4d','A','20-9-2001')
insert into orders values (
'34353','5e6g','NA','20-9-2005')
insert into orders values (
'63738','3c4d','A','20-9-2001')
insert into orders values (
'39404','5e6g','NA','20-9-2005')
insert into orders values (
'14243','1a2b','A','20-9-2002')
insert into orders values (
'44454','3c4d','A','20-9-2001')
insert into orders values (
'64748','5e6g','NA','20-9-2005')
insert into orders values (
'49505','1a2b','A','20-9-2002')
insert into orders values (
'15253','3c4d','A','20-9-2001')
insert into orders values (
'54555','5e6g','NA','20-9-2005')

insert into products values (
'010','111','butter','40','700','A','20-9-2002')
insert into products values (
'020','222','egg','10','10','NA','20-9-2005')
insert into products values (
'030','333','baking powder','30','50','A','20-9-2025')
insert into products values (
'040','444','ketchup','40','700','A','20-9-2002')
insert into products values (
'020','555','mayo','10','10','NA','20-9-2005')
insert into products values (
'050','666','cocoa powder','30','50','A','20-9-2025')
insert into products values (
'060','777','soap','40','700','A','20-9-2002')
insert into products values (
'070','888','toothbrush','10','10','NA','20-9-2005')
insert into products values (
'080','999','toothpaste','30','50','A','20-9-2025')
insert into products values (
'090','000','knife','40','700','A','20-9-2002')
insert into products values (
'100','1111','mug','10','10','NA','20-9-2005')
insert into products values (
'110','1212','spoon','30','50','A','20-9-2025')
insert into products values (
'120','1313','fork','40','700','A','20-9-2002')
insert into products values (
'130','1414','plate','10','10','NA','20-9-2005')
insert into products values (
'140','1515','plant','30','50','A','20-9-2025')
insert into products values (
'150','1616','juice','40','700','A','20-9-2002')
insert into products values (
'160','1717','chocolate','10','10','NA','20-9-2005')
insert into products values (
'170','1818','toffee','30','50','A','20-9-2025')
insert into products values (
'180','1919','lux','40','700','A','20-9-2002')
insert into products values (
'190','2020','pins','10','10','NA','20-9-2005')


insert into merchants values (
'111','asif','0111','99','20-9-2002')
insert into merchants values (
'222','maryam','0222','43','20-9-2005')
insert into merchants values (
'333','nasir','0333','76','20-9-2025')
insert into merchants values (
'444','asif','0444','99','20-9-2002')
insert into merchants values (
'555','maryam','0555','43','20-9-2005')
insert into merchants values (
'666','nasir','0666','76','20-9-2025')
insert into merchants values (
'777','asif','0111','99','20-9-2002')
insert into merchants values (
'888','maryam','0555','43','20-9-2005')
insert into merchants values (
'999','nasir','0666','76','20-9-2025')
insert into merchants values (
'000','asif','0444','99','20-9-2002')
insert into merchants values (
'1111','maryam','0555','43','20-9-2005')
insert into merchants values (
'1212','nasir','0111','76','20-9-2025')
insert into merchants values (
'1313','asif','0444','99','20-9-2002')
insert into merchants values (
'1414','maryam','0555','43','20-9-2005')
insert into merchants values (
'1515','nasir','0666','76','20-9-2025')
insert into merchants values (
'1616','asif','0444','99','20-9-2002')
insert into merchants values (
'1717','maryam','0555','43','20-9-2005')
insert into merchants values (
'1818','nasir','0666','76','20-9-2025')
insert into merchants values (
'1919','asif','0222','99','20-9-2002')
insert into merchants values (
'2020','maryam','0111','43','20-9-2005')


insert into countries values (
'91','India','Asia')
insert into countries values (
'43','Pakistan','Asia')
insert into countries values (
'76','Mali','Africa')
insert into countries values (
'32','Britain','Europe')
insert into countries values (
'13','United States of America','America')
insert into countries values (
'11','Canada','America')
insert into countries values (
'12','Mexico','America')
insert into countries values (
'14','Poland','Europe')
insert into countries values (
'15','Germany','Europe')
insert into countries values (
'16','North Korea','Asia')
insert into countries values (
'17','France','Europe')
insert into countries values (
'18','Malaysia','Asia')
insert into countries values (
'19','Argentina','America')
insert into countries values (
'20','Peru','America')
insert into countries values (
'21','Indonesia','Asia')
insert into countries values (
'22','Cuba','America')
insert into countries values (
'23','Morocco','Africa')
insert into countries values (
'24','Italy','Europe')
insert into countries values (
'25','Kenya','Africa')
insert into countries values (
'26','Nigeria','Africa')


insert into users values (
'10000','Tayyaba Asif','2019ce05@gmail.com','female','20-9-2002','91','15-08-2001')
insert into users values (
'20000','Sajid Omar','sajid@hotmail.com','male','20-9-2002','43','15-08-2005')
insert into users values (
'30000','Zainab Rizwan','zainabrizwan@student.uet.edu.pk','female','20-9-2002','43','15-08-2007')
insert into users values (
'40000','Obaid Naeem','2019ce06@gmail.com','male','20-9-2002','91','15-08-2001')
insert into users values (
'50000','Arooj Naeem','2019ce07@hotmail.com','female','20-9-2002','43','15-08-2005')
insert into users values (
'60000','Neha Tahir','2019ce08@student.uet.edu.pk','female','20-9-2002','43','15-08-2007')
insert into users values (
'70000','Rizwan Hameed','2019ce09@gmail.com','male','20-9-2002','91','15-08-2001')
insert into users values (
'80000','Raza Ahmed','2019ce010@hotmail.com','male','20-9-2002','43','15-08-2005')
insert into users values (
'90000','Riaz Ali','2019ce011@student.uet.edu.pk','male','20-9-2002','43','15-08-2007')
insert into users values (
'100000','Arooj Arif','2019ce12@gmail.com','female','20-9-2002','91','15-08-2001')
insert into users values (
'110000','Fajar Gillani','2019ce13@hotmail.com','female','20-9-2002','43','15-08-2005')
insert into users values (
'120000','Ijaz Shakeel','2019ce14@student.uet.edu.pk','male','20-9-2002','43','15-08-2007')
insert into users values (
'130000','Maqsood Rana','2019ce15@gmail.com','male','20-9-2002','91','15-08-2001')
insert into users values (
'140000','Areeba Fatima','2019ce16@hotmail.com','female','20-9-2002','43','15-08-2005')
insert into users values (
'150000','Minahil Nadeem','2019ce17@student.uet.edu.pk','female','20-9-2002','43','15-08-2007')
insert into users values (
'160000','Waqas Ali','2019ce18@gmail.com','male','20-9-2002','91','15-08-2001')
insert into users values (
'170000','Raja Muzammal','2019ce19@hotmail.com','male','20-9-2002','43','15-08-2005')
insert into users values (
'180000','Zain Nasir','2019ce20@student.uet.edu.pk','female','20-9-2002','43','15-08-2007')
insert into users values (
'190000','Anaya Usman','2019ce21@gmail.com','female','20-9-2002','91','15-08-2001')
insert into users values (
'200000','Amna Sajid','2019ce22@hotmail.com','female','20-9-2002','43','15-08-2005')

---------------------------------------------------------------------

GO
CREATE TRIGGER update_status   
ON products 
AFTER INSERT
AS
BEGIN  
IF (SELECT quantity FROM products)<50
	INSERT INTO products(status) VALUES('NA')
ELSE 
	INSERT INTO products(status) VALUES('A')
END  

---------------------------------------------------------------------
ALTER TABLE merchants DROP CONSTRAINT myconstraint;
ALTER TABLE merchants ADD CONSTRAINT newconstraint CHECK(country_code=91);



















