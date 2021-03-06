USE [master]
GO
/****** Object:  Database [Parking]    Script Date: 13/09/2021 11:45:39 ******/
CREATE DATABASE [Parking]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Parking', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Parking.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Parking_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Parking_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Parking] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Parking].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Parking] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Parking] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Parking] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Parking] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Parking] SET ARITHABORT OFF 
GO
ALTER DATABASE [Parking] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Parking] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Parking] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Parking] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Parking] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Parking] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Parking] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Parking] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Parking] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Parking] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Parking] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Parking] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Parking] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Parking] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Parking] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Parking] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Parking] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Parking] SET RECOVERY FULL 
GO
ALTER DATABASE [Parking] SET  MULTI_USER 
GO
ALTER DATABASE [Parking] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Parking] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Parking] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Parking] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Parking] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Parking] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Parking', N'ON'
GO
ALTER DATABASE [Parking] SET QUERY_STORE = OFF
GO
USE [Parking]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 13/09/2021 11:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 13/09/2021 11:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BuildingName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParkingSpaces]    Script Date: 13/09/2021 11:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParkingSpaces](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FloorNumber] [int] NOT NULL,
	[SpaceNumber] [int] NOT NULL,
	[HasCharger] [bit] NOT NULL,
	[BuildingID] [int] NOT NULL,
 CONSTRAINT [PK_ParkingSpaces] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 13/09/2021 11:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ParkingSpaceID] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 13/09/2021 11:45:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([Id], [BuildingName]) VALUES (1, N'Building1')
INSERT [dbo].[Buildings] ([Id], [BuildingName]) VALUES (2, N'Building2')
INSERT [dbo].[Buildings] ([Id], [BuildingName]) VALUES (3, N'Building3')
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[ParkingSpaces] ON 

INSERT [dbo].[ParkingSpaces] ([Id], [FloorNumber], [SpaceNumber], [HasCharger], [BuildingID]) VALUES (1, 1, 1, 1, 1)
INSERT [dbo].[ParkingSpaces] ([Id], [FloorNumber], [SpaceNumber], [HasCharger], [BuildingID]) VALUES (2, 1, 2, 1, 1)
INSERT [dbo].[ParkingSpaces] ([Id], [FloorNumber], [SpaceNumber], [HasCharger], [BuildingID]) VALUES (3, 1, 3, 0, 1)
INSERT [dbo].[ParkingSpaces] ([Id], [FloorNumber], [SpaceNumber], [HasCharger], [BuildingID]) VALUES (4, 2, 1, 0, 2)
INSERT [dbo].[ParkingSpaces] ([Id], [FloorNumber], [SpaceNumber], [HasCharger], [BuildingID]) VALUES (5, 3, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[ParkingSpaces] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([Id], [UserID], [ParkingSpaceID], [Date]) VALUES (2, 1, 3, CAST(N'2020-08-31T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [UserID], [ParkingSpaceID], [Date]) VALUES (3, 2, 5, CAST(N'2021-08-30T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Reservations] ([Id], [UserID], [ParkingSpaceID], [Date]) VALUES (4, 4, 1, CAST(N'2021-09-01T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email]) VALUES (1, N'bob', N'4454664', N'dfknvfdvn')
INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email]) VALUES (2, N'john', N'8977977', N'kjfdnvn')
INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email]) VALUES (3, N'alex', N'89897779653', N'rpiforme')
INSERT [dbo].[Users] ([Id], [Name], [PhoneNumber], [Email]) VALUES (4, N'mike', N'7897112', N'knvffdvm')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [Parking] SET  READ_WRITE 
GO
