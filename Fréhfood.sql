USE [master]
GO
/****** Object:  Database [FreshFood]    Script Date: 11/7/2021 11:22:27 AM ******/
CREATE DATABASE [FreshFood]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FreshFood', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FreshFood.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FreshFood_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FreshFood_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FreshFood] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FreshFood].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FreshFood] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FreshFood] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FreshFood] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FreshFood] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FreshFood] SET ARITHABORT OFF 
GO
ALTER DATABASE [FreshFood] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FreshFood] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FreshFood] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FreshFood] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FreshFood] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FreshFood] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FreshFood] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FreshFood] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FreshFood] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FreshFood] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FreshFood] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FreshFood] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FreshFood] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FreshFood] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FreshFood] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FreshFood] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FreshFood] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FreshFood] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FreshFood] SET  MULTI_USER 
GO
ALTER DATABASE [FreshFood] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FreshFood] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FreshFood] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FreshFood] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FreshFood] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FreshFood] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FreshFood] SET QUERY_STORE = OFF
GO
USE [FreshFood]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[telephone] [varchar](20) NOT NULL,
	[country] [nvarchar](100) NOT NULL,
	[province] [nvarchar](100) NOT NULL,
	[ward] [nvarchar](100) NULL,
	[mess] [ntext] NULL,
	[shipaddress] [nvarchar](255) NOT NULL,
	[create_time] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cart_item]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cart_item](
	[pro_id] [int] NULL,
	[user_cus_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[category]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[city]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[city](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
	[countryid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[prod_bill]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prod_bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pro_id] [int] NULL,
	[bill_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[img] [varchar](255) NOT NULL,
	[price] [bigint] NOT NULL,
	[category_id] [int] NULL,
	[quantity] [int] NOT NULL,
	[create_time] [date] NOT NULL,
	[extra_img1] [varchar](255) NULL,
	[extra_img2] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_user]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_user](
	[user_cus_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_customer]    Script Date: 11/7/2021 11:22:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_customer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[fullname] [nvarchar](255) NOT NULL,
	[status] [int] NOT NULL,
	[address] [nvarchar](255) NOT NULL,
	[phone] [varchar](255) NOT NULL,
	[province] [varchar](255) NOT NULL,
	[fax] [varchar](255) NULL,
	[city] [nvarchar](255) NULL,
	[countryid] [int] NULL,
	[authprovider] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [fullname], [email], [telephone], [country], [province], [ward], [mess], [shipaddress], [create_time]) VALUES (5, N'fdfdf', N'nguyenhoailinh2207@gmail.com', N'0372983207', N'Việt Nam', N'Hà Nội', N'', N'fdfdfdfdf', N'fdfdfdfdfdfd', CAST(N'2021-11-02T20:54:50.477' AS DateTime))
INSERT [dbo].[bill] ([id], [fullname], [email], [telephone], [country], [province], [ward], [mess], [shipaddress], [create_time]) VALUES (6, N'fdfdf', N'nguyenhoailinh2207@gmail.com', N'0372983207', N'Việt Nam', N'Hà Nội', N'', N'fdfdfdfdf', N'fdfdfdfdfdfd', CAST(N'2021-11-02T20:55:29.073' AS DateTime))
INSERT [dbo].[bill] ([id], [fullname], [email], [telephone], [country], [province], [ward], [mess], [shipaddress], [create_time]) VALUES (7, N'fdfdf', N'nguyenhoailinh2207@gmail.com', N'0372983207', N'Việt Nam', N'Hà Nội', N'', N'fdfdfd', N'fdfdfdfdf', CAST(N'2021-11-02T20:59:23.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[bill] OFF
GO
SET IDENTITY_INSERT [dbo].[cart_item] ON 

INSERT [dbo].[cart_item] ([pro_id], [user_cus_id], [quantity], [id]) VALUES (2031, 1012, 3, 6067)
INSERT [dbo].[cart_item] ([pro_id], [user_cus_id], [quantity], [id]) VALUES (2041, 1013, 3, 6070)
SET IDENTITY_INSERT [dbo].[cart_item] OFF
GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Hải sản nhập khẩu')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Hải sản tươi')
INSERT [dbo].[category] ([id], [name]) VALUES (4, N'Hoa quả nhập khẩu')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'Rau, củ sạch')
INSERT [dbo].[category] ([id], [name]) VALUES (6, N'Thịt tươi')
INSERT [dbo].[category] ([id], [name]) VALUES (7, N'Thực phẩm đông lạnh')
INSERT [dbo].[category] ([id], [name]) VALUES (8, N'Trái cây tươi')
INSERT [dbo].[category] ([id], [name]) VALUES (9, N'Đồ uống')
SET IDENTITY_INSERT [dbo].[category] OFF
GO
SET IDENTITY_INSERT [dbo].[city] ON 

INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (1, N'Hà Nội', 1)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (2, N'Tp Hồ Chí Minh', 1)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (3, N'Thái Nguyên', 1)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (4, N'Bắc Kinh', 2)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (5, N'Thượng Hải', 2)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (6, N'Nam Kinh', 2)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (7, N'Tokyo', 3)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (8, N'Hiroshima', 3)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (9, N'Nagasaki', 3)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (10, N'Bangkok', 4)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (11, N'Phuket', 4)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (12, N'Jurong', 5)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (13, N'Sentosa', 5)
INSERT [dbo].[city] ([id], [name], [countryid]) VALUES (14, N'Tekong', 5)
SET IDENTITY_INSERT [dbo].[city] OFF
GO
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [name]) VALUES (1, N'Việt Nam')
INSERT [dbo].[country] ([id], [name]) VALUES (2, N'Trung Quốc')
INSERT [dbo].[country] ([id], [name]) VALUES (3, N'Nhật Bản')
INSERT [dbo].[country] ([id], [name]) VALUES (4, N'Thái Lan')
INSERT [dbo].[country] ([id], [name]) VALUES (5, N'Singapore')
INSERT [dbo].[country] ([id], [name]) VALUES (6, N'UK')
SET IDENTITY_INSERT [dbo].[country] OFF
GO
SET IDENTITY_INSERT [dbo].[prod_bill] ON 

INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (9, 2030, 5)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (10, 2034, 5)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (11, 2037, 5)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (12, 2041, 5)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (13, 2030, 6)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (14, 2034, 6)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (15, 2037, 6)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (16, 2041, 6)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (17, 2030, 7)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (18, 2034, 7)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (19, 2037, 7)
INSERT [dbo].[prod_bill] ([id], [pro_id], [bill_id]) VALUES (20, 2041, 7)
SET IDENTITY_INSERT [dbo].[prod_bill] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2029, N'Kiwi xanh', N'kiwi-260x200.jpg', 100000, 4, 10, CAST(N'2021-08-01' AS Date), N'kiwi-56x56.jpg', N'kiwi-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2030, N'Cam Mỹ', N'Cam-260x200.jpg', 110000, 4, 10, CAST(N'2021-08-01' AS Date), N'Cam-56x56.jpg', N'Cam-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2031, N'Chuối', N'Chuoi-260x200.jpg', 120000, 4, 10, CAST(N'2021-08-01' AS Date), N'Chuoi-56x56.jpg', N'Chuoi-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2033, N'Chanh vàng', N'chanh-260x200.jpg', 140000, 4, 10, CAST(N'2021-08-01' AS Date), N'chanh-56x56.jpg', N'chanh-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2034, N'Mận Sapa', N'man-260x200.jpg', 150000, 4, 10, CAST(N'2021-08-01' AS Date), N'man-56x56.jpg', N'man-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2035, N'Combo Rau xanh', N'rau-260x200.jpg', 100000, 5, 10, CAST(N'2021-08-01' AS Date), N'rau-56x56.jpg', N'rau-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2036, N'Măng cụt', N'mangc-260x200.jpg', 120000, 5, 10, CAST(N'2021-08-01' AS Date), N'mangc-56x56.jpg', N'mangc-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2037, N'Mâm xôi đen', N'berry-260x200.jpg', 130000, 5, 10, CAST(N'2021-08-01' AS Date), N'berry-56x56.jpg', N'berry-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2038, N'Táo xanh New', N'Taoxanh-260x200.jpg', 140000, 5, 10, CAST(N'2021-08-01' AS Date), N'Taoxanh-56x56.jpg', N'Taoxanh-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2039, N'Nấm', N'Nam-260x200.jpg', 150000, 5, 10, CAST(N'2021-08-01' AS Date), N'rau-56x56.jpg', N'rau-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2040, N'Bơ sáp', N'Bo-260x200.jpg', 100000, 8, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2041, N'Đào', N'Dao-260x200.jpg', 110000, 8, 10, CAST(N'2021-08-01' AS Date), N'Dao-56x56.jpg', N'Dao-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2042, N'Dâu tây', N'Dautay-260x200.jpg', 120000, 8, 10, CAST(N'2021-08-01' AS Date), N'kiwi-56x56.jpg', N'kiwi-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2043, N'Dưa leo', N'Dualeo-260x200.jpg', 130000, 8, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2044, N'Táo đỏ', N'Taodo-260x200.jpg', 140000, 8, 10, CAST(N'2021-08-01' AS Date), N'Taodo-56x56.jpg', N'Taodo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2045, N'Việt quất', N'blueberry-260x200.jpg', 110000, 3, 10, CAST(N'2021-10-19' AS Date), N'berry-56x56.jpg', N'berry-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2046, N'Dâu đen', N'blackberry-260x200.jpg', 120000, 3, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2047, N'Chanh leo', N'Chanhleo-260x200.jpg', 130000, 3, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2048, N'Lê', N'Le-260x200.jpg', 140000, 3, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2049, N'Hành tỏi', N'Hanhtoi-260x200.jpg', 150000, 3, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2050, N'Dâu đỏ', N'redberry-260x200.jpg', 110000, 6, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2051, N'Cà chua', N'Tomato-260x200.jpg', 120000, 6, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2052, N'Cam Mỹ', N'Cam-260x200.jpg', 130000, 6, 10, CAST(N'2021-08-01' AS Date), N'Cam-56x56.jpg', N'Cam-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2053, N'Bơ sáp', N'Bo-260x200.jpg', 140000, 6, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2054, N'Chuối', N'Chuoi-260x200.jpg', 150000, 6, 10, CAST(N'2021-08-01' AS Date), N'Chuoi-56x56.jpg', N'Chuoi-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2055, N'Lê', N'Le-260x200.jpg', 110000, 9, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2056, N'Cà chua', N'Tomato-260x200.jpg', 120000, 9, 10, CAST(N'2021-08-01' AS Date), N'Bo-56x56.jpg', N'Bo-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2057, N'Kiwi xanh', N'kiwi-260x200.jpg', 130000, 9, 10, CAST(N'2021-08-01' AS Date), N'kiwi-56x56.jpg', N'kiwi-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2058, N'Mâm xôi đen', N'berry-260x200.jpg', 140000, 9, 10, CAST(N'2021-08-01' AS Date), N'berry-56x56.jpg', N'berry-335x315.jpg')
INSERT [dbo].[product] ([id], [name], [img], [price], [category_id], [quantity], [create_time], [extra_img1], [extra_img2]) VALUES (2059, N'Táo đỏ', N'Taodo-260x200.jpg', 150000, 9, 10, CAST(N'2021-08-01' AS Date), N'Taodo-56x56.jpg', N'Taodo-335x315.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
INSERT [dbo].[role_user] ([user_cus_id], [role_id]) VALUES (1012, 1)
INSERT [dbo].[role_user] ([user_cus_id], [role_id]) VALUES (1013, 2)
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [name]) VALUES (1, N'ADMIN')
INSERT [dbo].[roles] ([id], [name]) VALUES (2, N'USER')
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[user_customer] ON 

INSERT [dbo].[user_customer] ([id], [email], [password], [fullname], [status], [address], [phone], [province], [fax], [city], [countryid], [authprovider]) VALUES (1012, N'nguyenhoailinh2207@gmail.com', N'$2a$10$qCBy4NL5lDYtQ5JOAqL.dOswS7A50pD351nKqIyCdIvm3bSDi/MAC', N'B19DCCN375-Nguyễn Hoài Linh', 1, N'Nhà số 3', N'0372983207', N'', N'', N'Hà Nội', 1, N'LOCAL')
INSERT [dbo].[user_customer] ([id], [email], [password], [fullname], [status], [address], [phone], [province], [fax], [city], [countryid], [authprovider]) VALUES (1013, N'user123@gmail.com', N'$2a$10$zrUCLBIl38SVBDzHbK5w8OGxnPBV8YY2FlrXeVYz/jcH3GeTM95Ry', N'user', 1, N'abcxyz', N'0123456789', N'', N'', N'Tp Hồ Chí Minh', 1, N'LOCAL')
SET IDENTITY_INSERT [dbo].[user_customer] OFF
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [fk_pro] FOREIGN KEY([pro_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [fk_pro]
GO
ALTER TABLE [dbo].[cart_item]  WITH CHECK ADD  CONSTRAINT [fk_user] FOREIGN KEY([user_cus_id])
REFERENCES [dbo].[user_customer] ([id])
GO
ALTER TABLE [dbo].[cart_item] CHECK CONSTRAINT [fk_user]
GO
ALTER TABLE [dbo].[city]  WITH CHECK ADD  CONSTRAINT [fk_country] FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[city] CHECK CONSTRAINT [fk_country]
GO
ALTER TABLE [dbo].[prod_bill]  WITH CHECK ADD FOREIGN KEY([bill_id])
REFERENCES [dbo].[bill] ([id])
GO
ALTER TABLE [dbo].[prod_bill]  WITH CHECK ADD FOREIGN KEY([pro_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [fk_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [fk_category]
GO
ALTER TABLE [dbo].[role_user]  WITH CHECK ADD  CONSTRAINT [fk_role] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([id])
GO
ALTER TABLE [dbo].[role_user] CHECK CONSTRAINT [fk_role]
GO
ALTER TABLE [dbo].[role_user]  WITH CHECK ADD  CONSTRAINT [fk_user_cus] FOREIGN KEY([user_cus_id])
REFERENCES [dbo].[user_customer] ([id])
GO
ALTER TABLE [dbo].[role_user] CHECK CONSTRAINT [fk_user_cus]
GO
ALTER TABLE [dbo].[user_customer]  WITH CHECK ADD  CONSTRAINT [fk_user_country] FOREIGN KEY([countryid])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[user_customer] CHECK CONSTRAINT [fk_user_country]
GO
USE [master]
GO
ALTER DATABASE [FreshFood] SET  READ_WRITE 
GO
