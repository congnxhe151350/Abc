USE [master]
GO
/****** Object:  Database [XuatNhapHangHoa]    Script Date: 3/10/2022 4:58:54 PM ******/
CREATE DATABASE [XuatNhapHangHoa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'XuatNhapHangHoa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\XuatNhapHangHoa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'XuatNhapHangHoa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\XuatNhapHangHoa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [XuatNhapHangHoa] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [XuatNhapHangHoa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [XuatNhapHangHoa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET ARITHABORT OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [XuatNhapHangHoa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [XuatNhapHangHoa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [XuatNhapHangHoa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [XuatNhapHangHoa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [XuatNhapHangHoa] SET  MULTI_USER 
GO
ALTER DATABASE [XuatNhapHangHoa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [XuatNhapHangHoa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [XuatNhapHangHoa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [XuatNhapHangHoa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [XuatNhapHangHoa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [XuatNhapHangHoa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [XuatNhapHangHoa] SET QUERY_STORE = OFF
GO
USE [XuatNhapHangHoa]
GO
/****** Object:  Table [dbo].[detailsPurchase]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detailsPurchase](
	[detailsPurchaseId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NOT NULL,
	[purchaseId] [int] NULL,
	[quantity] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_detailsPurchase] PRIMARY KEY CLUSTERED 
(
	[detailsPurchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[address] [nvarchar](50) NULL,
	[dateBuy] [nchar](10) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderDetails]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderDetails](
	[orderDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[productId] [int] NULL,
	[price] [decimal](18, 0) NULL,
	[quantity] [int] NULL,
	[status] [int] NULL,
	[orderId] [int] NULL,
 CONSTRAINT [PK_orderDetails] PRIMARY KEY CLUSTERED 
(
	[orderDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NULL,
	[price] [decimal](18, 0) NULL,
	[totalkilos] [int] NULL,
	[imageUrl] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchase]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchase](
	[purchaseId] [int] IDENTITY(1,1) NOT NULL,
	[supplierId] [int] NULL,
	[dateShipping] [datetime] NULL,
	[shippingCost] [decimal](18, 0) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_purchase] PRIMARY KEY CLUSTERED 
(
	[purchaseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[roleId] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplier]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplier](
	[supplierId] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_supplier] PRIMARY KEY CLUSTERED 
(
	[supplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 3/10/2022 4:58:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[fullname] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[phone] [nvarchar](50) NULL,
	[status] [int] NULL,
	[roleId] [int] NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[detailsPurchase]  WITH CHECK ADD  CONSTRAINT [FK_detailsPurchase_purchase] FOREIGN KEY([purchaseId])
REFERENCES [dbo].[purchase] ([purchaseId])
GO
ALTER TABLE [dbo].[detailsPurchase] CHECK CONSTRAINT [FK_detailsPurchase_purchase]
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD  CONSTRAINT [FK_customer_role] FOREIGN KEY([roleId])
REFERENCES [dbo].[role] ([roleId])
GO
ALTER TABLE [dbo].[user] CHECK CONSTRAINT [FK_customer_role]
GO
USE [master]
GO
ALTER DATABASE [XuatNhapHangHoa] SET  READ_WRITE 
GO
