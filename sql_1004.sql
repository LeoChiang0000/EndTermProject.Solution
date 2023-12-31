USE [master]
GO
/****** Object:  Database [FDB10]    Script Date: 2023/10/4 下午 01:14:05 ******/
CREATE DATABASE [FDB10]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FDB10', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\FDB10.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FDB10_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQL2022\MSSQL\DATA\FDB10_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [FDB10] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FDB10].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FDB10] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FDB10] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FDB10] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FDB10] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FDB10] SET ARITHABORT OFF 
GO
ALTER DATABASE [FDB10] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FDB10] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FDB10] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FDB10] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FDB10] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FDB10] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FDB10] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FDB10] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FDB10] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FDB10] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FDB10] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FDB10] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FDB10] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FDB10] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FDB10] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FDB10] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FDB10] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FDB10] SET RECOVERY FULL 
GO
ALTER DATABASE [FDB10] SET  MULTI_USER 
GO
ALTER DATABASE [FDB10] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FDB10] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FDB10] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FDB10] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FDB10] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FDB10] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FDB10', N'ON'
GO
ALTER DATABASE [FDB10] SET QUERY_STORE = ON
GO
ALTER DATABASE [FDB10] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [FDB10]
GO
/****** Object:  User [sa5]    Script Date: 2023/10/4 下午 01:14:05 ******/
CREATE USER [sa5] FOR LOGIN [sa5] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sa5]
GO
/****** Object:  Table [dbo].[BannerCarousel]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BannerCarousel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Headline] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatTime] [datetime] NOT NULL,
	[Image] [nvarchar](50) NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_BannerCarousel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Capacities]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Capacities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Capacities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItems]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_CartItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carts]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberAccount] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Shippings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_MainCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[District] [nvarchar](50) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Districts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQs]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SecondaryCategoriesId] [int] NOT NULL,
	[Question] [nvarchar](3000) NOT NULL,
	[Answer] [nvarchar](3000) NOT NULL,
 CONSTRAINT [PK_FQAs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
 CONSTRAINT [PK_MemberFavorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Telephone] [nvarchar](10) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[Gender] [bit] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[IsConfirmed] [bit] NULL,
	[ConfirmCode] [nvarchar](100) NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](500) NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notes]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Notes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[ProductName] [nvarchar](50) NOT NULL,
	[ProductPrice] [int] NOT NULL,
 CONSTRAINT [PK_ProductItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[PaytypeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[DistrictsId] [int] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Receiver] [nvarchar](50) NULL,
	[TelePhone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Paytypes]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Paytypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Paytype] [nvarchar](10) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_OrderPaytype] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[FileName] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[BrandId] [int] NOT NULL,
	[CapacityId] [int] NOT NULL,
	[SecondaryCategoryId] [int] NOT NULL,
	[NoteId] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Method] [nvarchar](500) NULL,
	[Ingredient] [nvarchar](500) NULL,
	[Image] [nvarchar](500) NULL,
	[Stock] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondaryCategories]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondaryCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_SecondaryCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TextCarousel]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TextCarousel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[CreatTime] [datetime] NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_TextCarousel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](250) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BannerCarousel] ON 

INSERT [dbo].[BannerCarousel] ([Id], [Headline], [Description], [CreatTime], [Image], [Enabled]) VALUES (2, N'淋浴你的身心靈', N'您的心情由我來守護', CAST(N'2023-07-29T09:25:16.887' AS DateTime), N'輪播-1.jpg', 1)
INSERT [dbo].[BannerCarousel] ([Id], [Headline], [Description], [CreatTime], [Image], [Enabled]) VALUES (3, N'營造香氛聖地', N'香氛蠟燭，治癒你的身心靈', CAST(N'2023-09-10T10:25:36.207' AS DateTime), N'輪播-2.jpg', 1)
INSERT [dbo].[BannerCarousel] ([Id], [Headline], [Description], [CreatTime], [Image], [Enabled]) VALUES (7, N'燃起香氛蠟燭，沉浸幸福氛圍', N'感受全新草莓芬芳。以清新明亮的香檸檬、粉紅胡椒帶來亮眼的驚喜感受全新草莓芬芳', CAST(N'2023-09-29T20:26:26.307' AS DateTime), N'輪播-3.jpg', 1)
INSERT [dbo].[BannerCarousel] ([Id], [Headline], [Description], [CreatTime], [Image], [Enabled]) VALUES (23, N'英國薰衣草、甜羅勒及茉莉', N'聞起來純淨，加上甜羅勒和美麗茉莉，調製一款如天堂般放鬆的配方', CAST(N'2023-10-03T11:31:06.880' AS DateTime), N'輪播-4.jpg', 1)
INSERT [dbo].[BannerCarousel] ([Id], [Headline], [Description], [CreatTime], [Image], [Enabled]) VALUES (24, N'翩然綻放美麗光芒，天然清甜的英國薰衣草香', N'甜羅勒和美麗茉莉，19 種天然精油調製一款如天堂般放鬆的配方', CAST(N'2023-10-03T11:48:08.817' AS DateTime), N'輪播-5.jpg', 0)
SET IDENTITY_INSERT [dbo].[BannerCarousel] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Enabled], [Description], [Image]) VALUES (1, N'Maison Louis Marie', 10, 1, N'Maison Louis Marie源於1792年的傳奇香氛品牌。創始人Louis Marie在馬達加斯加研究了2000多種植物。200年後，其後裔Marie，受家族歷史啟發，創立此品牌。他們強調"Clean Beauty"原則，不使用有毒成分、避免動物測試，且深入注重環保包裝。此外，品牌積極支持"1% For the Planet"，與機構合作種植樹木，致力於環境的永續保護。', N'mlmbanner.jpg')
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Enabled], [Description], [Image]) VALUES (2, N'Diptyque', 20, 1, NULL, NULL)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Enabled], [Description], [Image]) VALUES (3, N'kerzon', 30, 1, NULL, NULL)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Enabled], [Description], [Image]) VALUES (4, N'MALIN+GOETZ', 40, 1, NULL, NULL)
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Enabled], [Description], [Image]) VALUES (6, N'NEOM', 50, 1, N'英國皇室御用品牌Neom，以頂級有機精油打造，不僅帶來芳香療法功能，更追求生活中的身心平衡。當都市生活與物質飽和，品牌呼籲回歸簡單、純粹。創始人Nicola Elliott，擁有對美事物的熱情，經歷時尚雜誌編輯，最後選擇將專業轉向芳療，並打造這時尚且友善環境的品牌。產品強調100%純天然成分、手工製造，並依照芳療效果設計不同系列。持續注重永續採收、道德採購，並堅守英國製造的傳統與品質。', N'neombanner.jpg')
INSERT [dbo].[Brands] ([Id], [Name], [DisplayOrder], [Enabled], [Description], [Image]) VALUES (7, N'bamford', 60, 1, N'英國貴族Carole Bamford女爵所創的Bamford，象徵奢華優雅、天然有機的生活風格，堅守天然植物萃取，以高品質、精緻的香氛和恆久純淨的沐浴、身體及寶寶保養品，呈現英國貴族的有機生活。品牌注重細節、品質，其產品完全在英國製造，無添加有害成分，真誠提供頂級的保養選擇。Carole女爵更於2002年成立Daylesford Organic，推廣有機文化，並於4年後開創Bamford，延伸有機至生活風格及時尚領域，珍惜自然資源，為真正的奢華。', N'bamfordbanner.jpg')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Capacities] ON 

INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (1, N'50ml', 10)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (2, N'75ml', 20)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (3, N'100ml', 30)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (4, N'150ml', 40)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (5, N'190ml', 50)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (6, N'200ml', 60)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (7, N'240ml', 70)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (8, N'250ml', 80)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (9, N'300ml', 90)
INSERT [dbo].[Capacities] ([Id], [Name], [DisplayOrder]) VALUES (10, N'420ml', 100)
SET IDENTITY_INSERT [dbo].[Capacities] OFF
GO
SET IDENTITY_INSERT [dbo].[CartItems] ON 

INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Qty]) VALUES (19, 11, 43, 2)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Qty]) VALUES (20, 11, 129, 4)
INSERT [dbo].[CartItems] ([Id], [CartId], [ProductId], [Qty]) VALUES (21, 11, 128, 2)
SET IDENTITY_INSERT [dbo].[CartItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Carts] ON 

INSERT [dbo].[Carts] ([Id], [MemberAccount]) VALUES (11, N'allen')
SET IDENTITY_INSERT [dbo].[Carts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [Enabled]) VALUES (1, N'香氛', 10, 1)
INSERT [dbo].[Categories] ([Id], [Name], [DisplayOrder], [Enabled]) VALUES (2, N'身體', 20, 1)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 

INSERT [dbo].[Cities] ([Id], [Name], [DisplayOrder]) VALUES (2, N'臺北市', 10)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayOrder]) VALUES (3, N'新北市', 20)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayOrder]) VALUES (5, N'台中市', 30)
INSERT [dbo].[Cities] ([Id], [Name], [DisplayOrder]) VALUES (6, N'高雄市', 40)
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (2, 2, N'中正區', 10)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (4, 2, N'大同區', 20)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (5, 2, N'中山區', 30)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (6, 2, N'松山區', 40)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (7, 3, N'蘆洲區', 50)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (8, 3, N'三重區', 60)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (9, 3, N'新莊區', 70)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (11, 5, N'北區', 80)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (12, 5, N'清水區', 90)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (13, 5, N'大肚區', 100)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (14, 6, N'左營區', 110)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (15, 6, N'鳳山區', 120)
INSERT [dbo].[Districts] ([Id], [CityId], [District], [DisplayOrder]) VALUES (16, 6, N'小港區', 130)
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
SET IDENTITY_INSERT [dbo].[FAQs] ON 

INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (1, 1, N'什麼是淡香水？', N'淡香水（Eau de Toilette）是一種香水分類，具有較輕盈的香氣，通常含有較低濃度的香精成分。它的香味相對持久度較短，適合日常使用。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (2, 1, N'淡香水和其他香水之間有什麼不同？', N'淡香水的香精濃度相對較低，通常在5-15%之間，這使得它的香味較輕盈，適合在日常情況下使用。相比之下，香水（Perfume）的香精濃度較高，通常在15-30%之間，因此其香味較持久，使用較少的量即可。另外，極致香水（Parfum）的香精濃度最高，可以超過30%，香味持久性最長。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (3, 1, N'如何正確使用淡香水？', N'使用淡香水時，可以在潔凈的皮膚上輕輕噴灑。常見的應用部位包括腕部、耳後、頸部和肘彎處。避免過量使用，以免香味過於濃重。根據個人的體味和喜好，可以適當調整使用的量。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (4, 1, N'淡香水是否適用於敏感肌膚？', N'淡香水通常較為溫和，但某些敏感肌膚可能對其中的成分產生過敏反應。在使用之前，最好進行皮膚敏感測試，將少量香水塗抹在手腕內側，觀察是否有不適反應。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (5, 1, N'淡香水的保存方法是什麼？', N'淡香水的保存方法是什麼？')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (6, 1, N'淡香水可以與其他香水層疊使用嗎？', N'是的，您可以層疊淡香水與其他香水，以創造獨特的香味組合。然而，選擇層疊的香水時應該注意它們的調性是否相容，以免混合後的香味變得不協調。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (7, 1, N'淡香水適合哪些場合使用？', N'淡香水適合用於日常活動和輕鬆的場合，例如上班、社交聚會、日常外出等。由於它的香味相對輕盈，適合在近距離接觸下使用。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (8, 3, N'什麼是香氛蠟燭？', N'香氛蠟燭是蠟燭的一種，它在燃燒時不僅釋放光和熱，還釋放出特定的香味。這些香味可以來自添加的香料、精油或香精，為室內創造出愉悅的氛圍。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (9, 3, N'香氛蠟燭的香味是如何產生的？', N'香氛蠟燭的香味是通過在蠟中添加香料、精油或香精來產生的。在蠟燃燒時，蠟和添加物一起揮發，將香味散發到空氣中，為室內營造出特定的氛圍。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (10, 3, N'香氛蠟燭的香味可以有多種選擇？', N'是的，香氛蠟燭的香味可以非常多樣，包括花香、果香、木香、辛辣香等。不同的蠟燭可能採用不同的香味組合，以滿足不同人群的喜好。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (11, 3, N'如何選擇適合的香氛蠟燭？', N'選擇適合的香氛蠟燭取決於個人喜好和使用目的。如果您喜歡花香，可以選擇玫瑰、薰衣草等香味；如果喜歡清新感，可以選擇柑橘類的香味。最好在購買之前可以嗅聞一下香味，確保它符合您的喜好。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (12, 3, N'香氛蠟燭的香味持續多長時間？', N'香氛蠟燭的香味持久度取決於蠟的質量、添加的香料濃度以及燃燒的時間。通常情況下，蠟燃燒時會逐漸釋放香味，而且較大的房間可能需要更多的香氛蠟燭才能充分散發香味。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (13, 3, N'使用香氛蠟燭需要注意什麼安全事項？', N'使用香氛蠟燭時，應遵循蠟燭的一般使用安全建議，如將蠟燭放置在穩固的表面上、遠離易燃物品，不要讓蠟燭無人看管等。另外，也要確保燃燒的地方有足夠的通風，以防止煙霧積聚。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (14, 3, N'香氛蠟燭是否對人體健康有影響？', N'一般情況下，高品質的香氛蠟燭在正常使用下不會對大多數人造成健康影響。然而，一些低質量的蠟燭可能含有有害的揮發性有機化合物，燃燒時可能釋放出有害物質。選擇高質量的蠟燭，最好是使用天然成分的蠟燭，可以減少潛在的風險。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (15, 3, N'香氛蠟燭可以用於哪些場合？', N'香氛蠟燭可以用於各種場合，如浪漫的晚餐、放鬆的氛圍、節日慶祝、冥想或瑜伽時等。不同的香味可以為不同場合營造出適合的氛圍。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (16, 4, N'什麼是擴香產品？', N'擴香產品是一類用於室內環境中散發香味的產品，通常通過不同的方法將香味散播到空氣中，以創造愉悅的氛圍。這些方法包括使用蠟燭、插座式擴香器、香薰機、花卉等。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (17, 4, N'擴香產品有哪些種類？', N'擴香產品的種類多種多樣，包括香薰蠟燭、插座式擴香器、香薰機、香薰油、花卉和熏香等。每種產品都有不同的使用方式和效果。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (18, 4, N'擴香產品有什麼好處？', N'擴香產品可以改善室內環境的氛圍，為空氣添加愉悅的香味。不同的香味可以帶來不同的效果，如放鬆、提神、舒緩壓力等。此外，一些香味也被認為具有改善空氣質量和情緒的功效。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (19, 4, N'擴香產品的香味持續多久？', N'擴香產品的香味持久度取決於產品的種類、品質、使用的香薰油濃度以及使用的方法。香薰蠟燭的香味可能在燃燒時持續數小時，香薰機則根據容器的大小和設定可以持續數小時至數日。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (20, 4, N'擴香產品的香味是否對人體安全？', N'大多數高質量的擴香產品在正常使用下對人體是安全的。然而，一些低質量或含有有害成分的產品可能對敏感人士造成不適或過敏反應。在選擇產品時，最好選擇經過測試且質量可靠的品牌，並遵循使用說明。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (22, 4, N'擴香產品是否可以改善室內空氣質量？', N'一些香薰油中含有的天然成分，如精油，被認為具有一些改善室內空氣質量的潛在效果，如抗菌、抗炎症等。然而，這些效果可能有限，且不同的產品和香味可能產生不同的影響。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (23, 4, N'擴香產品的使用頻率應該是多久一次？', N'使用頻率取決於個人喜好和產品的種類。一般來說，每天使用數小時可能是一個適中的使用頻率。然而，您可以根據需要和環境來調整使用的頻率。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (24, 4, N'擴香產品可以用於哪些場合？', N'擴香產品可以用於各種場合，包括家庭、辦公室、商店、沙龍、瑜伽室等。不同的香味可以為不同場合營造出適合的氛圍。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (25, 5, N'什麼是護手霜？', N'護手霜是一種用於保護和滋潤手部皮膚的護膚產品。它通常具有潤膚成分，如油脂、蠟和水，可以幫助滋潤乾燥、粗糙或受損的手部皮膚。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (26, 5, N'為什麼需要使用護手霜？', N'手部皮膚暴露在外界環境中，容易受到日曬、風乾、水份損失等的影響，導致皮膚變得乾燥、粗糙甚至龜裂。護手霜可以提供水分和保濕，幫助維持手部皮膚的柔軟和健康。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (27, 5, N'什麼時候應該使用護手霜？', N'最好在每次洗手後或手部皮膚感到乾燥時使用護手霜。洗手可能會去除皮膚的天然油脂，因此使用護手霜可以恢復水分並鎖住滋潤。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (28, 5, N'護手霜的成分有哪些？', N'護手霜的成分可以多種多樣，但通常包括潤膚成分（如甘油、油脂和蠟）、保濕劑、維生素、抗氧化劑等。某些護手霜也可能添加香料、精油或其他特定成分，以賦予產品香味或特定功能。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (29, 5, N'護手霜是否適用於所有人？', N'大多數人可以使用護手霜，但敏感皮膚或特定皮膚條件（如濕疹）的人可能需要選擇特殊配方的護手霜。如果您對某些成分敏感或有過敏反應，最好事先進行皮膚測試。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (30, 5, N'護手霜是否可以用於其他部位？', N'雖然護手霜主要設計用於手部皮膚，但有時也可以用於身體的其他乾燥部位，如肘部、膝蓋等。然而，某些護手霜可能相對較油膩，可能不適合在某些部位使用。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (31, 5, N'護手霜的保存方法是什麼？', N'護手霜應該存放在乾燥、陰涼的地方，遠離陽光直射。緊緊封閉產品的蓋子，以防止水分和空氣進入，從而保持護手霜的質地和效果。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (32, 5, N'護手霜是否需要經常使用？', N'使用頻率取決於您的手部皮膚狀況和個人需求。如果您的手部皮膚容易乾燥，最好在需要時進行定期使用。通常來說，每天使用幾次可能是適當的，特別是在洗手後。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (33, 7, N'什麼是乳液和乳霜？', N'乳液和乳霜都是護膚品，用於保濕和滋潤皮膚。乳液通常比較輕薄，質地較稀，適合中性至油性皮膚。乳霜則比較濃稠，含有更多的潤膚成分，適合較乾燥的皮膚。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (34, 7, N'乳液和乳霜的主要成分是什麼？', N'乳液和乳霜的成分包括水、油脂、潤膚劑、保濕劑等。乳液可能含有較多水分和較少的油脂，而乳霜則可能含有較多油脂和潤膚成分，以提供更多的滋潤。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (35, 7, N'什麼樣的皮膚適合使用乳液？', N'乳液適合中性至油性皮膚，特別是在溫暖的季節或潮濕的環境中。這種質地的產品可以提供足夠的保濕，同時不會過於油膩。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (36, 7, N'什麼樣的皮膚適合使用乳霜？', N'乳霜適合較乾燥或敏感的皮膚，需要更多滋潤和保護的人。它的濃稠質地有助於在皮膚表面形成保護屏障，防止水分流失。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (37, 7, N'乳液和乳霜可以用於哪些部位？', N'乳液和乳霜通常可以用於身體和面部皮膚。然而，面部皮膚可能對質地較為輕盈的乳液有不同的需求，而較乾燥的皮膚可能需要較滋潤的乳霜。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (38, 7, N'乳液和乳霜有什麼不同？', N'乳液和乳霜的主要區別在於其質地和滋潤度。乳液質地較輕薄，吸收迅速，適合較油膩的皮膚；乳霜質地較濃稠，含有較多的潤膚成分，適合較乾燥的皮膚。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (39, 7, N'乳液和乳霜的使用方法是什麼？', N'使用乳液或乳霜時，取適量產品在手掌中，然後均勻塗抹在皮膚上，輕輕按摩以幫助吸收。可以根據自己的需求調整使用的量。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (40, 7, N'乳液和乳霜是否可以同時使用？', N'是的，有些人可能同時使用乳液和乳霜。通常情況下，先使用較薄的乳液，然後再在需要的部位使用較厚的乳霜。這樣可以在不同的皮膚區域提供適當的保濕和滋潤。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (41, 7, N'乳液和乳霜的保存方法是什麼？', N'乳液和乳霜通常應該存放在陰涼、乾燥的地方，遠離陽光直射。瓶蓋應該緊緊封閉，以防止空氣和細菌進入，影響產品的質量。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (42, 8, N'什麼是沐浴清潔產品？', N'沐浴清潔產品是用於清潔身體的護膚產品，通常以液體、凝膠、露狀等形式存在。它們含有清潔劑、潤膚劑和其他成分，用於去除皮膚上的污垢、汗水和油脂，同時保持皮膚的水分平衡。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (43, 8, N'如何選擇適合的沐浴清潔產品？', N'選擇沐浴清潔產品時，可以考慮您的皮膚類型、需求和個人喜好。如果您有乾燥的皮膚，可以選擇含有潤膚成分的產品。對於敏感皮膚，可以選擇不含強刺激劑的溫和配方。此外，香味也是一個考慮因素，選擇您喜歡的香味。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (44, 8, N'如何正確使用沐浴清潔產品？', N'使用沐浴清潔產品時，可以將適量產品倒在濕的手掌或濕的浴球上，然後在濕潤的皮膚上輕輕按摩。注意避免將產品進入眼睛或口中。使用後，用清水沖洗乾淨。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (45, 8, N'沐浴清潔產品是否適合每天使用？', N'沐浴清潔產品通常可以每天使用，但使用的頻率也取決於您的皮膚狀況和個人需求。如果您的皮膚容易乾燥，可以選擇溫和的潤膚型產品，並適當控制每天的使用次數。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (46, 8, N'使用沐浴清潔產品是否會影響皮膚的水分平衡？', N'高質量的沐浴清潔產品通常包含潤膚劑，可以幫助保持皮膚的水分平衡。然而，一些含有強刺激性成分的產品可能導致皮膚變乾燥。選擇含有潤膚成分且溫和的產品，有助於維持皮膚的水分。')
INSERT [dbo].[FAQs] ([Id], [SecondaryCategoriesId], [Question], [Answer]) VALUES (47, 8, N'使用沐浴清潔產品需要注意哪些安全事項？', N'在使用沐浴清潔產品時，避免將產品接觸眼睛或口中，以免引起不適。如果您的皮膚對某些成分過敏，建議事先進行皮膚測試。同時，確保使用的水溫適中，避免過熱的水對皮膚造成刺激。')
SET IDENTITY_INSERT [dbo].[FAQs] OFF
GO
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (31, N'allen', N'657F090D9FAD71EF86B94FB7751ED12E57F4080F264734A66D77F12F06D626AE', N'allen Kuo', N'allenKuo@gmail.com', N'0935447891', CAST(N'1992-06-04' AS Date), 1, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (32, N'Weiber', N'C6E3DF31840BD1BF0DE67DE2FE3F436B26DED398F9710A8B005CE0B1F54EF957', N'黃柏崴', N'rajaboris60101@gmail.com', N'0925075387', CAST(N'1993-09-02' AS Date), 1, 1, 1, NULL)
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (33, N'Leo', N'3E4E80396CAEC80FA0B45169D62C513B3B2E7F9134D959FD6F4A222A69952D53', N'江孟霖', N'Leo@gmail.com', N'0975859415', CAST(N'1997-01-19' AS Date), 1, 0, 1, N'4facdc2b86464892b6889bc4578926d0')
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (34, N'Kai', N'DD087795D54BE15C1355AA2BD7EF797F40ECB00A885BAE2B8D1F0E796F4B34AD', N'葉家愷', N'Kai@gmail.com', N'0915459875', CAST(N'1995-10-11' AS Date), 1, 1, 1, N'9afe8218408d46cca9345d49442bfd23')
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (35, N'Steven', N'C525BB784B1671507718DE61ED4E65B339B228B74392605DB17FCB9825D37D4C', N'陳冠華', N'Steven@gmail.com', N'0945123587', CAST(N'1995-01-19' AS Date), 1, 0, 0, N'afa968a6b36746388e0ec6e037d03ffc')
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (36, N'Wenny', N'B26246087C18B68D7BAFF00F02A11197EA22AB970A7C46CAECBDB59E1CE4A5F5', N'簡筱芸', N'Wenny@gmail.com', N'0935154578', CAST(N'1998-04-15' AS Date), 0, 0, 0, N'069f415ec2ed4719847868654e1af518')
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (37, N'Cindy', N'07A80841281F9548E67E2099879441D0FBF2FFCF8510317AFFEA47458F0526CB', N'林欣瑩', N'Cindy@gmail.com', N'0975158584', CAST(N'1994-09-07' AS Date), 0, 0, 0, N'976dcf3673d34ee5833dd64b444972e7')
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (38, N'Boris', N'C329AC6A17291896BB9E080C60264A10351B41E137F4FEEB2EE04DD4AD47DD49', N'HuangBo', N'Boris@yahoo.com.tw', N'0915754545', CAST(N'1993-01-07' AS Date), 1, 0, 0, N'3b189594b46a476ea3aaa8fc2421090a')
INSERT [dbo].[Members] ([Id], [Account], [Password], [Name], [Email], [Telephone], [DateofBirth], [Gender], [Enabled], [IsConfirmed], [ConfirmCode]) VALUES (39, N'Annie', N'B99CA60C43481275E7A6798A77EE4C7010A34CCE392B77ED32026C9127B64600', N'AnnieChen', N'Annie@gmail.com', N'0975454541', CAST(N'2006-10-05' AS Date), 0, 0, 0, N'fdf45ca70517417f88e43222b5acf0f7')
SET IDENTITY_INSERT [dbo].[Members] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (1, N'春季', N'在大自然的輪迴中，春季是一個充滿希望和新生的季節。隨著冬季的寒冷逐漸退卻，大地開始散發出溫暖的氣息，樹木綠葉嫩芽冒出，花朵綻放，所有的生命都在這個季節重新焕發。而在這樣的美好時光裡，香氛也扮演著不可或缺的角色，將春季的情感和氛圍瓶裝成永恆。

春季香氛如何編織出這個季節的獨特韻味呢？首先，清新是春季香氛的主旋律。它們常常帶有輕盈的果香和花香，如清晨的露水，如初綻的花苞，如微風吹過的樹葉。柑橘、青蘋果、草莓等明亮的頂部調讓人聯想到溫暖的陽光和活力四射的生命力。

花朵在春季中扮演著重要的角色，因此花香的成分成為了春季香氛的焦點。玫瑰、茉莉、櫻花、杏花等花朵的香氣，仿佛將春天的芬芳壓縮在一瓶香水中。花香不僅帶來愉悅的感受，還能讓人感受到春季的浪漫與優雅。

此外，春季的香氛也常常加入一些木質或綠葉的成分，以增添層次感和平衡。新鮮的青草、樹葉的香氣，能夠讓人聯想到春日裡大自然的生氣和青翠。

最後，春季的香氛也可以是某種情感的寫照。它們可能是對春天希望、喜悅和愛情的表達，也可以是對過去冬季的告別和新一輪生命的歡迎。這些情感在香氛中得到了凝縮和昇華，讓我們能夠透過香味的記憶，重溫春天的美好。

總的來說，春季的香氛就像是大自然的詩歌，將季節的變遷和情感的流轉以獨特的方式表達出來。無論是清新的果香、綻放的花朵，還是溫暖的木質調，它們都在香氛的世界中串聯著一幅幅春天的風景，讓我們感受到大自然的美妙和生命的奇跡。讓我們在春季的每一天，透過香氛，與大自然共鳴，感受生命的律動。', N'最新消息1.png', CAST(N'2023-03-05T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (2, N'夏季', N'夏天，是一個充滿活力和熱情的季節。隨著陽光的灑落，大自然在夏日中迎來了生機勃勃的景象，而香氛也成為了映射夏季情感的完美媒介。在這個炎炎夏日，香氛將我們帶入了一場感官的奇妙之旅，讓我們感受到夏天的芬芳和浪漫。

夏季的香氛通常以輕爽的調性為主，猶如清晨的第一道曙光。柑橘、檸檬、葡萄柚等果香成分，能夠迅速喚醒我們的感官，帶來清新的愉悅。這些頂部調的香氛彷彿在皮膚上留下一抹清涼的觸感，舒適而愉快。

花香在夏季的香氛中也有著重要的地位。茉莉、玫瑰、椰子等花香的成分，仿佛在微風中輕輕搖曳，散發出迷人的芬芳。這些花香不僅賦予香氛女性化的優雅，也能夠在炎炎夏日中帶來一絲清涼感。

夏季的香氛也可能融合了一些木質或綠葉的成分，以平衡清新的頂部和花香的中間調。這些成分賦予香氛更多的層次感和深度，讓香氣在夏天的熱情中更具充實感。

此外，夏季的香氛也是一種情感的表達。它們可能帶來對海洋的渴望、對度假的向往，或是對夏日浪漫的追求。這些情感在香氛中得到了具象化，讓我們能夠透過香味來重新感受夏天的活力和浪漫。

總的來說，夏日的香氛是夏季情感的寫照，將炎炎夏日的芬芳和浪漫凝縮在每一瓶中。無論是清新的果香、迷人的花香，還是淡淡的木質調，它們都能夠在夏日中為我們創造出美妙的感官體驗。讓我們在夏日的每一天，用香氛來點亮心靈，感受大自然的生機和夏天的浪漫。', N'最新消息2.png', CAST(N'2023-06-04T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (3, N'秋季', N'隨著夏季的溫暖逐漸褪去，秋天悄然而至，帶來了金色的葉子和涼爽的微風。在這個換季的時節，大自然的色彩和氛圍也隨之而變，而香氛則成為了映射秋季情感的神奇工具。秋天的香氛，如同一場香氛之旅，將我們引領進入了一個充滿深情和感性的季節。

秋季的香氛通常以溫暖而深厚的調性為主，它們彷彿是秋天的一種獨特詮釋。溫暖的香料調如肉桂、丁香、茴香等，猶如秋日的陽光，帶來一絲絲溫暖和舒適。這些香料能夠讓人聯想到溫暖的家，舒適的毛衣，讓秋天的陰晴不定中充滿穩定感。

木質的香氛也是秋季香水的常見元素，它們能夠為香氛賦予更多的層次感。檀木、香柏等木質成分，在香氛中營造出一種穩重而優雅的氛圍，彷彿秋天的樹葉在風中輕輕搖曳。

此外，秋季的花香也十分迷人，如茉莉、玫瑰、雪松花等，散發出深情和高貴。這些花香的香氣在秋風中變得更加濃烈，仿佛在傳遞著大自然的情感。

秋季的香氛也能夠唤起我們對於季節的獨特感受。它們可能讓人聯想到金色的葉子在空中飄舞，或是在傍晚微風中的散步。每一瓶香氛都是對秋天的情感詮釋，讓我們能夠透過香味重溫這個特殊的季節。

總的來說，秋季的香氛是對於秋天情感的詩意寫照，將深情、溫暖和感性融合在每一瓶中。無論是溫暖的香料、深厚的木質調，還是迷人的花香，它們都能夠在秋天的氛圍中為我們創造出獨特的香氛體驗。讓我們在秋天的每一刻，用香氛來感受大自然的美麗和秋日的深情。', N'最新消息3.png', CAST(N'2023-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (4, N'冬季', N'隨著秋季的褪去，冬天的腳步輕輕走來，帶來了寒冷和雪花的飄舞。在這個寒冷的季節，大自然似乎進入了一段靜謐的冬眠，而香氛卻在這寂靜中迸發出獨特的活力。冬季的香氛，宛如一場香氛的奇妙旅程，將我們帶入一個充滿溫暖和寧靜的世界。

冬季的香氛常常以溫暖的調性為主，猶如一杯熱茶在寒風中升華。香料如肉桂、香草、薑等成分，散發出濃烈的香氣，帶來溫暖和舒適。這些香氛彷彿在寒冷的季節中為我們點燃了一盞明亮的燈，照亮了冬日的黑暗。

木質和樹脂的香氛在冬天中也格外受歡迎，它們能夠為香氛帶來一絲絲的深度和穩重感。檀木、松脂等成分，在香氛中營造出一種寧靜而充實的氛圍，仿佛是一個冬日的故事。

此外，冬季的香氛也可能融合了一些獨特的元素，如皮革、煙草等，帶來一份從容和俐落。這些特殊的香氣能夠在寒冷的季節中為我們注入一份獨特的風采。

冬季的香氛也能夠喚起我們對於季節的獨特記憶。它們可能讓人聯想到潔白的雪地，或是聖誕節的溫馨氛圍。每一瓶香氛都是對冬季情感的一種表達，讓我們透過香味回味冬季的美好。

總的來說，冬季的香氛是對寒冷季節的詩意寫照，將溫暖、寧靜和從容凝縮在每一瓶中。無論是溫暖的香料、深邃的木質調，還是獨特的元素，它們都能夠在冬日的寒風中為我們帶來一絲溫暖和安慰。讓我們在冬季的每一刻，用香氛來感受大自然的寧靜和冬日的溫暖。', N'最新消息4.png', CAST(N'2023-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (5, N'春季', N'香水，是一種獨特的魔法，能夠將情感和記憶凝縮在一瓶香氛之中。而在這個繁忙的現代社會裡，淡香水成為了一種愛用的選擇，它輕盈的香氣猶如微風拂過，為每個瞬間注入了一份優雅和自在。

淡香水以其輕盈的香氛而著名，猶如清晨的第一道曙光。它們選用的香調通常是清新的果香、花香，或是微妙的綠葉調。這些香氣仿佛在皮膚上留下一抹淡淡的痕跡，不強烈卻令人難以忘懷。

淡香水的質地輕柔，不會給人沉重的感覺，也不會過於濃郁。它們迅速融入皮膚，透過微細的分子在空氣中傳播，為周圍環境帶來一份淡雅的氛圍。這種輕盈的感覺使淡香水成為日常生活中的理想選擇，無論是上班、約會還是閒暇時光。

淡香水的香氣是溫和的，適合各種場合使用。它們不會過於張揚，而是散發出一種優雅和自信。每一款淡香水都是一種個人風格的展現，能夠在不同的情境中表現出你的獨特魅力。

淡香水的持久度相對較短，這也是其輕盈特點的體現。這使得你能夠根據自己的心情和需要，在一天中的不同時間重新為自己注入一份香氛的能量。

總的來說，淡香水是一種充滿優雅和自在的香氛選擇，它輕盈的質地和溫和的香氣，讓我們在忙碌的生活中獲得片刻的寧靜和愉悅。每一瓶淡香水都像是一首輕柔的旋律，在風中輕輕飄揚，為我們的人生增添了一份繽紛的優雅。', N'最新消息5.png', CAST(N'2023-03-04T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (6, N'春季', N'在這個充滿繁忙和壓力的現代生活中，我們常常渴望能夠找到一個片刻的寧靜和放鬆。而香氛蠟燭，便成為了一種獨特的方式，通過融合光影和香氣，燃點我們內心的寧靜，為空間帶來溫馨的香氛之旅。

香氛蠟燭的魅力首先來自於它們所散發出的香氣。每一款蠟燭都擁有獨特的香調，如清新的海洋香、迷人的花香、深邃的木質香等。點燃蠟燭的瞬間，香氣隨著煙霧緩緩升騰，填滿了整個房間。這種香氛不僅能夠為空間注入美好的氛圍，也能夠影響我們的情緒和心情。

蠟燭的溫馨光影也是其吸引人的地方。燭光的微弱光芒，在昏暗的房間中緩緩顫動，帶來一份安靜和祥和。這種光影讓我們能夠靜心沉思，享受一刻的寧靜時光。

在家居裝飾中，香氛蠟燭也扮演了重要的角色。它們不僅可以為房間增添藝術和溫暖，還能夠成為一種個人風格的表達。蠟燭的外形、包裝和顏色都能夠反映出你的喜好和個性，讓空間更具個人特色。

除了為家居帶來美好的氛圍，香氛蠟燭還常常被用於瑜伽、冥想等活動中。蠟燭的香氣能夠幫助我們更好地專注和放鬆，讓身心得到平衡。

總的來說，香氛蠟燭是一種融合了光影和香氣的藝術品，它們不僅為空間帶來溫馨的氛圍，也為我們的情緒和心靈注入一份寧靜和放鬆。每一根蠟燭都像是一盞微光，引領我們進入一場香氛之旅，將我們的心靈和空間燃點成溫暖的一片。', N'最新消息6.png', CAST(N'2023-04-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (7, N'夏季', N'擴香產品，諸如香薰機、香薰石、香薰棒，以其特殊的方式，將芳香的氛圍引入我們的生活環境，為我們帶來愜意的感官之旅。

擴香的魅力在於所傳遞的香氣。無論是清新的果香、誘人的花香，還是溫暖的木質香，這些香氣賦予室內一份和諧的氛圍。透過擴香，我們能在居處裡塑造出多樣的情感場景，清晨的活力、黃昏的寧靜，不同的時刻皆有其獨特的氛圍。

擴香產品多樣且富有變化，適應不同場合和需求。香薰機能均勻地散發香氣，香薰石和香薰棒則能靜置在不同位置，例如書桌、床頭，將淡淡香氣飄散開來。這些產品不僅帶來香氣的享受，還可成為室內裝飾的一部分，為空間增加風格和特色。

擴香產品所帶來的香氣不僅僅是感官愉悅，也能助於情緒和心理的平衡。部分香氣能減壓、改善情緒，譬如薰衣草、檀香等。這種芳香療法的運用，讓我們在香氣中獲得寧靜與愉悅。

此外，擴香產品也經常用於營造浪漫氛圍，例如浪漫的燭光晚餐、愜意的泡澡時光。香氣與視覺之間的雙重刺激，打造出一份愉悅與浪漫的氛圍。

總而言之，擴香產品將芳香的氛圍融入我們的生活場景，為我們帶來優美的感官和情緒體驗。無論是營造家居氛圍、療癒心靈，還是打造浪漫氛圍，擴香是一種特別而令人愉悅的方式，為我們的生活增添了美好的元素。', N'最新消息7.png', CAST(N'2023-06-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (8, N'春季', N'寒冷的冬日，當風嗖嗖吹過，我們總會不由自主地緊縮著手指，試圖抵擋著寒冷的侵襲。然而，指尖的溫度卻不是唯一需要保護的。護手霜，猶如一縷溫暖的陽光，總能輕輕地滲透進皮膚間，為雙手帶來溫暖和呵護。

護手霜的魅力在於它輕盈的質地和滋潤的效果，它總能迅速融入肌膚，為乾燥的手部帶來一份深深的潤澤。當你在冷風中回家，溫暖的護手霜像是一杯熱茶，溫柔地包裹著你的雙手，讓你感受到溫暖的一瞬間。

在護手霜的香氣中，總能夠找到一份愜意和寧靜。香氣在肌膚上輕輕散發，彷彿帶著一絲夢幻，讓你感受到放鬆和舒適。這種愜意的感覺，仿佛讓你置身於一個溫暖的小角落，遠離外界的喧囂。

護手霜的使用也成了一種愜意的習慣。當你在忙碌的工作中稍作停頓，抹上一點護手霜，輕輕地按摩著雙手，這一刻仿佛讓時間暫停。你可以感受到指尖之間的觸感，感受到護手霜帶來的愛意和呵護。

而護手霜的功效不僅止於此，它能夠修復受損的肌膚，改善肌膚的質地，讓你的雙手更加柔軟嫩滑。這種護理，不僅是對肌膚的愛護，更是對自己的一份關心。

總的來說，護手霜是寒冬中的一道溫暖風景線，它輕輕地護佑著你的雙手，讓你在寒冷的季節中也能感受到一份溫馨和呵護。護手霜，是指尖的愛意，是冬日中的一抹溫暖，是愜意和寧靜的注入。', N'最新消息8.png', CAST(N'2023-05-01T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (9, N'冬季', N'在肌膚護理的廣闊戰場上，乳液和乳霜總是扮演著不可或缺的角色，它們像是肌膚的秘密武器，隨時準備著為我們打造一場優雅的美麗對決。這兩者之間的魔幻辯論，究竟誰能在肌膚的舞台上脫穎而出，讓我們來一窺究竟吧！

首先登場的是乳液，它輕盈而清爽的質地總能迅速融入肌膚，就像是柔和的春風輕輕拂過。乳液的質地讓它特別適合在炎炎夏日使用，它能夠提供足夠的保濕，同時不會讓肌膚感到油膩。它像是一位溫柔的朋友，總能在你的肌膚上留下一抹清新的印記，讓你的肌膚呼吸自如，充滿活力。

而在乳液之後登場的乳霜，則以其濃郁的質地和滋潤的效果贏得了許多人的喜愛。乳霜像是肌膚的貴族，能夠為肌膚提供更豐富的保濕和滋養。特別是在寒冷的冬季，乳霜能夠像一層溫暖的絨毯，保護著你的肌膚不受外界的侵害。它的滋潤效果總是讓人感受到肌膚在呼喚著：「謝謝你，我現在舒適多了！」

然而，這場魔幻對決並不是一場角力，而是一場平衡的協奏曲。乳液和乳霜各自擁有自己的特點，而選擇哪個取決於你的肌膚需求和當時的情況。有時候，你可能想要在清晨迅速完成護理，這時候輕盈的乳液會是理想的選擇；有時候，你可能想要在夜晚給予肌膚充分的滋養，這時候濃郁的乳霜則會是不二之選。

在這場充滿魔幻與美麗的對決中，乳液和乳霜各自展現了自己的魅力，彷彿在為肌膚的舞台上上演一場華麗的芭蕾舞。無論你是輕盈的愛好者，還是濃郁的追隨者，這兩者都將在肌膚護理的旅程中，為你奏響美麗的樂章。', N'最新消息9.png', CAST(N'2023-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Description], [Image], [Time]) VALUES (10, N'春季', N'每一天，當疲憊的身軀回歸家中，沐浴成了那一刻最令人期待的時光。而身上的沐浴清潔品，像是一場身心的愉悅洗禮，讓我們在清新的水珠中沉浸，洗去一天的塵囂，讓肌膚和靈魂都得到輕盈的解放。

沐浴清潔品的芳香總能讓整個浴室充滿令人愉悅的氛圍。清新的果香、花香、或是深邃的木質香，都能在沐浴時為我們注入一份愉悅和放鬆。這種香氣不僅是一種感官享受，更是一種心靈的寧靜，讓我們的思緒在水滴的音樂中飛翔。

而沐浴清潔品的質地也是其魅力的一部分。柔和的泡沫總能溫柔地包裹著肌膚，如同一雙溫暖的手掌，輕輕地拭去疲憊和煩憂。清潔的同時，也是對肌膚的愛護，讓我們的皮膚得到柔軟的呵護，恢復活力。

沐浴成為一個人的靜心時光。當水流從頭頂滑落，我們的思緒也伴隨著水流流動。這是一個可以平靜心靈的時刻，讓我們在自己和水的對話中，找到內心的寧靜。

除了身體的洗淨，沐浴也有助於放鬆肌肉，緩解壓力。在舒適的水溫中，我們可以隨意伸展身體，讓疲勞的肌肉得到放鬆。這種感覺彷彿是一場對身體的愛的呵護，讓我們的身心都得到了寬慰。

總的來說，沐浴清潔品不僅是對肌膚的呵護，更是一場身心的愉悅洗禮。清新的香氣、柔和的質地、寧靜的時光，一切都交織在沐浴的芬芳時光裡。每一次的沐浴都是一種放鬆和解放，讓我們在水滴的旋律中，沉浸在愉悅的洗禮之中。', N'最新消息10.png', CAST(N'2023-04-07T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[Notes] ON 

INSERT [dbo].[Notes] ([Id], [Name], [DisplayOrder]) VALUES (1, N'花香調', 10)
INSERT [dbo].[Notes] ([Id], [Name], [DisplayOrder]) VALUES (2, N'果香調', 20)
INSERT [dbo].[Notes] ([Id], [Name], [DisplayOrder]) VALUES (3, N'東方調', 30)
INSERT [dbo].[Notes] ([Id], [Name], [DisplayOrder]) VALUES (4, N'木質調', 40)
INSERT [dbo].[Notes] ([Id], [Name], [DisplayOrder]) VALUES (5, N'草本調', 50)
INSERT [dbo].[Notes] ([Id], [Name], [DisplayOrder]) VALUES (6, N'海洋調', 60)
SET IDENTITY_INSERT [dbo].[Notes] OFF
GO
SET IDENTITY_INSERT [dbo].[Paytypes] ON 

INSERT [dbo].[Paytypes] ([Id], [Paytype], [Enabled]) VALUES (1, N'貨到付款', 1)
INSERT [dbo].[Paytypes] ([Id], [Paytype], [Enabled]) VALUES (2, N'超商條碼付款', 1)
INSERT [dbo].[Paytypes] ([Id], [Paytype], [Enabled]) VALUES (3, N'線上ATM付款', 1)
INSERT [dbo].[Paytypes] ([Id], [Paytype], [Enabled]) VALUES (4, N'LINE PAY', 1)
INSERT [dbo].[Paytypes] ([Id], [Paytype], [Enabled]) VALUES (5, N'街口支付', 0)
SET IDENTITY_INSERT [dbo].[Paytypes] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (1, 39, N'產品ID39的副圖1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (2, 39, N'產品ID39的副圖2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (3, 41, N'香氛蠟燭果然茉莉1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (4, 41, N'蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (5, 41, N'蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (6, 41, N'蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (7, 42, N'香氛蠟燭果然白玫瑰1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (8, 42, N'蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (9, 42, N'蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (10, 42, N'蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (11, 43, N'香氛蠟燭果然萊姆1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (12, 43, N'蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (13, 43, N'蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (14, 43, N'蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (15, 44, N'香氛蠟燭迷情薰衣草1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (16, 44, N'蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (17, 44, N'蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (18, 44, N'蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (19, 45, N'香氛蠟燭夏夜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (20, 45, N'蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (21, 45, N'蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (22, 45, N'蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (23, 46, N'香氛蠟燭歸途1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (24, 46, N'蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (25, 46, N'蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (26, 46, N'蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (27, 59, N'新浪潮淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (28, 59, N'新浪潮淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (29, 60, N'兒時記憶淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (30, 60, N'兒時記憶淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (31, 60, N'兒時記憶淡香精3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (32, 60, N'兒時記憶淡香精4.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (33, 61, N'秘徑漫遊淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (34, 61, N'秘徑漫遊淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (35, 61, N'秘徑漫遊淡香精3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (36, 62, N'模里西斯淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (37, 62, N'模里西斯淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (38, 63, N'果然白玫瑰淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (39, 63, N'果然白玫瑰淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (40, 118, N'日安美好身體潤澤霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (41, 118, N'日安美好身體潤澤霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (42, 118, N'日安美好身體潤澤霜3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (43, 118, N'日安美好身體潤澤霜4.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (44, 119, N'舒緩恬睡身體潤澤霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (45, 119, N'舒緩恬睡身體潤澤霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (46, 119, N'舒緩恬睡身體潤澤霜3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (47, 120, N'皇家奢華身體潤澤霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (48, 120, N'皇家奢華身體潤澤霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (49, 120, N'皇家奢華身體潤澤霜3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (50, 120, N'皇家奢華身體潤澤霜4.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (51, 121, N'日安美好潤膚乳1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (52, 121, N'日安美好潤膚乳2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (53, 121, N'日安美好潤膚乳3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (54, 122, N'完美幸福潤膚乳1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (55, 122, N'完美幸福潤膚乳2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (56, 122, N'完美幸福潤膚乳3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (57, 123, N'皇家奢華潤膚乳1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (58, 123, N'皇家奢華潤膚乳2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (59, 123, N'皇家奢華潤膚乳3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (60, 127, N'活力綻放護手霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (61, 127, N'活力綻放護手霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (62, 128, N'舒緩恬睡護手霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (63, 128, N'舒緩恬睡護手霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (64, 129, N'日安美好護手霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (65, 129, N'日安美好護手霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (66, 130, N'皇家奢華護手霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (67, 130, N'皇家奢華護手霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (68, 152, N'卡爾西烏淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (69, 152, N'卡爾西烏淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (70, 152, N'卡爾西烏淡香精3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (71, 154, N'澄香愉悅護手霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (72, 154, N'澄香愉悅護手霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (79, 83, N'木苔淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (80, 83, N'木苔淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (81, 83, N'木苔淡香精3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (82, 83, N'木苔淡香精4.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (83, 84, N'蒝野淡香精1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (84, 84, N'蒝野淡香精2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (85, 84, N'蒝野淡香精3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (86, 84, N'蒝野淡香精4.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (87, 90, N'bamford蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (88, 90, N'bamford蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (89, 90, N'bamford蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (90, 91, N'bamford蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (91, 91, N'bamford蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (92, 91, N'bamford蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (93, 92, N'bamford蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (94, 92, N'bamford蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (95, 92, N'bamford蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (96, 93, N'bamford蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (97, 93, N'bamford蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (98, 93, N'bamford蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (99, 94, N'bamford蠟燭1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (100, 94, N'bamford蠟燭2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (101, 94, N'bamford蠟燭3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (102, 95, N'鼠尾草沐浴露1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (103, 95, N'鼠尾草沐浴露2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (104, 96, N'柑橘沐浴露1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (105, 96, N'柑橘沐浴露2.jpg')
GO
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (106, 97, N'天竺葵沐浴露1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (107, 97, N'天竺葵沐浴露2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (108, 98, N'柑橘身體乳1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (109, 98, N'柑橘身體乳2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (110, 99, N'鼠尾草身體乳1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (111, 99, N'鼠尾草身體乳2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (112, 100, N'天竺葵身體乳1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (113, 100, N'天竺葵身體乳2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (114, 101, N'晨曦香氛室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (115, 101, N'室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (116, 102, N'紅霞香氛室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (117, 102, N'室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (118, 103, N'薄暮香氛室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (119, 103, N'室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (120, 104, N'餘暉香氛室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (121, 104, N'室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (122, 105, N'靜謐香氛室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (123, 105, N'室內擴香1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (124, 117, N'天竺葵護手霜1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (125, 117, N'天竺葵護手霜2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (126, 117, N'天竺葵護手霜3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (127, 117, N'天竺葵護手霜4.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (128, 117, N'天竺葵護手霜5.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (129, 117, N'天竺葵護手霜6.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (130, 163, N'1zbvd24o.21m.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (131, 163, N'wub3qngc.fnn.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (136, 166, N'gwbr10xk.cuh.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (137, 166, N'aqj0bwvn.anv.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (141, 168, N'ngtwojas.izh.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (142, 168, N'3xg05kpi.i2f.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (143, 168, N'g5w4yd1a.oy2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (144, 169, N'5giepghg.h1n.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [FileName]) VALUES (145, 169, N'gmq5zc02.txd.jpg')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (3, N'香氛蠟燭-馬鞭草', 2, 5, 3, 5, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (4, N'香氛蠟燭-薰衣草', 2, 2, 3, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (5, N'香氛蠟燭-尤加利', 2, 2, 3, 4, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (6, N'香氛蠟燭-廣藿香', 2, 2, 3, 5, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (7, N'香氛蠟燭-維堤里歐', 2, 2, 3, 4, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (8, N'Eau des Sens (感官之水) 淡香水', 2, 1, 1, 3, 3400, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (9, N'Tam Dao (譚道) 淡香水', 2, 1, 1, 3, 3400, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (10, N'Philosykos (希臘無花果) 淡香水', 2, 1, 1, 1, 3400, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (11, N'Oyedo (東京) 淡香水', 2, 1, 1, 2, 3400, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (12, N'L''Ombre dans l''Eau (影中之水) 淡香水', 2, 1, 1, 1, 3400, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (13, N'Eau Rose (玫瑰之水) 淡香水', 2, 1, 1, 1, 3400, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (14, N'Fleur de Peau (肌膚之華) 淡香精', 2, 3, 1, 3, 5600, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (15, N'Orpheon (爵夢) 淡香精', 2, 3, 1, 4, 5600, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (16, N'Eau Papier (紙染之水) 淡香水', 2, 2, 1, 6, 4800, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (17, N'室內擴香補充-橙花', 2, 6, 4, 2, 2900, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (18, N'室內擴香補充-含羞草', 2, 6, 4, 5, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (19, N'室內擴香補充-晚香玉', 2, 6, 4, 1, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (20, N'室內擴香補充-玫瑰', 2, 6, 4, 1, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (21, N'室內擴香補充-無花果', 2, 6, 4, 2, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (22, N'室內擴香補充-聖日爾曼大道34號', 2, 6, 4, 4, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (23, N'室內擴香擺件-晚香玉', 2, 6, 4, 1, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (24, N'室內擴香擺件-玫瑰', 2, 6, 4, 1, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (25, N'室內擴香擺件-無花果', 2, 6, 4, 2, 2900, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (26, N'室內擴香擺件-橙花', 2, 6, 4, 2, 2900, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (27, N'室內擴香擺件-含羞草', 2, 6, 4, 5, 2900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (28, N'室內擴香擺件-聖日爾曼大道34號', 2, 6, 4, 4, 2900, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (29, N'漫步巴黎身體香氛噴霧_盧森堡公園', 3, 3, 1, 1, 1550, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 8, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (30, N'漫步巴黎身體香氛噴霧_聖路易島', 3, 3, 1, 4, 1550, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 8, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (31, N'漫步巴黎身體香氛噴霧_肖蒙山丘公園', 3, 3, 1, 4, 1550, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 8, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (32, N'漫步巴黎身體香氛噴霧_孚日廣場', 3, 3, 1, 1, 1550, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 8, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (33, N'植物標本系列香氛蠟燭_絨金合歡', 3, 5, 3, 4, 1600, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (34, N'植物標本系列香氛蠟燭_熱帶無花果', 3, 5, 3, 2, 1600, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (35, N'植物標本系列香氛蠟燭_秋旬漿果', 3, 5, 3, 2, 1600, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (36, N'植物標本系列香氛蠟燭_胡椒薄荷', 3, 5, 3, 5, 1600, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (37, N'漫步巴黎香氛蠟燭_肖蒙山丘公園', 3, 7, 3, 4, 1600, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (38, N'漫步巴黎香氛蠟燭_盧森堡公園', 3, 7, 3, 1, 1600, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (39, N'漫步巴黎香氛蠟燭_聖路易島', 3, 7, 3, 4, 1600, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'產品ID39的主圖.jpg', 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (40, N'漫步巴黎香氛蠟燭_孚日廣場', 3, 7, 3, 1, 1600, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (41, N'香氛蠟燭 果然茉莉', 1, 7, 3, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'香氛蠟燭果然茉莉1.jpg', 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (42, N'香氛蠟燭 果然白玫瑰', 1, 7, 3, 1, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'香氛蠟燭果然白玫瑰1.jpg', 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (43, N'香氛蠟燭 果然萊姆', 1, 7, 3, 2, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'香氛蠟燭果然萊姆1.jpg', 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (44, N'香氛蠟燭 迷情薰衣草', 1, 7, 3, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'香氛蠟燭迷情薰衣草1.jpg', 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (45, N'香氛蠟燭 No.12 夏夜', 1, 7, 3, 5, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'香氛蠟燭夏夜1.jpg', 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (46, N'香氛蠟燭 No.11 歸途', 1, 7, 3, 5, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'香氛蠟燭歸途1.jpg', 10, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (47, N'香氛蠟燭 地中海情懷', 1, 7, 3, 6, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (48, N'香氛蠟燭 No.09 模里西斯', 1, 7, 3, 4, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (49, N'香氛蠟燭 No.08 希望之船', 1, 7, 3, 5, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (50, N'香氛蠟燭 No.06 春日融雪', 1, 7, 3, 2, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (51, N'香氛蠟燭 No.05 熱帶晚香玉', 1, 7, 3, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (52, N'香氛蠟燭 No.04 秘徑漫遊', 1, 7, 3, 3, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (53, N'香氛蠟燭 No.03 黑色湖泊', 1, 7, 3, 3, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (54, N'香氛蠟燭 No.02 兒時記憶', 1, 7, 3, 3, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (55, N'香氛蠟燭 No.01 夏日海岸', 1, 7, 3, 6, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (56, N'香氛蠟燭 No.13 新浪潮', 1, 7, 3, 2, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (57, N'No.04 秘徑漫遊室內擴香', 1, 8, 4, 3, 3350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (58, N'No.09 模里西斯內擴香', 1, 8, 4, 4, 3350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', NULL, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (59, N'No.13 新浪潮淡香精', 1, 1, 1, 2, 3450, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'主要香調：鈴蘭 / 托斯卡尼無花果 / 零陵香豆', N'新浪潮淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (60, N'No.02 兒時記憶淡香精', 1, 1, 1, 4, 3450, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'包括高品質的香水油、純凈酒精和精選的花卉提取物。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'兒時記憶淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (61, N'No.04 秘徑漫遊淡香精', 1, 1, 1, 3, 3450, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'秘徑漫遊淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (62, N'No.09 模里西斯淡香精', 1, 1, 1, 4, 3450, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'模里西斯淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (63, N'果然白玫瑰淡香精', 1, 1, 1, 2, 3450, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'果然白玫瑰淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (81, N'溫和植萃潔膚露_泡泡寶貝(橙花/苦橙葉)', 3, 8, 8, 5, 580, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (82, N'溫和植萃潔膚露_孚日廣場(玫瑰/天竺葵)', 3, 8, 8, 1, 580, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (83, N'木苔淡香精', 7, 1, 1, 5, 1100, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'木苔淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (84, N'蒝野淡香精', 7, 1, 1, 5, 1100, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'蒝野淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (90, N'鈴蘭香氛蠟燭', 7, 5, 3, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'bamford蠟燭1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (91, N'英國薰衣草香氛蠟燭', 7, 5, 3, 1, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'bamford蠟燭1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (92, N'白鳶尾香氛蠟燭', 7, 5, 3, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'bamford蠟燭1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (93, N'紫藤香氛蠟燭', 7, 5, 3, 1, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'bamford蠟燭1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (94, N'庭園玫瑰香氛蠟燭', 7, 5, 3, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'bamford蠟燭1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (95, N'鼠尾草沐浴露', 7, 8, 8, 1, 1250, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'鼠尾草沐浴露1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (96, N'柑橘沐浴露', 7, 8, 8, 2, 1250, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'柑橘沐浴露1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (97, N'天竺葵沐浴露', 7, 8, 8, 1, 1250, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'天竺葵沐浴露1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (98, N'柑橘身體乳', 7, 8, 7, 2, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'柑橘身體乳1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (99, N'鼠尾草身體乳', 7, 8, 7, 1, 1350, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'鼠尾草身體乳1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (100, N'天竺葵身體乳', 7, 8, 7, 1, 1350, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'天竺葵身體乳1.jpg', 3, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (101, N'晨曦香氛室內擴香', 7, 8, 4, 3, 3100, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'晨曦香氛室內擴香1.jpg', 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (102, N'紅霞香氛室內擴香', 7, 8, 4, 3, 3100, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'紅霞香氛室內擴香1.jpg', 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (103, N'薄暮香氛室內擴香', 7, 8, 4, 3, 3100, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'薄暮香氛室內擴香1.jpg', 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (104, N'餘暉香氛室內擴香', 7, 8, 4, 3, 3100, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'餘暉香氛室內擴香1.jpg', 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (105, N'靜謐香氛室內擴香', 7, 8, 4, 1, 3100, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'靜謐香氛室內擴香1.jpg', 6, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (106, N'大麻草淡香精', 4, 1, 1, 5, 3500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (107, N'草莓草淡香精', 4, 1, 1, 2, 3500, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (108, N'佛手柑草淡香精', 4, 1, 1, 2, 3500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (109, N'蘭姆酒草淡香精', 4, 1, 1, 2, 3500, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (110, N'皮革淡香精', 4, 1, 1, 3, 3500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (111, N'大麻草香氛蠟燭', 4, 7, 3, 5, 2000, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (112, N'皮革香氛蠟燭', 4, 7, 3, 3, 2000, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 10, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (113, N'蘭姆酒香氛蠟燭', 4, 7, 3, 2, 2000, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (114, N'佛手柑身體潔膚露', 4, 6, 8, 2, 820, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (115, N'麻草潔膚露', 4, 6, 8, 5, 820, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (116, N'蘭姆酒潔膚露', 4, 6, 8, 2, 820, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (117, N'天竺葵護手霜', 7, 2, 5, 1, 980, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'天竺葵護手霜1.jpg', 8, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (118, N'日安美好身體潤澤霜', 6, 6, 7, 2, 1700, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'日安美好身體潤澤霜1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (119, N'舒緩恬睡身體潤澤霜', 6, 6, 7, 2, 1700, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'舒緩恬睡身體潤澤霜1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (120, N'皇家奢華身體潤澤霜', 6, 6, 7, 2, 1700, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'皇家奢華身體潤澤霜1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (121, N'日安美好潤膚乳', 6, 8, 7, 2, 1100, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'日安美好潤膚乳1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (122, N'完美幸福潤膚乳', 6, 8, 7, 1, 1100, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'完美幸福潤膚乳1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (123, N'皇家奢華潤膚乳', 6, 8, 7, 1, 1100, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'皇家奢華潤膚乳1.jpg', 4, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (124, N'完美幸福潔膚露', 6, 8, 8, 1, 900, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (125, N'日安美好潔膚露', 6, 8, 8, 2, 900, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (126, N'皇家奢華潔膚露', 6, 8, 8, 1, 900, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (127, N'活力綻放護手霜', 6, 1, 5, 2, 500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'活力綻放護手霜1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (128, N'舒緩恬睡護手霜', 6, 1, 5, 2, 500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'舒緩恬睡護手霜1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (129, N'日安美好護手霜', 6, 1, 5, 2, 500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'日安美好護手霜1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (130, N'皇家奢華護手霜', 6, 1, 5, 6, 500, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'皇家奢華護手霜1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (131, N'靜心舒眠室內擴香', 6, 3, 4, 2, 1980, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (132, N'清新甦活室內擴香', 6, 3, 4, 2, 1980, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (133, N'幸福愉悅室內擴香', 6, 3, 4, 1, 1980, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (134, N'舒緩恬睡室內擴香', 6, 3, 4, 1, 1980, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (135, N'皇家奢華室內擴香', 6, 3, 4, 2, 1980, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (137, N'舒緩恬睡極致美肌香氛蠟燭', 6, 5, 3, 1, 1900, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 5, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (144, N'皇家奢華香氛蠟燭', 6, 10, 3, 1, 2400, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (145, N'靜心舒眠香氛蠟燭', 6, 10, 3, 2, 2400, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (146, N'舒緩恬睡香氛蠟燭', 6, 10, 3, 1, 2400, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (147, N'清新甦活香氛蠟燭', 6, 10, 3, 6, 2400, N'我們的淡香精是一款高質量的香水，以其持久的香氣和獨特的調香配方而著稱。它是您日常打扮的完美配件，也適合特殊場合。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (148, N'幸福愉悅香氛蠟燭', 6, 10, 3, 1, 2400, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (149, N'完美幸福香氛蠟燭', 6, 10, 3, 1, 2400, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', NULL, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (152, N'No.18 卡爾西烏淡香精', 1, 1, 1, 1, 3500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'卡爾西烏淡香精1.jpg', 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (154, N'澄香愉悅護手霜', 1, 8, 5, 1, 2500, N'淡香精為奢華的香水，融合了精緻的香氛，為您帶來持久的自信和吸引力。', N'含有純淨的香水油、酒精和水。', N'西洋接骨木花萃取、海鹽、甜杏仁油、菜籽油、紅花籽油等如原廠所示。

', N'澄香愉悅護手霜1.jpg', 4, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (162, N'test', 1, 1, 1, 1, 1, NULL, NULL, NULL, NULL, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (163, N'test1', 1, 1, 1, 1, 2, NULL, NULL, NULL, N'eukddxf3.xeq.jpg', 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (166, N'test4', 1, 1, 1, 1, 5, NULL, NULL, NULL, NULL, 5, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (168, N'test2', 1, 2, 1, 2, 7, NULL, NULL, NULL, NULL, 7, 1)
INSERT [dbo].[Products] ([Id], [Name], [BrandId], [CapacityId], [SecondaryCategoryId], [NoteId], [Price], [Description], [Method], [Ingredient], [Image], [Stock], [Enabled]) VALUES (169, N'test3', 1, 3, 3, 1, 5, NULL, NULL, NULL, NULL, 5, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[SecondaryCategories] ON 

INSERT [dbo].[SecondaryCategories] ([Id], [CategoryId], [Name], [DisplayOrder], [Enabled]) VALUES (1, 1, N'淡香精', 10, 1)
INSERT [dbo].[SecondaryCategories] ([Id], [CategoryId], [Name], [DisplayOrder], [Enabled]) VALUES (3, 1, N'蠟燭', 20, 1)
INSERT [dbo].[SecondaryCategories] ([Id], [CategoryId], [Name], [DisplayOrder], [Enabled]) VALUES (4, 1, N'擴香', 30, 1)
INSERT [dbo].[SecondaryCategories] ([Id], [CategoryId], [Name], [DisplayOrder], [Enabled]) VALUES (5, 2, N'護手霜', 40, 1)
INSERT [dbo].[SecondaryCategories] ([Id], [CategoryId], [Name], [DisplayOrder], [Enabled]) VALUES (7, 2, N'乳液乳霜', 50, 1)
INSERT [dbo].[SecondaryCategories] ([Id], [CategoryId], [Name], [DisplayOrder], [Enabled]) VALUES (8, 2, N'沐浴清潔', 60, 1)
SET IDENTITY_INSERT [dbo].[SecondaryCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Status]) VALUES (1, N'備貨中')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (2, N'已出貨')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (3, N'配送中')
INSERT [dbo].[Status] ([Id], [Status]) VALUES (4, N'已送達')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[TextCarousel] ON 

INSERT [dbo].[TextCarousel] ([Id], [Description], [CreatTime], [Enabled]) VALUES (1, N'營造香氛聖地,拋開炎熱盛夏的紛擾', CAST(N'2023-07-29T08:25:45.570' AS DateTime), 1)
INSERT [dbo].[TextCarousel] ([Id], [Description], [CreatTime], [Enabled]) VALUES (2, N'任選兩瓶經由,即可獲得神秘禮物', CAST(N'2023-08-15T15:59:55.703' AS DateTime), 1)
INSERT [dbo].[TextCarousel] ([Id], [Description], [CreatTime], [Enabled]) VALUES (7, N'香島躰育 x Club Stubborn 聯名首發@西門門市', CAST(N'2023-09-02T10:27:01.563' AS DateTime), 1)
INSERT [dbo].[TextCarousel] ([Id], [Description], [CreatTime], [Enabled]) VALUES (8, N'vacanza con & River 全新聯名系列', CAST(N'2023-09-15T19:27:08.637' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TextCarousel] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (1, N'Kai', N'123', N'Kai Yeh', N'el11111@gmail.com', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (2, N'Abel', N'123', N'Stephen Cisneros', N'xufh.vuhols@j-d--f.net', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (3, N'Erick', N'123', N'Abraham Blackburn', N'mkuw@-fnvzo.com', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (4, N'Janice', N'123', N'Charlotte Byrd', N'jovo@k-v--p.com', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (5, N'Gretchen', N'123', N'Lynn Miles', N'vjwm.kqby@dcmr-i.net', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (6, N'Lawanda', N'123', N'Erich Ingram', N'ujth@--h-ic.org', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (7, N'Robbie', N'123', N'Dominick Neal', N'igwd75@ul-mon.com', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (8, N'Carla', N'123', N'Cherie White', N'krvv@h-skf-.net', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (9, N'Heath', N'123', N'Ebony Daniels', N'njia208@--u-yp.org', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (10, N'Kendra', N'123', N'Arthur Barrera', N'xnqr15@---il-.net', 1)
INSERT [dbo].[Users] ([Id], [Account], [Password], [Name], [Email], [Enabled]) VALUES (11, N'Brandie', N'123', N'Debra Middleton', N'nguy65@qc---s.org', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Cities]    Script Date: 2023/10/4 下午 01:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Cities] ON [dbo].[Cities]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Districts]    Script Date: 2023/10/4 下午 01:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Districts] ON [dbo].[Districts]
(
	[District] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Members]    Script Date: 2023/10/4 下午 01:14:05 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Members] ON [dbo].[Members]
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BannerCarousel] ADD  CONSTRAINT [DF_BannerCarousel_CreatTime]  DEFAULT (getdate()) FOR [CreatTime]
GO
ALTER TABLE [dbo].[BannerCarousel] ADD  CONSTRAINT [DF_BannerCarousel_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Members] ADD  CONSTRAINT [DF_Members_IsConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_ProductOrder_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[Paytypes] ADD  CONSTRAINT [DF_Paytypes_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Enabled]  DEFAULT ((1)) FOR [Enabled]
GO
ALTER TABLE [dbo].[SecondaryCategories] ADD  CONSTRAINT [DF_SecondaryCategories_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[TextCarousel] ADD  CONSTRAINT [DF_TextCarousel_CreatTime]  DEFAULT (getdate()) FOR [CreatTime]
GO
ALTER TABLE [dbo].[TextCarousel] ADD  CONSTRAINT [DF_TextCarousel_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Enabled]  DEFAULT ((0)) FOR [Enabled]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Carts] FOREIGN KEY([CartId])
REFERENCES [dbo].[Carts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Carts]
GO
ALTER TABLE [dbo].[CartItems]  WITH CHECK ADD  CONSTRAINT [FK_CartItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[CartItems] CHECK CONSTRAINT [FK_CartItems_Products]
GO
ALTER TABLE [dbo].[Carts]  WITH CHECK ADD  CONSTRAINT [FK_Carts_Members] FOREIGN KEY([MemberAccount])
REFERENCES [dbo].[Members] ([Account])
GO
ALTER TABLE [dbo].[Carts] CHECK CONSTRAINT [FK_Carts_Members]
GO
ALTER TABLE [dbo].[Districts]  WITH CHECK ADD  CONSTRAINT [FK_Districts_Cities] FOREIGN KEY([CityId])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Districts] CHECK CONSTRAINT [FK_Districts_Cities]
GO
ALTER TABLE [dbo].[FAQs]  WITH CHECK ADD  CONSTRAINT [FK_FAQs_SecondaryCategories] FOREIGN KEY([SecondaryCategoriesId])
REFERENCES [dbo].[SecondaryCategories] ([Id])
GO
ALTER TABLE [dbo].[FAQs] CHECK CONSTRAINT [FK_FAQs_SecondaryCategories]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Favorites] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Favorites]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_MemberFavorites_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_MemberFavorites_Products]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Districts] FOREIGN KEY([DistrictsId])
REFERENCES [dbo].[Districts] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Districts]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Orders] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Orders]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Paytypes] FOREIGN KEY([PaytypeId])
REFERENCES [dbo].[Paytypes] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Paytypes]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Status]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Capacities] FOREIGN KEY([CapacityId])
REFERENCES [dbo].[Capacities] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Capacities]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Notes] FOREIGN KEY([NoteId])
REFERENCES [dbo].[Notes] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Notes]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_SecondaryCategories] FOREIGN KEY([SecondaryCategoryId])
REFERENCES [dbo].[SecondaryCategories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_SecondaryCategories]
GO
ALTER TABLE [dbo].[SecondaryCategories]  WITH CHECK ADD  CONSTRAINT [FK_SecondaryCategories_Categories1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[SecondaryCategories] CHECK CONSTRAINT [FK_SecondaryCategories_Categories1]
GO
/****** Object:  StoredProcedure [dbo].[CalculateSummaryByBrandAndCategory]    Script Date: 2023/10/4 下午 01:14:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalculateSummaryByBrandAndCategory]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
    P.BrandId AS Brand, 
    B.Name AS BrandName, 
    P.SecondaryCategoryId AS SecondaryCategory, 
    SC.Name AS SecondaryCategoryName, 
    COUNT(*) AS ProductCount, 
    SUM(Stock) AS TotalStock,
    SUM(Price * Stock) AS TotalStockValue
    FROM Products as P
    INNER JOIN Brands as B ON B.Id = P.BrandId
    INNER JOIN SecondaryCategories as SC ON SC.Id = P.SecondaryCategoryId
    GROUP BY P.SecondaryCategoryId, P.BrandId, B.Name, SC.Name
    ORDER BY P.BrandId;
END;
GO
USE [master]
GO
ALTER DATABASE [FDB10] SET  READ_WRITE 
GO
