USE [master]
GO
/****** Object:  Database [jarvis]    Script Date: 02/01/2024 18:53:14 ******/
CREATE DATABASE [jarvis]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jarvis', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\jarvis.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'jarvis_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\jarvis_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [jarvis] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jarvis].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jarvis] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jarvis] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jarvis] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jarvis] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jarvis] SET ARITHABORT OFF 
GO
ALTER DATABASE [jarvis] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jarvis] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jarvis] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jarvis] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jarvis] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jarvis] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jarvis] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jarvis] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jarvis] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jarvis] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jarvis] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jarvis] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jarvis] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jarvis] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jarvis] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jarvis] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jarvis] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jarvis] SET RECOVERY FULL 
GO
ALTER DATABASE [jarvis] SET  MULTI_USER 
GO
ALTER DATABASE [jarvis] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jarvis] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jarvis] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jarvis] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [jarvis] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [jarvis] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'jarvis', N'ON'
GO
ALTER DATABASE [jarvis] SET QUERY_STORE = ON
GO
ALTER DATABASE [jarvis] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [jarvis]
GO
/****** Object:  Table [dbo].[applications]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applications](
	[id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[enabled] [bit] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK_applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[applications_permissions]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[applications_permissions](
	[id] [int] NOT NULL,
	[application_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_applications_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types_documents]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[types_documents](
	[id] [int] NOT NULL,
	[name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_types_documents] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types_genders]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[types_genders](
	[id] [int] NOT NULL,
	[name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_types_genders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[types_users_jarvis]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[types_users_jarvis](
	[id] [int] NOT NULL,
	[name] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_types_users_jarvis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [uniqueidentifier] NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
	[enabled] [bit] NOT NULL,
	[description] [nvarchar](255) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_jarvis]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_jarvis](
	[id] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[contact_number] [int] NULL,
	[type_gender_id] [int] NOT NULL,
	[type_document_id] [int] NULL,
	[number_document] [nvarchar](30) NULL,
	[created_at] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
	[type_user_jarvis_id] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
 CONSTRAINT [PK_users_jarvis] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_jarvis_profiles_permissions]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_jarvis_profiles_permissions](
	[user_jarvis_id] [uniqueidentifier] NOT NULL,
	[application_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_profiles_permissions]    Script Date: 02/01/2024 18:53:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_profiles_permissions](
	[user_id] [uniqueidentifier] NOT NULL,
	[application_id] [int] NOT NULL,
	[application_permission_id] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[applications_permissions]  WITH CHECK ADD  CONSTRAINT [FK_applications_id] FOREIGN KEY([application_id])
REFERENCES [dbo].[applications] ([id])
GO
ALTER TABLE [dbo].[applications_permissions] CHECK CONSTRAINT [FK_applications_id]
GO
ALTER TABLE [dbo].[users_jarvis]  WITH CHECK ADD  CONSTRAINT [FK_type_document_id] FOREIGN KEY([type_document_id])
REFERENCES [dbo].[types_documents] ([id])
GO
ALTER TABLE [dbo].[users_jarvis] CHECK CONSTRAINT [FK_type_document_id]
GO
ALTER TABLE [dbo].[users_jarvis]  WITH CHECK ADD  CONSTRAINT [FK_type_gender_id] FOREIGN KEY([type_gender_id])
REFERENCES [dbo].[types_genders] ([id])
GO
ALTER TABLE [dbo].[users_jarvis] CHECK CONSTRAINT [FK_type_gender_id]
GO
ALTER TABLE [dbo].[users_jarvis]  WITH CHECK ADD  CONSTRAINT [FK_type_user_jarvis_id] FOREIGN KEY([type_user_jarvis_id])
REFERENCES [dbo].[types_users_jarvis] ([id])
GO
ALTER TABLE [dbo].[users_jarvis] CHECK CONSTRAINT [FK_type_user_jarvis_id]
GO
ALTER TABLE [dbo].[users_jarvis_profiles_permissions]  WITH CHECK ADD  CONSTRAINT [FK_jpp_application_id] FOREIGN KEY([application_id])
REFERENCES [dbo].[applications] ([id])
GO
ALTER TABLE [dbo].[users_jarvis_profiles_permissions] CHECK CONSTRAINT [FK_jpp_application_id]
GO
ALTER TABLE [dbo].[users_jarvis_profiles_permissions]  WITH CHECK ADD  CONSTRAINT [FK_jpp_users_jarvis_id] FOREIGN KEY([user_jarvis_id])
REFERENCES [dbo].[users_jarvis] ([id])
GO
ALTER TABLE [dbo].[users_jarvis_profiles_permissions] CHECK CONSTRAINT [FK_jpp_users_jarvis_id]
GO
ALTER TABLE [dbo].[users_profiles_permissions]  WITH CHECK ADD  CONSTRAINT [FK_application_id] FOREIGN KEY([application_id])
REFERENCES [dbo].[applications] ([id])
GO
ALTER TABLE [dbo].[users_profiles_permissions] CHECK CONSTRAINT [FK_application_id]
GO
ALTER TABLE [dbo].[users_profiles_permissions]  WITH CHECK ADD  CONSTRAINT [FK_application_permission_id] FOREIGN KEY([application_permission_id])
REFERENCES [dbo].[applications_permissions] ([id])
GO
ALTER TABLE [dbo].[users_profiles_permissions] CHECK CONSTRAINT [FK_application_permission_id]
GO
ALTER TABLE [dbo].[users_profiles_permissions]  WITH CHECK ADD  CONSTRAINT [FK_users_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[users_profiles_permissions] CHECK CONSTRAINT [FK_users_id]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Types of documents for individuals' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'types_documents'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Types of genres for individuals' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'types_genders'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Profile type for the jarvis application user' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'types_users_jarvis'
GO
USE [master]
GO
ALTER DATABASE [jarvis] SET  READ_WRITE 
GO

/****** Inserts tables ******/

USE [jarvis]
GO

INSERT INTO [dbo].[types_documents]
           ([id],[name])
     VALUES (1,'CPF'), (2,'SSN')
GO

USE [jarvis]
GO

INSERT INTO [dbo].[types_genders]
           ([id],[name])
     VALUES (1,'Male'), (2,'Female')
GO

USE [jarvis]
GO

INSERT INTO [dbo].[types_users_jarvis]
           ([id],[name])
     VALUES (1,'Default'), (2,'Administrator')
GO

