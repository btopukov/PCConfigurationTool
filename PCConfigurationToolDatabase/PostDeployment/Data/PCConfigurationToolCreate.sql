USE [master]
GO
/****** Object:  Database [PCConfigurationTool]    Script Date: 9/24/2018 5:00:12 PM ******/
CREATE DATABASE [PCConfigurationTool]
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PCConfigurationTool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PCConfigurationTool] SET ANSI_NULL_DEFAULT ON 
GO
ALTER DATABASE [PCConfigurationTool] SET ANSI_NULLS ON 
GO
ALTER DATABASE [PCConfigurationTool] SET ANSI_PADDING ON 
GO
ALTER DATABASE [PCConfigurationTool] SET ANSI_WARNINGS ON 
GO
ALTER DATABASE [PCConfigurationTool] SET ARITHABORT ON 
GO
ALTER DATABASE [PCConfigurationTool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PCConfigurationTool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET CURSOR_DEFAULT  LOCAL 
GO
ALTER DATABASE [PCConfigurationTool] SET CONCAT_NULL_YIELDS_NULL ON 
GO
ALTER DATABASE [PCConfigurationTool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET QUOTED_IDENTIFIER ON 
GO
ALTER DATABASE [PCConfigurationTool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PCConfigurationTool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PCConfigurationTool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET RECOVERY FULL 
GO
ALTER DATABASE [PCConfigurationTool] SET  MULTI_USER 
GO
ALTER DATABASE [PCConfigurationTool] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [PCConfigurationTool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PCConfigurationTool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PCConfigurationTool] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PCConfigurationTool] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PCConfigurationTool', N'ON'
GO
USE [PCConfigurationTool]
GO
/****** Object:  Table [dbo].[Component]    Script Date: 9/24/2018 5:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Component](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Component] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PCComponentConfiguration]    Script Date: 9/24/2018 5:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCComponentConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ComponentId] [int] NOT NULL,
	[PCConfigurationId] [int] NOT NULL,
 CONSTRAINT [PK_PC_Configuration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PCConfiguration]    Script Date: 9/24/2018 5:00:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PCConfiguration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_PCConfiguration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Component] ON 

INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (1, N'Motherboard', CAST(250.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (2, N'Processor', CAST(350.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (3, N'Memory', CAST(450.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (4, N'Graphics processing unit', CAST(650.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (5, N'Storage', CAST(550.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (6, N'Power supply', CAST(340.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (7, N'Case', CAST(255.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (8, N'Keyboard ', CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Component] ([Id], [Name], [Amount]) VALUES (9, N'Mouse', CAST(100.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Component] OFF
ALTER TABLE [dbo].[PCComponentConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_Component_PCConfiguration] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[Component] ([Id])
GO
ALTER TABLE [dbo].[PCComponentConfiguration] CHECK CONSTRAINT [FK_Component_PCConfiguration]
GO
ALTER TABLE [dbo].[PCComponentConfiguration]  WITH CHECK ADD  CONSTRAINT [FK_Configuration_PCConfiguration] FOREIGN KEY([PCConfigurationId])
REFERENCES [dbo].[PCConfiguration] ([Id])
GO
ALTER TABLE [dbo].[PCComponentConfiguration] CHECK CONSTRAINT [FK_Configuration_PCConfiguration]
GO
USE [master]
GO
ALTER DATABASE [PCConfigurationTool] SET  READ_WRITE 
GO
