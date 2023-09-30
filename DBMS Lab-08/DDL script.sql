use [DBMS-8]

CREATE TABLE student (
std_id VARCHAR(10) PRIMARY KEY,
firstname VARCHAR(25) NOT NULL,
lastname VARCHAR(25) NOT NULL,
);

insert into student values (
'2019ce01','Zainab','Rizwan')
insert into student values (
'2019ce02','Maryam','Noor')
insert into student values (
'2019ce03','Aisha','Ameen')
insert into student values (
'2019ce04','Fiza','Ali')
insert into student values (
'2019ce05','Feryal','Saleem')
/******************************************/

CREATE TABLE subjects (
sub_id VARCHAR(10) PRIMARY KEY,
sub_name VARCHAR(50) NOT NULL,
);

insert into subjects values(
'CSC334','Object Oriented Programming')
insert into subjects values(
'CSC125','Database Systems')
insert into subjects values(
'CSC987','Artificial Intelligence')
insert into subjects values(
'CSC341','Programming Fundamentals')
insert into subjects values(
'CSC309','Introduction to Computing')
/******************************************/

CREATE TABLE subject_enroll (
sub_id VARCHAR(10),
std_id VARCHAR(10),
PRIMARY KEY (sub_id, std_id)
);

insert into subject_enroll values(
'CSC334','2019ce01')
insert into subject_enroll values(
'CSC334','2019ce02')
insert into subject_enroll values(
'CSC125','2019ce03')
insert into subject_enroll values(
'CSC334','2019ce04')
insert into subject_enroll values(
'CSC987','2019ce01')
/******************************************/

CREATE TABLE clo(
sub_id VARCHAR(10) NOT NULL,
clo_id VARCHAR(10) PRIMARY KEY ,
clo_name VARCHAR(500) NOT NULL,
clo_marks int NOT NULL,
);

insert into clo values(
'CSC125','101','Implement Abstraction', '50')
insert into clo values(
'CSC334','202','Implement encapsulation', '25')
insert into clo values(
'CSC987','387','Project management', '70')
insert into clo values(
'CSC309','798','Develop ERD', '50')
insert into clo values(
'CSC125','564','Understanding the principles', '10')
/******************************************/

CREATE TABLE rubric (
rubric_id VARCHAR(50) PRIMARY KEY ,
clo_id VARCHAR(50) NOT NULL,
assess_id VARCHAR(50) NOT NULL,
rubric_name VARCHAR(100) NOT NULL,
);

insert into rubric values(
'344','101','501','Design')
insert into rubric values(
'984','101','341','Execution')
insert into rubric values(
'109','798','111','Design')
insert into rubric values(
'366','798','653','Testing')
insert into rubric values(
'107','202','10e','Implementation')
/******************************************/

CREATE TABLE rubric_level (
rubric_id VARCHAR(50) NOT NULL ,
rubric_lev_id VARCHAR(50) PRIMARY KEY,
rubric_lev_details VARCHAR(250) NOT NULL,
neasurement VARCHAR(10) NOT NULL,
);

insert into rubric_level values(
'344','9ac','Functionalities are divided properly','5')
insert into rubric_level values(
'984','4e8','No errors', '5')
insert into rubric_level values(
'109','lm9','All test cases are clear', '4')
insert into rubric_level values(
'109','0id','No test cases are clear', '0')
insert into rubric_level values(
'984','kiw','Program does not compile', '1')
/******************************************/

CREATE TABLE assessment (
clo_id VARCHAR(50) NOT NULL ,
assess_id VARCHAR(50) PRIMARY KEY,
assess_name VARCHAR(50) NOT NULL,
total_marks int NOT NULL,
);

insert into assessment values(
'101','lab01','111','10')
insert into assessment values(
'798','lab02','100','10')
insert into assessment values(
'202','assignment01','298','5')
insert into assessment values(
'101','quiz02','800','15')
insert into assessment values(
'101','cep1','657','30')
/******************************************/

CREATE TABLE assess_comp (
assess_id VARCHAR(50) NOT NULL ,
rubric_id VARCHAR(50) NOT NULL ,
comp_id VARCHAR(50) PRIMARY KEY,
comp_name VARCHAR(200) NOT NULL,
comp_marks int NOT NULL,
);

insert into assess_comp values(
'111','344','abc', 'Question1', '10')
insert into assess_comp values(
'100','344','efg10','MCQ23', '01')
insert into assess_comp values(
'100','984','hij9', 'MCQ24', '01')
insert into assess_comp values(
'100','344','klm4', 'MCQ22', '01')
insert into assess_comp values(
'298','984','no36', 'Question1', '05')
/******************************************/

CREATE TABLE comp_result (
std_id VARCHAR(50) ,
comp_id VARCHAR(50),
obt_comp_marks int NOT NULL,
PRIMARY KEY (std_id, comp_id)
);

insert into comp_result values(
'2019ce01','abc','05')
insert into comp_result values(
'2019ce03','efg10','00')
insert into comp_result values(
'2019ce04','abc','02')
insert into comp_result values(
'2019ce01','efg10','05')
insert into comp_result values(
'2019ce02','abc','03')
/******************************************/

CREATE TABLE assess_result (
std_id VARCHAR(50) ,
assess_id VARCHAR(50),
obt_assess_marks int NOT NULL,
PRIMARY KEY (std_id, assess_id)
);

insert into assess_result values(
'2019ce01','111','15')
insert into assess_result values(
'2019ce03','111','10')
insert into assess_result values(
'2019ce04','100','08')
insert into assess_result values(
'2019ce01','298','07')
insert into assess_result values(
'2019ce04','111','27')
/******************************************/

CREATE TABLE clo_result (
std_id VARCHAR(50) ,
clo_id VARCHAR(50),
obt_clo_marks int NOT NULL,
PRIMARY KEY (std_id, clo_id)
);

insert into clo_result values(
'2019ce01','CSC334','40')
insert into clo_result values(
'2019ce03','CSC334','38')
insert into clo_result values(
'2019ce04','CSC334','63')
insert into clo_result values(
'2019ce02','CSC334','08')
insert into clo_result values(
'2019ce04','CSC125','27')