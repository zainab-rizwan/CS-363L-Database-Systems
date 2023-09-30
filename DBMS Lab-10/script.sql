
/****** Object:  Database [My_Company]    Script Date: 04/04/2022 12:43:24 pm ******/
CREATE DATABASE [My_Company]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'My_Company', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\My_Company.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'My_Company_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\My_Company_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [My_Company] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [My_Company].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [My_Company] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [My_Company] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [My_Company] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [My_Company] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [My_Company] SET ARITHABORT OFF 
GO
ALTER DATABASE [My_Company] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [My_Company] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [My_Company] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [My_Company] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [My_Company] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [My_Company] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [My_Company] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [My_Company] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [My_Company] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [My_Company] SET  DISABLE_BROKER 
GO
ALTER DATABASE [My_Company] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [My_Company] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [My_Company] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [My_Company] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [My_Company] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [My_Company] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [My_Company] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [My_Company] SET RECOVERY FULL 
GO
ALTER DATABASE [My_Company] SET  MULTI_USER 
GO
ALTER DATABASE [My_Company] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [My_Company] SET DB_CHAINING OFF 
GO
ALTER DATABASE [My_Company] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [My_Company] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [My_Company] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [My_Company] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'My_Company', N'ON'
GO
ALTER DATABASE [My_Company] SET QUERY_STORE = OFF
GO
USE [My_Company]
GO
/****** Object:  Table [dbo].[AGENTS]    Script Date: 04/04/2022 12:43:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGENTS](
	[AGENT_CODE] [char](6) NOT NULL,
	[AGENT_NAME] [char](40) NULL,
	[WORKING_AREA] [char](35) NULL,
	[COMMISSION] [float] NULL,
	[PHONE_NO] [char](15) NULL,
	[COUNTRY] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[AGENT_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 04/04/2022 12:43:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[CUST_CODE] [varchar](6) NOT NULL,
	[CUST_NAME] [varchar](40) NOT NULL,
	[CUST_CITY] [char](35) NULL,
	[WORKING_AREA] [varchar](35) NOT NULL,
	[CUST_COUNTRY] [varchar](20) NOT NULL,
	[GRADE] [int] NULL,
	[OPENING_AMT] [float] NOT NULL,
	[RECEIVE_AMT] [float] NOT NULL,
	[PAYMENT_AMT] [float] NOT NULL,
	[OUTSTANDING_AMT] [float] NOT NULL,
	[PHONE_NO] [varchar](15) NOT NULL,
	[AGENT_CODE] [char](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CUST_CODE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 04/04/2022 12:43:24 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORD_NUM] [int] NOT NULL,
	[ORD_AMOUNT] [float] NOT NULL,
	[ADVANCE_AMOUNT] [float] NOT NULL,
	[ORD_DATE] [date] NOT NULL,
	[CUST_CODE] [varchar](6) NOT NULL,
	[AGENT_CODE] [char](6) NOT NULL,
	[ORD_DESCRIPTION] [varchar](60) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ORD_NUM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A001  ', N'Subbarao                                ', N'Bangalore                          ', 0.14, N'077-12346674   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A002  ', N'Mukesh                                  ', N'Mumbai                             ', 0.11, N'029-12358964   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A003  ', N'Alex                                    ', N'London                             ', 0.13, N'075-12458969   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A004  ', N'Ivan                                    ', N'Torento                            ', 0.15, N'008-22544166   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A005  ', N'Anderson                                ', N'Brisban                            ', 0.13, N'045-21447739   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A006  ', N'McDen                                   ', N'London                             ', 0.15, N'078-22255588   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A007  ', N'Ramasundar                              ', N'Bangalore                          ', 0.15, N'077-25814763   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A008  ', N'Alford                                  ', N'New York                           ', 0.12, N'044-25874365   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A009  ', N'Benjamin                                ', N'Hampshair                          ', 0.11, N'008-22536178   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A010  ', N'Santakumar                              ', N'Chennai                            ', 0.14, N'007-22388644   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A011  ', N'Ravi Kumar                              ', N'Bangalore                          ', 0.15, N'077-45625874   ', N'')
INSERT [dbo].[AGENTS] ([AGENT_CODE], [AGENT_NAME], [WORKING_AREA], [COMMISSION], [PHONE_NO], [COUNTRY]) VALUES (N'A012  ', N'Lucida                                  ', N'San Jose                           ', 0.12, N'044-52981425   ', N'')
GO
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00001', N'Micheal', N'New York                           ', N'New York', N'USA', 2, 3000, 5000, 2000, 6000, N'CCCCCCC', N'A008  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00002', N'Bolt', N'New York                           ', N'New York', N'USA', 3, 5000, 7000, 9000, 3000, N'DDNRDRH', N'A008  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00003', N'Martin', N'Torento                            ', N'Torento', N'Canada', 2, 8000, 7000, 7000, 8000, N'MJYURFD', N'A004  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00004', N'Winston', N'Brisban                            ', N'Brisban', N'Australia', 1, 5000, 8000, 7000, 6000, N'AAAAAAA', N'A005  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00005', N'Sasikant', N'Mumbai                             ', N'Mumbai', N'India', 1, 7000, 11000, 7000, 11000, N'147-25896312', N'A002  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00006', N'Shilton', N'Torento                            ', N'Torento', N'Canada', 1, 10000, 7000, 6000, 11000, N'DDDDDDD', N'A004  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00007', N'Ramanathan', N'Chennai                            ', N'Chennai', N'India', 1, 7000, 11000, 9000, 9000, N'GHRDWSD', N'A010  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00008', N'Karolina', N'Torento                            ', N'Torento', N'Canada', 1, 7000, 7000, 9000, 5000, N'HJKORED', N'A004  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00009', N'Ramesh', N'Mumbai                             ', N'Mumbai', N'India', 3, 8000, 7000, 3000, 12000, N'Phone No', N'A002  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00010', N'Charles', N'Hampshair                          ', N'Hampshair', N'UK', 3, 6000, 4000, 5000, 5000, N'MMMMMMM', N'A009  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00011', N'Sundariya', N'Chennai                            ', N'Chennai', N'India', 3, 7000, 11000, 7000, 11000, N'PPHGRTS', N'A010  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00012', N'Steven', N'San Jose                           ', N'San Jose', N'USA', 1, 5000, 7000, 9000, 3000, N'KRFYGJK', N'A012  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00013', N'Holmes', N'London                             ', N'London', N'UK', 2, 6000, 5000, 7000, 4000, N'BBBBBBB', N'A003  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00014', N'Rangarappa', N'Bangalore                          ', N'Bangalore', N'India', 2, 8000, 11000, 7000, 12000, N'AAAATGF', N'A001  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00015', N'Stuart', N'London                             ', N'London', N'UK', 1, 6000, 8000, 3000, 11000, N'GFSGERS', N'A003  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00016', N'Venkatpati', N'Bangalore                          ', N'Bangalore', N'India', 2, 8000, 11000, 7000, 12000, N'JRTVFDD', N'A007  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00017', N'Srinivas', N'Bangalore                          ', N'Bangalore', N'India', 2, 8000, 4000, 3000, 9000, N'AAAAAAB', N'A007  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00018', N'Fleming', N'Brisban                            ', N'Brisban', N'Australia', 2, 7000, 7000, 9000, 5000, N'NHBGVFC', N'A005  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00019', N'Yearannaidu', N'Chennai                            ', N'Chennai', N'India', 1, 8000, 7000, 7000, 8000, N'ZZZZBFV', N'A010  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00020', N'Albert', N'New York                           ', N'New York', N'USA', 3, 5000, 7000, 6000, 6000, N'BBBBSBB', N'A008  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00021', N'Jacks', N'Brisban                            ', N'Brisban', N'Australia', 1, 7000, 7000, 7000, 7000, N'WERTGDF', N'A005  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00022', N'Avinash', N'Mumbai                             ', N'Mumbai', N'India', 2, 7000, 11000, 9000, 9000, N'113-12345678', N'A002  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00023', N'Karl', N'London                             ', N'London', N'UK', 0, 4000, 6000, 7000, 3000, N'AAAABAA', N'A006  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00024', N'Cook', N'London                             ', N'London', N'UK', 2, 4000, 9000, 7000, 6000, N'FSDDSDF', N'A006  ')
INSERT [dbo].[CUSTOMER] ([CUST_CODE], [CUST_NAME], [CUST_CITY], [WORKING_AREA], [CUST_COUNTRY], [GRADE], [OPENING_AMT], [RECEIVE_AMT], [PAYMENT_AMT], [OUTSTANDING_AMT], [PHONE_NO], [AGENT_CODE]) VALUES (N'C00025', N'Ravindran', N'Bangalore                          ', N'Bangalore', N'India', 2, 5000, 7000, 4000, 8000, N'AVAVAVA', N'A011  ')
GO
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (1341, 2000, 1800, CAST(N'2008-09-25' AS Date), N'C00004', N'A005  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200100, 1000, 600, CAST(N'2008-08-01' AS Date), N'C00013', N'A003  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200101, 3000, 1000, CAST(N'2008-07-15' AS Date), N'C00001', N'A008  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200102, 2000, 300, CAST(N'2008-05-25' AS Date), N'C00012', N'A012  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200103, 1500, 700, CAST(N'2008-05-15' AS Date), N'C00021', N'A005  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200104, 500, 500, CAST(N'2008-03-13' AS Date), N'C00006', N'A004  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200105, 2500, 500, CAST(N'2008-07-18' AS Date), N'C00025', N'A011  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200106, 500, 700, CAST(N'2008-04-20' AS Date), N'C00005', N'A002  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200107, 4500, 900, CAST(N'2008-08-30' AS Date), N'C00007', N'A010  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200108, 4000, 600, CAST(N'2008-02-15' AS Date), N'C00008', N'A004  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200109, 500, 800, CAST(N'2008-07-30' AS Date), N'C00011', N'A010  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200110, 3000, 500, CAST(N'2008-04-15' AS Date), N'C00019', N'A010  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200111, 1000, 300, CAST(N'2008-07-10' AS Date), N'C00020', N'A008  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200112, 2000, 400, CAST(N'2008-05-30' AS Date), N'C00016', N'A007  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200113, 4000, 600, CAST(N'2008-06-10' AS Date), N'C00022', N'A002  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200114, 3500, 2000, CAST(N'2008-08-15' AS Date), N'C00002', N'A008  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200116, 0, 100, CAST(N'2008-07-13' AS Date), N'C00010', N'A009  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200117, 800, 200, CAST(N'2008-10-20' AS Date), N'C00014', N'A001  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200118, 500, 100, CAST(N'2008-07-20' AS Date), N'C00023', N'A006  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200119, 4000, 700, CAST(N'2008-09-16' AS Date), N'C00007', N'A010  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200120, 500, 100, CAST(N'2008-07-20' AS Date), N'C00009', N'A002  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200121, 1500, 600, CAST(N'2008-09-23' AS Date), N'C00008', N'A004  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200122, 2500, 400, CAST(N'2008-09-16' AS Date), N'C00003', N'A004  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200123, 500, 100, CAST(N'2008-09-16' AS Date), N'C00022', N'A002  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200124, 500, 100, CAST(N'2008-06-20' AS Date), N'C00017', N'A007  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200125, 2000, 600, CAST(N'2008-10-10' AS Date), N'C00018', N'A005  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200126, 500, 100, CAST(N'2008-06-24' AS Date), N'C00022', N'A002  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200127, 2500, 400, CAST(N'2008-07-20' AS Date), N'C00015', N'A003  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200128, 3500, 1500, CAST(N'2008-07-20' AS Date), N'C00009', N'A002  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200129, 2500, 500, CAST(N'2008-07-20' AS Date), N'C00024', N'A006  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200130, 2500, 400, CAST(N'2008-07-30' AS Date), N'C00025', N'A011  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200131, 900, 150, CAST(N'2008-08-26' AS Date), N'C00012', N'A012  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200133, 1200, 400, CAST(N'2008-06-29' AS Date), N'C00009', N'A002  ', N'SOD')
INSERT [dbo].[ORDERS] ([ORD_NUM], [ORD_AMOUNT], [ADVANCE_AMOUNT], [ORD_DATE], [CUST_CODE], [AGENT_CODE], [ORD_DESCRIPTION]) VALUES (200135, 2000, 800, CAST(N'2008-09-16' AS Date), N'C00007', N'A010  ', N'SOD')
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD FOREIGN KEY([AGENT_CODE])
REFERENCES [dbo].[AGENTS] ([AGENT_CODE])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([AGENT_CODE])
REFERENCES [dbo].[AGENTS] ([AGENT_CODE])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([CUST_CODE])
REFERENCES [dbo].[CUSTOMER] ([CUST_CODE])
GO
USE [master]
GO
ALTER DATABASE [My_Company] SET  READ_WRITE 
GO