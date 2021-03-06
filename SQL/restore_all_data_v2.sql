USE [master]
GO
/****** Object:  Database [eval2]    Script Date: 4/13/2021 4:17:34 PM ******/
CREATE DATABASE [eval2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'eval2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eval2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'eval2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\eval2_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [eval2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eval2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eval2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [eval2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [eval2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [eval2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [eval2] SET ARITHABORT OFF 
GO
ALTER DATABASE [eval2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [eval2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [eval2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [eval2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [eval2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [eval2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [eval2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [eval2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [eval2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [eval2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [eval2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [eval2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [eval2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [eval2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [eval2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [eval2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [eval2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [eval2] SET RECOVERY FULL 
GO
ALTER DATABASE [eval2] SET  MULTI_USER 
GO
ALTER DATABASE [eval2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [eval2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [eval2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [eval2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [eval2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [eval2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'eval2', N'ON'
GO
ALTER DATABASE [eval2] SET QUERY_STORE = OFF
GO
USE [eval2]
GO
/****** Object:  Table [dbo].[EvalSet]    Script Date: 4/13/2021 4:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvalSet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SetID] [int] NULL,
	[GroupNum] [int] NULL,
	[TestID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvalTestGroups]    Script Date: 4/13/2021 4:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvalTestGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GroupID] [int] NULL,
	[GroupNum] [int] NULL,
	[SetID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvalTests]    Script Date: 4/13/2021 4:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvalTests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TestID] [int] NULL,
	[GroupID] [int] NULL,
	[SetID] [int] NULL,
	[ParamID] [int] NULL,
	[ParamValue] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SetupParamTypes]    Script Date: 4/13/2021 4:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupParamTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [varchar](32) NULL,
	[FrameTypeID] [int] NULL,
	[ParamName] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestParams]    Script Date: 4/13/2021 4:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestParams](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParamName] [varchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestSymbols]    Script Date: 4/13/2021 4:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSymbols](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Symbol] [varchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestTypes]    Script Date: 4/13/2021 4:17:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [varchar](32) NULL,
	[FrameTypeID] [int] NULL,
	[ParamName] [varchar](32) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EvalSet] ON 

INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (1, 101, 555, 1232)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (2, 101, 555, 1234)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (3, 101, 555, 1235)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (4, 101, 555, 1236)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (5, 101, 556, 1237)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (6, 101, 556, 1238)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (7, 101, 556, 1239)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (8, 101, 557, 1240)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (9, 102, 557, 1241)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (10, 102, 558, 1242)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (11, 102, 568, 1243)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (12, 102, 559, 1244)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (13, 102, 559, 1245)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (14, 102, 560, 1246)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (15, 102, 560, 1247)
INSERT [dbo].[EvalSet] ([ID], [SetID], [GroupNum], [TestID]) VALUES (16, 101, 555, 1233)
SET IDENTITY_INSERT [dbo].[EvalSet] OFF
GO
SET IDENTITY_INSERT [dbo].[EvalTestGroups] ON 

INSERT [dbo].[EvalTestGroups] ([ID], [GroupID], [GroupNum], [SetID]) VALUES (28, 1, 1, 1)
INSERT [dbo].[EvalTestGroups] ([ID], [GroupID], [GroupNum], [SetID]) VALUES (31, 3, 1, 1)
SET IDENTITY_INSERT [dbo].[EvalTestGroups] OFF
GO
SET IDENTITY_INSERT [dbo].[EvalTests] ON 

INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (1, 1, 1, 0, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (2, 1, 1, 0, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (3, 1, 1, 0, 7, N'525')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (4, 1, 1, 0, 6, N'')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (5, 1, 1, 0, 9, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (6, 1, 1, 0, 10, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (7, 2, 1, 0, 3, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (8, 2, 1, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (9, 2, 1, 0, 7, N'40')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (10, 2, 1, 0, 6, N'')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (11, 2, 1, 0, 9, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (12, 2, 1, 0, 10, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (20, 4, 1, 0, 3, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (21, 4, 1, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (22, 4, 1, 0, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (23, 4, 1, 0, 4, N'400')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (24, 4, 1, 0, 5, N'600')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (25, 4, 1, 0, 11, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (26, 5, 1, 0, 3, N'8')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (27, 5, 1, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (28, 5, 1, 0, 7, N'97')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (29, 5, 1, 0, 6, N'999')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (30, 5, 1, 0, 11, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (43, 8, 3, 1, 3, N'20')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (44, 8, 3, 1, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (45, 8, 3, 1, 7, N'550')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (46, 8, 3, 1, 6, N'')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (47, 8, 3, 1, 9, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (48, 8, 3, 1, 10, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (49, 9, 3, 0, 3, N'21')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (55, 9, 3, 0, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (56, 9, 3, 0, 7, N'575')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (57, 9, 3, 0, 6, N'')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (58, 9, 3, 0, 9, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (59, 9, 3, 0, 10, N'6')
SET IDENTITY_INSERT [dbo].[EvalTests] OFF
GO
SET IDENTITY_INSERT [dbo].[SetupParamTypes] ON 

INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (1, N'0', 0, N'')
INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (2, N'1', 1, N'AOI')
INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (3, N'2', 1, N'Scan Range')
INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (4, N'3', 1, N'Capability Group')
SET IDENTITY_INSERT [dbo].[SetupParamTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[TestParams] ON 

INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (1, N'Name')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (2, N'Rank')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (3, N'TestType')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (4, N'LambdaFrom')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (5, N'LambdaTo')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (6, N'LambdaAt')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (7, N'Value')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (8, N'Filepath')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (9, N'PlusTol')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (10, N'MinusTol')
INSERT [dbo].[TestParams] ([ID], [ParamName]) VALUES (11, N'Symbol')
SET IDENTITY_INSERT [dbo].[TestParams] OFF
GO
SET IDENTITY_INSERT [dbo].[TestSymbols] ON 

INSERT [dbo].[TestSymbols] ([ID], [Symbol]) VALUES (1, N'>=')
INSERT [dbo].[TestSymbols] ([ID], [Symbol]) VALUES (2, N'>')
INSERT [dbo].[TestSymbols] ([ID], [Symbol]) VALUES (3, N'=')
INSERT [dbo].[TestSymbols] ([ID], [Symbol]) VALUES (4, N'<=')
INSERT [dbo].[TestSymbols] ([ID], [Symbol]) VALUES (5, N'<')
SET IDENTITY_INSERT [dbo].[TestSymbols] OFF
GO
SET IDENTITY_INSERT [dbo].[TestTypes] ON 

INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (1, N'0', 0, N'')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (2, N'1', 1, N'CWL')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (3, N'2', 1, N'FWHM')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (4, N'3', 1, N'FW @ 10% T-max')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (5, N'4', 1, N'FW @ 10% T-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (6, N'5', 2, N'T-avg')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (7, N'6', 2, N'T-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (8, N'7', 2, N'T-max')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (9, N'8', 4, N'T-abs@')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (10, N'9', 2, N'T-peak')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (11, N'10', 3, N'B-avg')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (12, N'11', 3, N'B-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (13, N'12', 5, N'B-abs@')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (14, N'13', 2, N'R-avg (T-scan)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (15, N'14', 2, N'R-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (16, N'15', 4, N'R-abs@')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (17, N'16', 2, N'R-avg (r-scan)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (18, N'17', 2, N'R-abs (r-scan)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (19, N'18', 4, N'R-max')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (20, N'19', 4, N'R-target')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (21, N'20', 1, N'Cuton')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (22, N'21', 1, N'Cutoff')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (23, N'22', 1, N'Cuton_80-20 ')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (24, N'23', 1, N'Cutoff_80-20')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (25, N'24', 1, N'Ripple SD')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (26, N'25', 6, N'Squareness')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (27, N'26', 7, N'CIE')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (28, N'27', 8, N'F Prime')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (29, N'28', 9, N'FW(M/1)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (30, N'29', 10, N'Ripple (Abs%)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (31, N'30', 10, N'Ripple (Rel%)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (32, N'31', 10, N'Ripple (StdDev)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (33, N'32', 11, N'FW 10% (Notch)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (34, N'33', 11, N'CWL 10% (Notch)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (35, N'34', 12, N'Dev from avg 0.21%')
SET IDENTITY_INSERT [dbo].[TestTypes] OFF
GO
USE [master]
GO
ALTER DATABASE [eval2] SET  READ_WRITE 
GO
