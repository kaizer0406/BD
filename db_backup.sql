USE [master]
GO
/****** Object:  Database [dbcoaching]    Script Date: 12/10/2022 12:23:11 ******/
CREATE DATABASE [dbcoaching]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbcoaching_Data', FILENAME = N'c:\dzsqls\dbcoaching.mdf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 LOG ON 
( NAME = N'dbcoaching_Logs', FILENAME = N'c:\dzsqls\dbcoaching.ldf' , SIZE = 8192KB , MAXSIZE = 30720KB , FILEGROWTH = 22528KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbcoaching] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbcoaching].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbcoaching] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbcoaching] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbcoaching] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbcoaching] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbcoaching] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbcoaching] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbcoaching] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbcoaching] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbcoaching] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbcoaching] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbcoaching] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbcoaching] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbcoaching] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbcoaching] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbcoaching] SET  ENABLE_BROKER 
GO
ALTER DATABASE [dbcoaching] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbcoaching] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbcoaching] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbcoaching] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbcoaching] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbcoaching] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbcoaching] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbcoaching] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbcoaching] SET  MULTI_USER 
GO
ALTER DATABASE [dbcoaching] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbcoaching] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbcoaching] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbcoaching] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbcoaching] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbcoaching] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [dbcoaching] SET QUERY_STORE = OFF
GO
USE [dbcoaching]
GO
/****** Object:  User [coachingv2_SQLLogin_1]    Script Date: 12/10/2022 12:23:13 ******/
CREATE USER [coachingv2_SQLLogin_1] FOR LOGIN [coachingv2_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [coachingv2_SQLLogin_1]
GO
/****** Object:  Schema [coachingv2_SQLLogin_1]    Script Date: 12/10/2022 12:23:13 ******/
CREATE SCHEMA [coachingv2_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[id] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id_1] [int] NOT NULL,
	[user_id_2] [int] NOT NULL,
	[last_communicate_date] [datetime] NULL,
 CONSTRAINT [PK_Chat] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat_Bot]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat_Bot](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[created_date] [datetime] NOT NULL,
 CONSTRAINT [PK_Chat_Bot] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat_Bot_Session]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat_Bot_Session](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[message] [varchar](50) NOT NULL,
	[is_bot] [bit] NOT NULL,
	[created_date] [datetime] NOT NULL,
	[chat_bot_id] [int] NOT NULL,
 CONSTRAINT [PK_Chat_Bot_Session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chat_Session]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chat_Session](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[message] [varchar](100) NOT NULL,
	[created_date] [datetime] NOT NULL,
	[chat_id] [int] NOT NULL,
 CONSTRAINT [PK_Chat_Session] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[video] [varchar](100) NULL,
	[title] [varchar](50) NOT NULL,
	[description] [varchar](800) NULL,
	[speciality_level_id] [int] NOT NULL,
	[order] [int] NOT NULL,
	[topic_id] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course_Lesson]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course_Lesson](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NULL,
	[description] [varchar](300) NOT NULL,
	[icon] [varchar](100) NULL,
	[is_link] [bit] NOT NULL,
	[link] [varchar](300) NULL,
	[course_id] [int] NOT NULL,
	[order] [int] NOT NULL,
 CONSTRAINT [PK_Course_Lesson] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification_User]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification_User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[send_courses] [bit] NOT NULL,
	[send_follow] [bit] NOT NULL,
	[send_advice] [bit] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_Notification_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](200) NOT NULL,
	[image] [varchar](200) NOT NULL,
	[video] [varchar](50) NULL,
 CONSTRAINT [PK_Speciality] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality_Level]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality_Level](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[speciality_id] [int] NOT NULL,
	[cup_image] [varchar](200) NOT NULL,
	[order] [int] NOT NULL,
	[is_basic] [bit] NOT NULL,
	[level] [varchar](15) NOT NULL,
 CONSTRAINT [PK_Speciality_Level] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality_Level_Certificate]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality_Level_Certificate](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uri] [varchar](180) NOT NULL,
	[company] [varchar](50) NOT NULL,
	[title] [varchar](100) NOT NULL,
	[speciality_level_id] [int] NOT NULL,
 CONSTRAINT [PK_Speciality_Level_Certificate] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality_Level_Test]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality_Level_Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[speciality_level_id] [int] NOT NULL,
	[order] [int] NOT NULL,
	[question] [varchar](250) NOT NULL,
	[answer] [varchar](150) NULL,
 CONSTRAINT [PK_Speciality_Level_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Speciality_Level_Test_Option]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speciality_Level_Test_Option](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[speciality_level_test_id] [int] NOT NULL,
	[option] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Speciality_Level_Test_Option] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Success_Stories]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Success_Stories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[profession] [varchar](50) NOT NULL,
	[age] [int] NOT NULL,
	[city] [varchar](50) NOT NULL,
	[appointment] [varchar](350) NOT NULL,
	[image] [varchar](150) NULL,
 CONSTRAINT [PK_Success_Stoires] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [varchar](50) NOT NULL,
	[color] [varchar](50) NULL,
 CONSTRAINT [PK_Topic_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[names] [varchar](100) NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[mother_last_name] [varchar](100) NOT NULL,
	[birthdate] [datetime] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[token] [varchar](50) NULL,
	[linkedin] [varchar](50) NOT NULL,
	[user_level] [int] NOT NULL,
	[fcm_token] [varchar](200) NULL,
	[level] [varchar](15) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Course]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Course](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[user_speciality_level_id] [int] NOT NULL,
	[is_finish] [bit] NOT NULL,
	[time] [int] NULL,
	[user_id] [int] NOT NULL,
	[order_lesson] [int] NULL,
 CONSTRAINT [PK_User_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Speciality_Level]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Speciality_Level](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[speciality_level_id] [int] NOT NULL,
	[is_finish] [bit] NOT NULL,
 CONSTRAINT [PK_User_Speciality_Level] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Speciality_Level_Test]    Script Date: 12/10/2022 12:23:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Speciality_Level_Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[is_approved] [bit] NOT NULL,
	[user_speciality_level_id] [int] NOT NULL,
	[points] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_User_Speciality_Level_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Chat] ON 

INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (6, 4, 2, CAST(N'2022-08-25T06:27:27.843' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (7, 3, 2, CAST(N'2022-08-27T22:17:15.170' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (8, 2, 5, CAST(N'2022-09-17T21:34:36.883' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (9, 2, 5, CAST(N'2022-09-17T21:34:36.807' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (10, 3, 4, CAST(N'2022-09-24T03:51:18.130' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (11, 3, 5, CAST(N'2022-09-24T03:51:20.980' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (12, 15, 14, CAST(N'2022-09-25T06:16:48.717' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (13, 3, 14, CAST(N'2022-09-29T17:01:50.837' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (14, 22, 16, CAST(N'2022-09-30T06:54:55.370' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (15, 3, 17, CAST(N'2022-09-30T07:00:13.353' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (16, 3, 18, CAST(N'2022-09-30T07:00:17.037' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (17, 3, 19, CAST(N'2022-09-30T07:00:22.907' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (18, 23, 16, CAST(N'2022-09-30T07:00:30.850' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (19, 3, 16, CAST(N'2022-09-30T07:00:34.320' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (20, 23, 17, CAST(N'2022-09-30T07:00:46.817' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (21, 2, 17, CAST(N'2022-09-30T07:02:52.443' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (22, 2, 18, CAST(N'2022-09-30T07:02:57.750' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (23, 2, 19, CAST(N'2022-09-30T07:03:03.443' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (24, 2, 16, CAST(N'2022-09-30T07:03:08.593' AS DateTime))
INSERT [dbo].[Chat] ([id], [user_id_1], [user_id_2], [last_communicate_date]) VALUES (25, 32, 3, CAST(N'2022-10-09T04:36:35.097' AS DateTime))
SET IDENTITY_INSERT [dbo].[Chat] OFF
GO
SET IDENTITY_INSERT [dbo].[Chat_Session] ON 

INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (27, 4, N'Hola', CAST(N'2022-08-25T06:21:19.430' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (28, 2, N'Hola qué tal ', CAST(N'2022-08-25T06:21:32.963' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (29, 2, N'Fjg', CAST(N'2022-08-25T06:22:29.237' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (30, 2, N'Fhc', CAST(N'2022-08-25T06:23:30.363' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (31, 2, N'Jhjg', CAST(N'2022-08-25T06:25:40.740' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (32, 2, N'Hk', CAST(N'2022-08-25T06:25:51.157' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (33, 2, N'Fhh', CAST(N'2022-08-25T06:26:37.890' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (34, 2, N'Etffghhh', CAST(N'2022-08-25T06:26:58.850' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (35, 2, N'Gdjfdug', CAST(N'2022-08-25T06:27:09.600' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (36, 4, N'Fnfjejrj', CAST(N'2022-08-25T06:27:17.677' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (37, 2, N'Fhdg', CAST(N'2022-08-25T06:27:27.843' AS DateTime), 6)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (38, 3, N'Hola??', CAST(N'2022-08-27T09:26:48.360' AS DateTime), 7)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (39, 2, N'Hola Karla que tal?', CAST(N'2022-08-27T22:17:15.170' AS DateTime), 7)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (40, 3, N'Hola', CAST(N'2022-09-24T03:51:18.130' AS DateTime), 10)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (41, 15, N'Hola Kaiti tengo un problema', CAST(N'2022-09-25T06:15:51.863' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (42, 14, N'Hola, ¿qué tipo de problema tienes?', CAST(N'2022-09-25T06:16:07.703' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (43, 15, N'Tengo problema con mis cursos', CAST(N'2022-09-25T06:16:12.763' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (44, 14, N'En una escala del 1 al 5 ¿cuál crees que es tu nivel de comprensión de los contenidos?', CAST(N'2022-09-25T06:16:15.847' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (45, 15, N'3', CAST(N'2022-09-25T06:16:19.647' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (47, 15, N'SOLA', CAST(N'2022-09-25T06:16:26.517' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (49, 15, N'podcast ', CAST(N'2022-09-25T06:16:33.660' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (50, 14, N'Y ¿Cuál fue el tópico que te causó más dificultad?', CAST(N'2022-09-25T06:16:35.603' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (51, 15, N'Design Thinking', CAST(N'2022-09-25T06:16:40.677' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (53, 15, N'Muchas gracias', CAST(N'2022-09-25T06:16:46.577' AS DateTime), 12)
INSERT [dbo].[Chat_Session] ([id], [user_id], [message], [created_date], [chat_id]) VALUES (54, 14, N'Estoy aquí para servirte 
', CAST(N'2022-09-25T06:16:48.717' AS DateTime), 12)
SET IDENTITY_INSERT [dbo].[Chat_Session] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (2, NULL, N'Design thinking', NULL, 2, 1, 1)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (3, NULL, N'Fundamentos de diseño', NULL, 2, 2, 2)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (4, NULL, N'Responsive Design', NULL, 2, 3, 2)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (5, NULL, N'User Testing', NULL, 2, 4, 2)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (6, NULL, N'Brief: Mapear el objetivo principal, alcances', NULL, 2, 5, 3)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (7, NULL, N'Prototipado', NULL, 2, 6, 3)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (8, NULL, N'Pruebas de Usabilidad', NULL, 2, 7, 3)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (9, NULL, N'Métodos redacción de entrevistas', NULL, 3, 1, 1)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (10, NULL, N'Desarrollo de style guide', NULL, 3, 2, 2)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (11, NULL, N'Atomic Design', NULL, 3, 3, 2)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (12, NULL, N'Elaboracion de flujos y mapeo de casuisticas', NULL, 3, 4, 3)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (13, NULL, N'Design Systems', NULL, 4, 1, 2)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (14, NULL, N'Service Design', NULL, 4, 2, 3)
INSERT [dbo].[Course] ([id], [video], [title], [description], [speciality_level_id], [order], [topic_id]) VALUES (15, NULL, N'Customer Experience', NULL, 4, 3, 2)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Course_Lesson] ON 

INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (1, N'', N'Entendimiento de Público Objetivo', NULL, 0, NULL, 2, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (2, N'', N'Comienza conociendo el negocio al que vas y realiza investigaciones secundarias. Tu misma lee o busca en alguna revista de que trata la actividad a realizar.', NULL, 0, NULL, 2, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (3, N'', N'No olvides realizar investigaciones cuantitativas - cualitativas y aptitudinales.', NULL, 0, NULL, 2, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (4, N'', N'Recuerda siempre hacer un Planteamiento de escenario.', NULL, 0, NULL, 2, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (5, N'', N'Con los datos recabados realiza tu lista de preguntas y realizas tus entrevistas a los usuarios. Realiza un user persona para facilitar el trabajo.', NULL, 0, NULL, 2, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (6, N'DATO IMPORTANTE', N'Recuerda realizar un user persona para agrupar a tu grupo de personas con características y gustos similares.', NULL, 0, NULL, 2, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (7, N'', N'No te olvides de visualizar como el publico reacciona a tu producto, que de verdad usan como te dicen que usan tu producto.', NULL, 0, NULL, 2, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (8, N'DATO IMPORTANTE', N'No te olvides de siempre documentar todo lo que tengas.', NULL, 0, NULL, 2, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (9, N'', N'Recopilación de datos', NULL, 0, NULL, 2, 9)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (10, N'', N'Una de las métricas que mas te servirá será el medir la interacción de las personas con tu pagina web y lo lograras midiendo la cantidad de clics que hace una persona en la pagina y como navega en esta misma.', NULL, 0, NULL, 2, 10)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (11, N'', N'Con esto lograras saber a que sesiones van tus usuarios primordialmente, y con ello enfocarte en esos apartados donde tus usuarios tienen mayor interés.', NULL, 0, NULL, 2, 11)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (12, N'DATO IMPORTANTE', N'Es vital realizar investigaciones y conocer el mercado.', NULL, 0, NULL, 2, 12)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (13, N'DATO IMPORTANTE', N'Hacer un benchmarking de soluciones similares te permite encontrar lo mejor de cada opción.', NULL, 0, NULL, 2, 13)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (14, N'DATO IMPORTANTE', N'Con ello lograras tener mas clara tu propuesta diferenciadora.', NULL, 0, NULL, 2, 14)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (15, N'', N'Planteamiento de Insights', NULL, 0, NULL, 2, 15)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (16, N'', N'Luego de realizar todo lo anterior te toca idear.', NULL, 0, NULL, 2, 16)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (17, N'', N'Despliega tus ideas e hipotesis a prototipar', NULL, 0, NULL, 2, 17)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (18, N'', N'MVP', NULL, 0, NULL, 2, 18)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (19, N'', N'Tu producto esta listo para las pruebas cuando ya hay algo funcional.', NULL, 0, NULL, 2, 19)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (20, N'', N'metodologías como lean ux design spirnt te permitirán generar productos rápidos y viables', NULL, 0, NULL, 2, 20)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (21, N'DATO IMPORTANTE', N'Te será de mucha utilidad visualizar casos de otros lados donde aplicaron lo que estas proponiendo.', NULL, 0, NULL, 2, 21)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (22, N'', N'Revisa la gama cromática, los colores primarios y secundarios deben combinar en armonía entre si.', NULL, 0, NULL, 3, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (23, N'', N'La empresas siempre tienen su estandar de colores y deberas usar estos mismos, darle siempre una utilidad.', NULL, 0, NULL, 3, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (24, N'DATO IMPORTANTE', N'No olvides la importancia de la tipografía.', NULL, 0, NULL, 3, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (25, N'', N'Ten mucho detalle en los espaciados de los textos y las grillas.', NULL, 0, NULL, 3, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (26, N'TIP LABORAL', N'Actualmente se debe procurar que la pantalla respire más.', NULL, 0, NULL, 3, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (27, N'TIP LABORAL', N'Debe haber mas espacio donde estas diseñando, que se permita leer claramente todo.', NULL, 0, NULL, 3, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (28, N'', N'No te inventes nada, ya existen estudios y librerías funcionales que son reconocidas por usuarios. Adaptalas a tu producto digital.', NULL, 0, NULL, 3, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (29, N'', N'Revisa información de accesibilidad antes de construir una pantalla.', NULL, 0, NULL, 3, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (30, N'', N'Procura conocer los breakpoints de la pantalla que usaras.', NULL, 0, NULL, 4, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (31, N'', N'estos son las resoluciones, tamaño de pantallas que usaras. Por ejemplo en PC 1920x1080 en IPhone 13 812x375.', NULL, 0, NULL, 4, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (32, N'', N'Evita hacer muy grande la letra en movil o muy pequeño en desktop.', NULL, 0, NULL, 4, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (33, N'TIP LABORAL', N'Un correcto diseño de grilla de 8 puntos facilitara el trabajo de los desarrolladores.', NULL, 0, NULL, 4, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (34, N'', N'La versión responsible debe responder a la misma necesidad que la versión en desktop sin perder la esencia pero haciendolo ad hoc al dispositivo.', NULL, 0, NULL, 4, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (35, N'', N'Es bueno contar historias antes de darle el prototipado.', NULL, 0, NULL, 5, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (36, N'', N'Tambien darles un caso a la persona que vaya a probar tu prototipo.', NULL, 0, NULL, 5, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (37, N'', N'Esto ayudara a que entienda mejor de que trata y que hacer con tu prototipo.', NULL, 0, NULL, 5, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (38, N'TIP LABORAL', N'Las empresas buscan que sepas hacer interacciones en diferentes apps.', NULL, 0, NULL, 5, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (39, N'', N'Las mas usadas: Figma, Adobe XD, MarvelApp.', NULL, 0, NULL, 5, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (40, N'', N'Procura realizar un focus group juntando a personas a que usen tu app.', NULL, 0, NULL, 5, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (41, N'', N'Valida tu producto en todos los aspectos, es normal que el tester se equivoque al navegar.', NULL, 0, NULL, 5, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (42, N'', N'Tener el producto validado con respuesta a todo le será de ayuda al testear.', NULL, 0, NULL, 5, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (43, N'', N'Dirigir bien la entrevista con los testers te ayudara a tener mejores resultados.', NULL, 0, NULL, 5, 9)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (44, N'DATO IMPORTANTE', N'Procura que se respeten los tamaños, legibilidad y se respeten los espaciados de los textos.', NULL, 0, NULL, 5, 10)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (45, N'DATO IMPORTANTE', N'Esto le facilitara la comprensión y testeo correcto de tu solución.', NULL, 0, NULL, 5, 11)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (46, N'', N'Alcances.', NULL, 0, NULL, 6, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (47, N'', N'Es vital identificar de forma correcta tus objetivos.', NULL, 0, NULL, 6, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (48, N'', N'Seguidamente identificas las necesidades.', NULL, 0, NULL, 6, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (49, N'', N'Mapeo OBJ principal', NULL, 0, NULL, 6, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (50, N'', N'El brief debe poder brindarte información que te permita indagar en el problema más que en la solución.', NULL, 0, NULL, 6, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (51, N'', N'Es importante validar el brief con todos los stkh involucrados en la ejecución de la tarea (estar alineados).', NULL, 0, NULL, 6, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (52, N'', N'Ver como el usuario va a interactuar con la soluciòn.', NULL, 0, NULL, 6, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (53, N'DATO IMPORTANTE', N'Es importante detallar las fases del producto.', NULL, 0, NULL, 6, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (54, N'EJEMPLO', N'El usuario ve la app, la descarga, ahi tiene el primer contacto.', NULL, 0, NULL, 6, 9)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (55, N'EJEMPLO', N'Abre la app y entra a diferentes apartados.', NULL, 0, NULL, 6, 10)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (56, N'EJEMPLO', N'Esto te permite saber que apartados son los mas vistoso en tu app y a cuales meterle mas detalle.', NULL, 0, NULL, 6, 11)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (57, N'', N'Solicitar dentro del brief el tipo de comunicación que queremos tener con la iniciativa.', NULL, 0, NULL, 6, 12)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (58, N'', N'Ahora que sabes las necesidades de tu cliente entiendes sus dolores e insights es hora de prototipar!', NULL, 0, NULL, 7, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (59, N'', N'Y prototipar no es más que presentar en un papel o de manera digital como sería el flujo de la aplicación.', NULL, 0, NULL, 7, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (60, N'', N'Recuerda que existen 3 tipos de prototipado según su fidelidad.', NULL, 0, NULL, 7, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (61, N'', N'Prototipado de Baja Fidelidad, Media y Alta', NULL, 0, NULL, 7, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (62, N'', N'En el prototipado de baja fidelidad son a papel y vas conociendo si el primer borrador va de acuerdo a solucionar las necesidades de tus clientes.', NULL, 0, NULL, 7, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (63, N'', N'Si ya te sientes bastante convencida de lo que has plasmado en papel puedes intentar pasar al prototipado de media fidelidad.', NULL, 0, NULL, 7, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (64, N'', N'Lo cual es pasar tu prototipo a un medio digital para hacer ciertas validaciones de usabilidad y demás.', NULL, 0, NULL, 7, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (65, N'TIP LABORAL', N'No te olvides que este prototipado será consumido por la diseñadora UI.', NULL, 0, NULL, 7, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (66, N'', N'Ya que en este último prototipado de alta fidelidad se encargará de pasarlo a una herramienta más pulida como lo es Figma, Adobe XD, etc.', NULL, 0, NULL, 7, 9)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (67, N'', N'Y una vez ahí se encargará de conectar los prototipos y demás así como afinar los colores, tamaños y formas.', NULL, 0, NULL, 7, 10)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (68, N'', N'Comienza haciendo los casos de prueba en los cuales explicas las acciones a realizar en la aplicación.', NULL, 0, NULL, 8, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (69, N'', N'Otro punto importante es saber es que los tipos de funcionalidades condiciona el tamaño de los usuarios que los probarán.', NULL, 0, NULL, 8, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (70, N'', N'En este caso los podemos dividir en 2: Probar una funcionalidad chica y grande.', NULL, 0, NULL, 8, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (71, N'', N'Si vas a probar una funcionalidad chiquita realizar pruebas de guerrilla es tu mejor opción.', NULL, 0, NULL, 8, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (72, N'', N'Lo cual es mandar a probar la funcionalidad a un público más grande.', NULL, 0, NULL, 8, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (73, N'', N'Y si vas a probar una funcionalidad grande se reduce el foco de personas.', NULL, 0, NULL, 8, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (74, N'DATO IMPORTANTE', N'Es importante que las tareas que tiene que cumplir el usuario no sesguemos.', NULL, 0, NULL, 8, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (75, N'', N'Es estratégico poder obtener data cuantitativa del flujo que cumple el usuario en tu protipo (por ej. utilizar Maze).', NULL, 0, NULL, 8, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (76, N'', N'Procura que la entrevista con tu cliente este lo más preciso posible.', NULL, 0, NULL, 9, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (77, N'', N'Esto ayudara a tu equipo a hacer unos correctos casos de uso e historias de usuario.', NULL, 0, NULL, 9, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (78, N'TIP LABORAL', N'En las entrevistas con tu gerente procura explicar como tu solución beneficia a la empresa.', NULL, 0, NULL, 9, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (79, N'TIP LABORAL', N'Siempre debes demostrarlo con data cuantitativa.', NULL, 0, NULL, 9, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (80, N'', N'Preguntas que te ayudaran ¿Porque haces esto? ¿De que manera esto beneficiara a las ventas?', NULL, 0, NULL, 9, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (81, N'TIP LABORAL', N'Realizar un guion es importante para las entrevistas.', NULL, 0, NULL, 9, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (82, N'', N'Pero cada proyecto es diferente y este guion debe ir cambiando.', NULL, 0, NULL, 9, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (83, N'', N'Siempre en pro de tener la información clara y precisa de ambas partes.', NULL, 0, NULL, 9, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (84, N'TIP LABORAL', N'Presentación a negocio (resultados): es importante hablar en números y tener en cuenta el perfil al que te estás dirigiendo.', NULL, 0, NULL, 9, 9)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (85, N'', N'Debes combinar las cosas y se sienta accesible.', NULL, 0, NULL, 10, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (86, N'', N'Que se sienta que ya se uso antes, procura que se mantenga el  branding de la empresa.', NULL, 0, NULL, 10, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (87, N'TIP LABORAL', N'Debes conocer muy bien auto layout para poder realizar las actividades mencionadas de manera correcta.', NULL, 0, NULL, 10, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (88, N'TIP LABORAL', N'Dominar la guía de estilos te será muy útil en el campo laboral.', NULL, 0, NULL, 10, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (89, N'', N'Diseño en alta fidelidad', NULL, 0, NULL, 10, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (90, N'', N'Es obligatorio que la pantalla final que hemos diseñado haya pasado por un testeo de usubilidad.', NULL, 0, NULL, 10, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (91, N'', N'Puedes presentarlo como un prototipo o para que se entienda el flujo en un user journey.', NULL, 0, NULL, 10, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (92, N'', N'Es importante saber para que tipos de dispositivos estamos diseñando y el diseño debe responder a ese tamaño y composición.', NULL, 0, NULL, 10, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (93, N'', N'Es bueno usar elemento ya construidos, para ahorrar tiempo en el diseño.', NULL, 0, NULL, 11, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (94, N'TIP LABORAL', N'Herramientas como UIKIT te facilitaran el trabajo.', NULL, 0, NULL, 11, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (95, N'', N'Es importante saber como se llama cada componente dentro de tu aplicación de modelado.', NULL, 0, NULL, 11, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (96, N'', N'ReadyButtons, Checksboxes, entre otros.', NULL, 0, NULL, 11, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (97, N'', N'El atomic design te permite crear sistemas complejos ad hoc a tu producto digital', NULL, 0, NULL, 11, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (98, N'', N'Es importante construir los átomos como parte de un sistema de diseño con nomenclaturas y lógica de orden adecuada a tu equipo.', NULL, 0, NULL, 11, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (99, N'', N'Arquitectura de Sistemas', NULL, 0, NULL, 12, 1)
GO
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (100, N'', N'Se trata de desglosar que tipo de pantallas van a a ir en la presentación.', NULL, 0, NULL, 12, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (101, N'', N'Recuerda que categorizar los prototipos realizados te ayuda a organizarte mejor.', NULL, 0, NULL, 12, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (102, N'', N'Customer Journey Map', NULL, 0, NULL, 12, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (103, N'', N'Importante hacer tu Customer Jorney Map.', NULL, 0, NULL, 12, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (104, N'', N'Un Customer Jorney Map son los pasos a realizar por tu usuario en la aplicación.', NULL, 0, NULL, 12, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (105, N'DATO IMPORTANTE', N'Es importante saber que se esta diseñando y tener un feedback del UI.', NULL, 0, NULL, 12, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (106, N'', N'El cual puede indicarte a nivel visual si algunas pantallas se repiten o no siguen el flujo.', NULL, 0, NULL, 12, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (107, N'TIP LABORAL', N'Puedes hacer como base un service blueprint y sobre eso desglozarlo hasta que llegue a un customer journey map.', NULL, 0, NULL, 12, 9)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (108, N'DATO IMPORTANTE', N'Es vital tener un buen mapeo de todas las posibilidades a realizar en la solución.', NULL, 0, NULL, 12, 10)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (109, N'', N'Recuerda que el design systems son los lineamientos de diseño.', NULL, 0, NULL, 13, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (110, N'', N'Debes entender en que medida se manejan las pantallas.', NULL, 0, NULL, 13, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (111, N'', N'En web usan pixel En movil DPI.', NULL, 0, NULL, 13, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (112, N'DATO IMPORTANTE', N'Saber las conversiones de estos te será de mucha ayuda.', NULL, 0, NULL, 13, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (113, N'TIP LABORAL', N'El espaciado, la forma, componentes realizados de manera correcta Te serán de mucha ayuda en el mundo laboral.', NULL, 0, NULL, 13, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (114, N'DATO IMPORTANTE', N'El DSM te permite ahorrar tiempo en la ejecución de pantallas.', NULL, 0, NULL, 13, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (115, N'', N'El DSM te permite mantener un lineamiento en las pantallas considerando el branding y componentes estandarizados.', NULL, 0, NULL, 13, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (116, N'', N'El DSM es un repositorio con la construcción correcta de todos los componentes de tu producto digital.', NULL, 0, NULL, 13, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (117, N'', N'Comienza por comparar ciertas aplicaciones y como te sientes al usar sus funcionalidades.', NULL, 0, NULL, 14, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (118, N'', N'Por ello, es importante que le des un enfoque más psicológico a este punto.', NULL, 0, NULL, 14, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (119, N'EJEMPLO', N'Últimamente se esta gamificando servicios como parte de su diseño.', NULL, 0, NULL, 14, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (120, N'', N'Gamificación', NULL, 0, NULL, 14, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (121, N'', N'Gamificación se refiere al uso de técnicas de videojuegos las cuales incentivan a la persona mediante trofeos, logros o recompensas para que sigan progresando o midiendo su avance.', NULL, 0, NULL, 14, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (122, N'', N'Por ello, es importante saber que tipo de conductas motivan al ser humano o que tipo de experiencias les hace más fascinantes o no como parte del diseño del servicio.', NULL, 0, NULL, 14, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (123, N'EJEMPLO', N'Desbloqueo de trofeos por buen consumidor, subir de nivel como comprador, etc.', NULL, 0, NULL, 14, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (124, N'DATO IMPORTANTE', N'Antes de inciar con el desarrollo de un producto digital es importante validar que servicios vamos a necesitar.', NULL, 0, NULL, 14, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (125, N'TIP LABORAL', N'Identificar si necesitamos validar identidad y sobre eso construir el servicio en paralelo con la ejecución del campo (research).', NULL, 0, NULL, 14, 9)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (126, N'', N'UX Writing', NULL, 0, NULL, 15, 1)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (127, N'', N'Significa la forma de hablar en base a tu público dirigido.', NULL, 0, NULL, 15, 2)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (128, N'', N'Por ejemplo:  Si es una app más seria palabras más formales es la clave.', NULL, 0, NULL, 15, 3)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (129, N'', N'Accesibilidad', NULL, 0, NULL, 15, 4)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (130, N'', N'Recuerda que hay gente que presenta cierta dificultad al momento de usar la app.', NULL, 0, NULL, 15, 5)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (131, N'', N'Así que hacer una app más inclusiva nos ayudará a ser más empáticos con ellas.', NULL, 0, NULL, 15, 6)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (132, N'EJEMPLO', N'Personas con miopía o daltónicas.', NULL, 0, NULL, 15, 7)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (133, N'TIP LABORAL', N'Es importante incluir al CX dentro del research.', NULL, 0, NULL, 15, 8)
INSERT [dbo].[Course_Lesson] ([id], [title], [description], [icon], [is_link], [link], [course_id], [order]) VALUES (134, N'TIP LABORAL', N'Porque el cx construye la funcionalidad tecnicamente pero tiene que considerar la necesidad del usuario.', NULL, 0, NULL, 15, 9)
SET IDENTITY_INSERT [dbo].[Course_Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Notification_User] ON 

INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (2, 1, 1, 1, 2)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (3, 1, 1, 1, 3)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (4, 1, 1, 1, 4)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (5, 1, 1, 1, 5)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (6, 1, 1, 1, 6)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (7, 1, 1, 1, 7)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (8, 1, 1, 1, 8)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (9, 1, 1, 1, 9)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (10, 1, 1, 1, 10)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (11, 1, 1, 1, 11)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (12, 1, 1, 1, 12)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (13, 1, 1, 1, 13)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (14, 1, 1, 1, 14)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (15, 1, 1, 1, 15)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (16, 1, 1, 1, 16)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (17, 1, 1, 1, 17)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (18, 1, 1, 1, 18)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (19, 1, 1, 1, 19)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (20, 1, 1, 1, 20)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (21, 1, 1, 1, 21)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (22, 1, 1, 1, 22)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (23, 1, 1, 1, 23)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (24, 1, 1, 1, 24)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (25, 1, 1, 1, 25)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (26, 1, 1, 1, 26)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (27, 1, 1, 1, 27)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (28, 1, 1, 1, 28)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (29, 1, 1, 1, 29)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (30, 1, 1, 1, 30)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (31, 1, 1, 1, 31)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (32, 1, 1, 1, 32)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (33, 1, 1, 1, 33)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (34, 1, 1, 1, 34)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (35, 1, 1, 1, 35)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (36, 1, 1, 1, 36)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (37, 1, 1, 1, 37)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (38, 1, 1, 1, 38)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (39, 1, 1, 1, 39)
INSERT [dbo].[Notification_User] ([id], [send_courses], [send_follow], [send_advice], [user_id]) VALUES (40, 1, 1, 1, 40)
SET IDENTITY_INSERT [dbo].[Notification_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality] ON 

INSERT [dbo].[Speciality] ([id], [name], [description], [image], [video]) VALUES (3, N'Diseño UX/UI', N'Aprende a diseñar interfaces para entornos móviles y web con un enfoque en la experiencia del usuario.', N'https://aufaitux.com/wp-content/uploads/2020/05/UIUX-designing-1.jpg', N'7stBhMSp-R8')
SET IDENTITY_INSERT [dbo].[Speciality] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality_Level] ON 

INSERT [dbo].[Speciality_Level] ([id], [name], [speciality_id], [cup_image], [order], [is_basic], [level]) VALUES (2, N'Basico', 3, N'https://images.vexels.com/media/users/3/145120/isolated/preview/4a6bd8897dc5623d1906bd38541fb3a1-icono-de-copa-deportiva-by-vexels.png', 1, 0, N'BASICO')
INSERT [dbo].[Speciality_Level] ([id], [name], [speciality_id], [cup_image], [order], [is_basic], [level]) VALUES (3, N'Intermedio', 3, N'https://images.vexels.com/media/users/3/145120/isolated/preview/4a6bd8897dc5623d1906bd38541fb3a1-icono-de-copa-deportiva-by-vexels.png', 1, 0, N'INTERMEDIO')
INSERT [dbo].[Speciality_Level] ([id], [name], [speciality_id], [cup_image], [order], [is_basic], [level]) VALUES (4, N'Avanzado', 3, N'https://images.vexels.com/media/users/3/145120/isolated/preview/4a6bd8897dc5623d1906bd38541fb3a1-icono-de-copa-deportiva-by-vexels.png', 1, 0, N'AVANZADO')
SET IDENTITY_INSERT [dbo].[Speciality_Level] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality_Level_Certificate] ON 

INSERT [dbo].[Speciality_Level_Certificate] ([id], [uri], [company], [title], [speciality_level_id]) VALUES (1, N'https://www.crehana.com/cursos-online-ui-ux/fundamentos-del-diseno-ux/', N'Crehana', N'Curso online de Fundamentos del Diseño UX', 2)
INSERT [dbo].[Speciality_Level_Certificate] ([id], [uri], [company], [title], [speciality_level_id]) VALUES (2, N'https://www.coursera.org/professional-certificates/diseno-de-experiencia-del-usuario-ux-de-google?utm_campaign=gwgsite&utm_medium=institutions&utm_source=google', N'Coursera', N'Diseño de Experiencia del Usuario (UX)', 3)
INSERT [dbo].[Speciality_Level_Certificate] ([id], [uri], [company], [title], [speciality_level_id]) VALUES (3, N'https://www.coursera.org/professional-certificates/diseno-de-experiencia-del-usuario-ux-de-google?utm_campaign=gwgsite&utm_medium=institutions&utm_source=google', N'Coursera', N'Diseño de Experiencia del Usuario (UX)', 4)
SET IDENTITY_INSERT [dbo].[Speciality_Level_Certificate] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality_Level_Test] ON 

INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (1, 2, 1, N'1. La _______ no forma parte del proceso de diseño UX.', N'Implementación')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (2, 2, 2, N'2. El diseño de interfaz de usuario es un conjunto de herramientas que nos ayudan a crear interfaces entre los usuarios y productos finales.', N'Verdadero')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (3, 2, 3, N'3. El Diseño UI no necesariamente tiene que ser accesible, pero sí debe ser interactivo.', N'Falso')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (4, 2, 4, N'4. Si hablamos de productos digitales, la usabilidad es un conjunto de técnicas gráficas que ayudan a las personas a realizar sus tareas fácilmente y a mejorar la experiencia de usuario.', N'Verdadero')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (5, 3, 1, N'1. Completa el espacio en blanco: Los esquemas de página establecen la _____ básica de una página y sirven para definir una experiencia digital.', N'estructura')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (6, 3, 2, N'2. ¿Cuál de los tipos de fidelidad de diseño utilizarías si necesitaras obtener ideas rápido y a la vez dejar espacio para la exploración?', N'Diseño de baja fidelidad')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (7, 3, 3, N'3.Imagina que estás preparando preguntas de investigación para el diseño de un monitor de actividad física. ¿Cuál de las siguientes preguntas se aplica a un método de investigación cualitativa?', N'¿Qué tan fácil fue para los usuarios acceder a la aplicación mientras caminaban?')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (8, 3, 4, N'4. Deseas medir de manera cuantificable qué tan bien completaron los usuarios las tareas para tu prototipo de diseño al pedirles que completen un cuestionario que mida la usabilidad. ¿Qué KPI debes usar?', N'Escala de usabilidad del sistema')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (9, 3, 5, N'5. ¿Por qué los estudios de usabilidad son importantes para la investigación en UX?', N'Proporcionan comentarios de los usuarios que ayudan al equipo de diseño a realizar mejoras en la experiencia del usuario.')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (10, 4, 1, N'1. Independientemente de las tendencias actuales, lo más importante que debe tener en cuenta un diseñador son los usuarios y el contexto de sus necesidades.', N'Verdadero')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (11, 4, 2, N'2. Imagina que diseñas una herramienta de aprendizaje para jóvenes lectores para el laboratorio de informática de la biblioteca pública local. Considera al usuario e identifica qué filosofía de diseño funciona mejor para esta herramienta.', N'Degradación correcta')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (12, 4, 3, N'3. Elige la definición correcta de un estudio de usabilidad.', N'Un método de investigación que evalúa qué tan fácil es para los participantes completar las tareas principales de un producto')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (13, 4, 4, N'4. Las maquetas deben cumplir con los principios de diseño visual, e incluir elementos de diseño como tipografía, color e iconografía.', N'Verdadero')
INSERT [dbo].[Speciality_Level_Test] ([id], [speciality_level_id], [order], [question], [answer]) VALUES (14, 4, 5, N'5. Al crear maquetas de un sitio web adaptable, el equipo de diseño debe fabricar maquetas para varios tamaños de pantalla.', N'Verdadero')
SET IDENTITY_INSERT [dbo].[Speciality_Level_Test] OFF
GO
SET IDENTITY_INSERT [dbo].[Speciality_Level_Test_Option] ON 

INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (1, 1, N'Investigación')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (2, 1, N'Prueba')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (3, 1, N'Implementación')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (4, 1, N'Organización')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (5, 2, N'Verdadero')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (6, 2, N'Falso')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (7, 3, N'Verdadero')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (8, 3, N'Falso')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (9, 4, N'Verdadero')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (10, 4, N'Falso')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (11, 5, N'estructura')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (12, 5, N'especificaciones funcionales')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (13, 5, N'texto')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (14, 5, N'imágenes')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (15, 6, N'Diseño de fidelidad media')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (16, 6, N'Diseño de baja fidelidad')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (17, 6, N'Diseño de alta fidelidad')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (18, 7, N'¿Cuántas millas caminaba normalmente un usuario en una semana?')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (19, 7, N'¿Cuántas veces accedió el usuario a la aplicación al día?')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (20, 7, N'¿Qué tan fácil fue para los usuarios acceder a la aplicación mientras caminaban?')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (21, 7, N'¿Con qué frecuencia accedió el usuario a la aplicación mientras caminaba?')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (22, 8, N'Escala de usabilidad del sistema')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (23, 8, N'Uso de la navegación frente a la búsqueda')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (24, 8, N'Tasa de conversión')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (25, 8, N'Tasa de error del usuario')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (26, 9, N'Dan a los diseñadores una última oportunidad de obtener comentarios de los usuarios antes de la producción.')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (27, 9, N'Proporcionan comentarios de los usuarios que ayudan al equipo de diseño a realizar mejoras en la experiencia del usuario.')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (28, 9, N'Solicitan comentarios positivos de los usuarios.')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (29, 10, N'Verdadero')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (30, 10, N'Falso')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (31, 11, N'Ascendente')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (32, 11, N'Mejora progresiva')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (33, 11, N'Mobile first')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (34, 11, N'Degradación correcta')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (35, 12, N'Un método de investigación que evalúa qué tan fácil es para los participantes completar las tareas principales de un producto')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (36, 12, N'Un gráfico de fácil comprensión que explica todo lo que los diseñadores han aprendido sobre un usuario')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (37, 12, N'Una evaluación de las fortalezas y debilidades de los competidores')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (38, 12, N'Una serie de experiencias que tiene un usuario al interactuar con un producto para lograr un objetivo específico')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (39, 13, N'Verdadero')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (40, 13, N'Falso')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (41, 14, N'Verdadero')
INSERT [dbo].[Speciality_Level_Test_Option] ([id], [speciality_level_test_id], [option]) VALUES (42, 14, N'Falso')
SET IDENTITY_INSERT [dbo].[Speciality_Level_Test_Option] OFF
GO
SET IDENTITY_INSERT [dbo].[Success_Stories] ON 

INSERT [dbo].[Success_Stories] ([id], [name], [profession], [age], [city], [appointment], [image]) VALUES (1, N'Mariela Yamamoto', N'UI/UX Designer en Interbank', 28, N'Lima, Perú', N'“Soy feliz diseñando las mejores interfaces y promoviendo a que más personas se sumen a este mundo”', N'https://cutt.ly/jC7VCsn')
INSERT [dbo].[Success_Stories] ([id], [name], [profession], [age], [city], [appointment], [image]) VALUES (2, N'Andrea Muñoz Cobos', N'UI/UX Designer en Interbank', 26, N'Lima, Perú', N'“Soy feliz resolviendo problemas en base a insights y data. Asimismo, me encanta trabajar en equipos multifuncionales y busco siempre estar aprendiendo nuevas cosas del mundo del UX/UI.”', N'https://cutt.ly/WC7VW46')
INSERT [dbo].[Success_Stories] ([id], [name], [profession], [age], [city], [appointment], [image]) VALUES (3, N'Shiara Arauzo', N'UX Designer en ID BI', 23, N'Lima, Perú', N'“Mi meta con cada proyecto que participo es poder humanizar procesos haciendo de estos más sencillos y accesibles para los usuarios. Me encanta participar e involucrarme en el desarrollo de distintas aplicaciones porque enriquece mi juicio en cuestión de diseño y me permite conocer y aprender mucho más sobre el área que me apasiona.”', N'https://cutt.ly/5C74uS9')
SET IDENTITY_INSERT [dbo].[Success_Stories] OFF
GO
SET IDENTITY_INSERT [dbo].[Topic] ON 

INSERT [dbo].[Topic] ([id], [title], [color]) VALUES (1, N'UX Research', N'#00c2a8')
INSERT [dbo].[Topic] ([id], [title], [color]) VALUES (2, N'Diseño UI', N'#fccf0c')
INSERT [dbo].[Topic] ([id], [title], [color]) VALUES (3, N'Diseño UX', N'#ff3a3a')
SET IDENTITY_INSERT [dbo].[Topic] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (2, N'Miriam', N'Roca', N'Baldeon', CAST(N'2002-08-14T00:00:00.000' AS DateTime), N'joenis0406@gmail.com', N'wh29KOfRWPAlFh4rZMlRVw==', N'576225', N'', 0, N'fcemtg8MRn2LHjoMrYJG8e:APA91bFuyn5NvuOj2TYw-KN-yjjm0EhqFfycdv0z_mnJ18UQZNbKskMKrIdD5D6_1RUWLsMbMJrixdOEWY9Naf-ncKBG2uUdkiTML6WfBFHjvUXDMwbEqXmjGJHNIEqw3x1xeZnLdh8S', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (3, N'Karla', N'Martínez', N'Julca', CAST(N'2000-08-23T00:00:00.000' AS DateTime), N'Karlos22813@gmail.com', N'ghreGp+cXEWem2WCbcOxIQ==', NULL, N'', 0, N'dcbcfy-TT9-ohifSkV2dJw:APA91bEhxWYbMS5vRREl77FXNNm5-OrpUppZ2oFA8PI9cL-y5u-Q5tHDd8vEhUjdXrgcShuNFtuv2rblPaavqFuHQfitKIXjD9tRMuLGOHwZXW0_yZkiX-l9DMnMVOt4NLxX05bruWK7', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (4, N'juana', N'Perez', N'Torres', CAST(N'2000-08-24T00:00:00.000' AS DateTime), N'pruebas.123147@gmail.com', N'eMWxPf07iICIj3uyCi9d+Q==', NULL, N'Juan Pérez ', 0, N'cmH2kiGxSE6Y7QVULnP3ji:APA91bEsZPfbVj2mRQflRK8uzYPlaa040rKL4FDM2DilvhJLeXu5Bbte0SvUwqzv1gjfuDURPX2dK0T7sPlgpyZ3MZIu2nnPb4tBgRDUDP3Oe9bZmL_KFIZFjqED243QphKW-pVPY3Hr', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (5, N'Zizi', N'Mendieta', N'Roca', CAST(N'2002-08-16T00:00:00.000' AS DateTime), N'jmendieta0406@gmail.com', N'SaD1ibwxC0xmMOiWkrwzEw==', NULL, N'', 0, N'fkuSpsVGTrO1Z5y3A4xuG-:APA91bFqavcOuMsHNcm_v8uETCM3V7WVbx47yizzVyJGBkxzCpST4nPSvL5N6sf2NtFulPEtAz10AGH_fMMquPrRiFSbczHJRR6USganGgiCMF19aTMZyU3ZmZhPXnpGit3SVbgZUoYb', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (6, N'Gabriela', N'Campos', N'Peña', CAST(N'2000-09-09T00:00:00.000' AS DateTime), N'Gabriela.cp@gmail.com', N'VOagiCWtnphKZdDnywbESg==', NULL, N'', 0, N'esR5c4X-SB-_SM4tiQWyR1:APA91bGWcvoVIjxyi7E6OxcbM9wxeDG8HpVxW81GOFVExXHbCBQarT0AH0l6GRl2C3KehS6376UQMqWPR3VaodP4jHvXsr_jLUAcnsOp22mXCvbGYW2UZdvJ_uSoqYpLFjiRYAOUlRiC', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (7, N'Kelly', N'Rodriguez', N'Cabanillas', CAST(N'2002-09-17T00:00:00.000' AS DateTime), N'Keller.rodriguez@yahoo.es', N'Pi7ozDJeFmMjkxran6GrVw==', NULL, N'', 0, N'elkDmEquRpO33nu-LgxtXa:APA91bE9vAETi7wY5OHWKXdHiZpQbnruLlMFDUaGRAJyqZwHLCK-ppPGo0VaoCAQAJRB9jt0rw2JZnXNl2aqNL3YZwejJZM0wOe3vSlZHodzbCJIeml-9rHDVdLvHeo7Dp8f_7-MrCQU', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (8, N'Keller', N'Rodríguez ', N'Cabanillas', CAST(N'2002-09-17T00:00:00.000' AS DateTime), N'Krodriguezcabanillas@gmail.com', N'Pi7ozDJeFmMjkxran6GrVw==', NULL, N'', 0, N'elkDmEquRpO33nu-LgxtXa:APA91bE9vAETi7wY5OHWKXdHiZpQbnruLlMFDUaGRAJyqZwHLCK-ppPGo0VaoCAQAJRB9jt0rw2JZnXNl2aqNL3YZwejJZM0wOe3vSlZHodzbCJIeml-9rHDVdLvHeo7Dp8f_7-MrCQU', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (9, N'Juana', N'Pérez', N'León', CAST(N'2001-09-17T00:00:00.000' AS DateTime), N'Juana.pleon@yahoo.es', N'i7lpaCh+waZcc4adlB8YAg==', NULL, N'', 0, N'elkDmEquRpO33nu-LgxtXa:APA91bE9vAETi7wY5OHWKXdHiZpQbnruLlMFDUaGRAJyqZwHLCK-ppPGo0VaoCAQAJRB9jt0rw2JZnXNl2aqNL3YZwejJZM0wOe3vSlZHodzbCJIeml-9rHDVdLvHeo7Dp8f_7-MrCQU', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (10, N'Natalia', N'Roldán', N'Benites', CAST(N'2001-09-17T00:00:00.000' AS DateTime), N'Nataliarb@gmail.com', N'EFW4X1xrJII0FFWBH6TulQ==', NULL, N'', 0, N'elkDmEquRpO33nu-LgxtXa:APA91bE9vAETi7wY5OHWKXdHiZpQbnruLlMFDUaGRAJyqZwHLCK-ppPGo0VaoCAQAJRB9jt0rw2JZnXNl2aqNL3YZwejJZM0wOe3vSlZHodzbCJIeml-9rHDVdLvHeo7Dp8f_7-MrCQU', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (11, N'Diana', N'Lagos', N'Ruiz', CAST(N'2001-09-30T00:00:00.000' AS DateTime), N'Dianalruiz@gmail.com', N'u7JyuRUfcznZM9ECuf9IHA==', NULL, N'', 0, N'elkDmEquRpO33nu-LgxtXa:APA91bE9vAETi7wY5OHWKXdHiZpQbnruLlMFDUaGRAJyqZwHLCK-ppPGo0VaoCAQAJRB9jt0rw2JZnXNl2aqNL3YZwejJZM0wOe3vSlZHodzbCJIeml-9rHDVdLvHeo7Dp8f_7-MrCQU', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (12, N'Josefina', N'Rodríguez ', N'Pérez', CAST(N'2001-09-17T00:00:00.000' AS DateTime), N'Josefa13@gmail.com', N'Pi7ozDJeFmMjkxran6GrVw==', NULL, N'', 0, N'elkDmEquRpO33nu-LgxtXa:APA91bE9vAETi7wY5OHWKXdHiZpQbnruLlMFDUaGRAJyqZwHLCK-ppPGo0VaoCAQAJRB9jt0rw2JZnXNl2aqNL3YZwejJZM0wOe3vSlZHodzbCJIeml-9rHDVdLvHeo7Dp8f_7-MrCQU', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (13, N'Ana María ', N'León', N'Pérez', CAST(N'2001-09-17T00:00:00.000' AS DateTime), N'Anamaria@gmail.com', N'dVl6yTt7Tdy/N7Hl4kQvrw==', NULL, N'', 0, N'elkDmEquRpO33nu-LgxtXa:APA91bE9vAETi7wY5OHWKXdHiZpQbnruLlMFDUaGRAJyqZwHLCK-ppPGo0VaoCAQAJRB9jt0rw2JZnXNl2aqNL3YZwejJZM0wOe3vSlZHodzbCJIeml-9rHDVdLvHeo7Dp8f_7-MrCQU', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (14, N'Kaiti', N'Mitchel', N'', CAST(N'2002-09-25T00:00:00.000' AS DateTime), N'robertcald5256@gmail.com', N'a8eYFAFdHEsRpUdtpAgzoA==', NULL, N'', 0, N'eoNFfsH2SMONxs-BDyArhK:APA91bGFG9ZoVXq3Unv5-OGCz1tu6cdREpOqbCfMQObNt2nmSnz6KS-7XWEL3Ps3YnjqatFpefa5xExxtLEtHlrAQxyWmj-FfSzwKeNdvSKbJrDJfoyYIpRq5N8SYcXc3IP7oW55p3cI', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (15, N'Maria', N'Mendieta', N'Martínez', CAST(N'2000-09-25T00:00:00.000' AS DateTime), N'Maria12@gmail.com', N'VOagiCWtnphKZdDnywbESg==', NULL, N'', 0, N'c-EqZpl0B2BOy3bLmwT1u7:APA91bHUlwLicCSkUDWCRPcdkvWMzGj_a91gJOTxV5lbOvxEFLHj79veAC2VA3u5kwdbr17a34wnAad6pxvOrufh8VZUPCROBDMlYs8CZEB2PkdZv664r7dMPe5GT42ejqMTti8sw1Vt', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (16, N'Maria Sofia', N'Herrera', N'Urcia', CAST(N'2004-09-25T00:00:00.000' AS DateTime), N'MariaSH@gmail.com', N'v+uhkCwKZ5VQdV1We/IwGQ==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (17, N'Molly Alejandra', N'Anderson', N'Cabanillas', CAST(N'2003-08-08T00:00:00.000' AS DateTime), N'MollyAC15@gmail.com', N'5erbTHhWLxSk0FGyG3O2EQ==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (18, N'Alexandra Johanna', N'Arias', N'Bejarano', CAST(N'2000-05-19T00:00:00.000' AS DateTime), N'Alexandra2265@gmail.com', N'8P0xRtS9H3G86fTtB/nucw==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (19, N'Aldana Jorja', N'Privat', N'Ramírez', CAST(N'2003-10-11T00:00:00.000' AS DateTime), N'AldaJPrivat@gmail.com', N'8zikw+tP34EL2kS0oWyXIA==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (20, N'Angie Stephanie', N'Ortiz', N'Avalos', CAST(N'2001-03-04T00:00:00.000' AS DateTime), N'AngieOAvl@gmail.com', N'fjv8SST/tl+0LhAGfOZj0w==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (21, N'Camila Valeria', N'Baldera', N'Gutierrez', CAST(N'2003-06-06T00:00:00.000' AS DateTime), N'CamiVBG@gmail.com', N'VMetsy2P028pcpTGI61lqw==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (22, N'Krystel Andrea', N'Cossio', N'Coria', CAST(N'2005-05-08T00:00:00.000' AS DateTime), N'KrysCC@gmail.com', N'oWYNYBtHGDO7BJbyM2ZOeQ==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (23, N'Esthefany Nicol', N'Guivin', N'Albino', CAST(N'2005-12-17T00:00:00.000' AS DateTime), N'EsthefanyNGA@gmail.com', N'uobacBzbe84OPYEqeT3atg==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (24, N'Gianella Jhire', N'Ramos', N'Aranda', CAST(N'2004-01-30T00:00:00.000' AS DateTime), N'GianeRamosA@gmail.com', N'uyBtMWnMT1G9pxeMy+iFRw==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (25, N'Nicole', N'Santa Cruz', N'López', CAST(N'2005-09-30T00:00:00.000' AS DateTime), N'AleSantaCruz@gmail.com', N'0tUptFds/WrpmPCPUj/qXQ==', NULL, N'', 0, N'dcbcfy-TT9-ohifSkV2dJw:APA91bEhxWYbMS5vRREl77FXNNm5-OrpUppZ2oFA8PI9cL-y5u-Q5tHDd8vEhUjdXrgcShuNFtuv2rblPaavqFuHQfitKIXjD9tRMuLGOHwZXW0_yZkiX-l9DMnMVOt4NLxX05bruWK7', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (26, N'Fabiana Nicolle', N'Aguirre', N'Serrano', CAST(N'2004-11-24T00:00:00.000' AS DateTime), N'Fabiana_AS@gmail.com', N'm7HWoFMoIABpRC/Vhwc+xw==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (27, N'Almendra', N'Gordon', N'Ortiz', CAST(N'2004-07-16T00:00:00.000' AS DateTime), N'Almendra.Ot@gmail.com', N'r/s9o7Vlp1VV8haXwphgFQ==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (28, N'Miriam Brunella', N'Cárdenas', N'León', CAST(N'2003-11-07T00:00:00.000' AS DateTime), N'Brucardenas@gmail.com', N'H7OPNmnvAYdonC8TKjswTQ==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (29, N'Leslie', N'Gonzales', N'', CAST(N'2003-11-25T00:00:00.000' AS DateTime), N'Less.Gonzales@gmail.com', N'+uRKFeiBaXKKoa19v3zRtQ==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (30, N'Karoline Jane', N'Rodriguez', N'Huaman', CAST(N'2000-05-06T00:00:00.000' AS DateTime), N'Karo-RH@gmail.com', N'fLDMtl/wY8C0aTOiaVaLig==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (31, N'Adriana', N'Sanchez', N'Garcia', CAST(N'1999-12-30T00:00:00.000' AS DateTime), N'Adri_SanchezG@gmail.com', N'2kjxecEJqBlVbKICRTSbPA==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (32, N'Mitzi Milagros', N'Saldaña', N'Lima', CAST(N'2000-07-15T00:00:00.000' AS DateTime), N'Milagros_SL@gmail.com', N'nJNnYHqMIZCd8E4QPPRKvg==', NULL, N'', 0, N'eY4EceSCRnuE7IYnjsbpQN:APA91bEqAhuDp2B9ka1eKuklB9aTZg0dZFsU-cxCj63p8ziAh0X4UzrilDLEcu3wqNDE6u3ZrlWCMtRq8pHKq6Qnr6Yi9b6kvGbijGQICVXuU1EjuUMXjghtL6bweQN1rtRDXpwPGlUs', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (33, N'Génesis', N'Rosales', N'', CAST(N'2000-03-09T00:00:00.000' AS DateTime), N'Gene.Rosales@gmail.com', N'rsN1mdAFsCtgk6s2NYLXVw==', NULL, N'', 0, N'e71JxBMOTTWyfs7aj8HKbs:APA91bHhZi1ZpQ6KmUmkpnkcudQxQsdIyz9zTzfPGeZcteBUClnhtSnVGlqoNXGBXxcQstUN8IQtfP-rXgiX6Gz3g8f12CrtRptnI3_AxJb9bLA1sydcx_r8WbL1osrSJMlFiisu3pYY', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (34, N'Stephany Leticia', N'Flores', N'Cadillo', CAST(N'2001-10-02T00:00:00.000' AS DateTime), N'StephanyCadillo@gmail.com', N'f3danUbMQQGae/AmsTtGcg==', NULL, N'', 0, N'e71JxBMOTTWyfs7aj8HKbs:APA91bHhZi1ZpQ6KmUmkpnkcudQxQsdIyz9zTzfPGeZcteBUClnhtSnVGlqoNXGBXxcQstUN8IQtfP-rXgiX6Gz3g8f12CrtRptnI3_AxJb9bLA1sydcx_r8WbL1osrSJMlFiisu3pYY', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (35, N'Andrea del Carmen', N'Chauca', N'Ruiz', CAST(N'2001-10-02T00:00:00.000' AS DateTime), N'AndreaChaucaR@gmail.com', N'ZO+oFrXeB0WclOKT8I2J7Q==', NULL, N'', 0, N'e71JxBMOTTWyfs7aj8HKbs:APA91bHhZi1ZpQ6KmUmkpnkcudQxQsdIyz9zTzfPGeZcteBUClnhtSnVGlqoNXGBXxcQstUN8IQtfP-rXgiX6Gz3g8f12CrtRptnI3_AxJb9bLA1sydcx_r8WbL1osrSJMlFiisu3pYY', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (36, N'juan', N'Perez', N'Torres', CAST(N'2004-10-04T00:00:00.000' AS DateTime), N'test@gmail.com', N'u7JyuRUfcznZM9ECuf9IHA==', NULL, N'Juan Perez Torres', 0, NULL, N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (37, N'', N'', N'', CAST(N'2004-10-21T00:00:00.000' AS DateTime), N'', N'IMonp5vvovOWcSPs0ZvBSg==', N'677812', N'', 0, NULL, N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (38, N'Martina', N'Martinez', N'Huima', CAST(N'2001-10-09T00:00:00.000' AS DateTime), N'Martina.m@gmail.com', N'S+Z9gifawdIX+krZ3EY3aw==', NULL, N'', 0, NULL, N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (39, N'Natalia ', N'Maury ', N'Castañeda ', CAST(N'2000-10-19T00:00:00.000' AS DateTime), N'u201816996@upc.edu.pe', N'e3cq+jUci7kIzl2ebZTY+w==', NULL, N'', 0, N'd7yCbiAURXG6H01eN40H8Q:APA91bH-qhcENGSlPoVu5wcElW6Jb9m2ivKmOuof4ErwB_Ql51fv9aM2H9JQ6qlx1s8foZtPezBrLGF2xgJ5FlGAVzvRd7p_49vpwjH-G4pdbir_d1KErsABTcczDBAJRHRPqfh3FPuI', N'BASICO')
INSERT [dbo].[User] ([id], [names], [last_name], [mother_last_name], [birthdate], [email], [password], [token], [linkedin], [user_level], [fcm_token], [level]) VALUES (40, N'juan', N'Perez', N'Torres', CAST(N'2000-10-12T00:00:00.000' AS DateTime), N'abcd@gmail.com', N'eMWxPf07iICIj3uyCi9d+Q==', NULL, N'', 0, NULL, N'BASICO')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Course] ON 

INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (5, 2, 5, 1, 0, 4, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (6, 3, 5, 1, 0, 4, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (7, 4, 5, 1, 0, 4, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (8, 5, 5, 0, 0, 4, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (9, 6, 5, 0, 0, 4, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (10, 7, 5, 0, 0, 4, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (11, 8, 5, 0, 0, 4, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (12, 2, 6, 1, 0, 5, 15)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (13, 3, 6, 1, 0, 5, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (14, 4, 6, 1, 0, 5, 2)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (15, 5, 6, 1, 0, 5, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (16, 6, 6, 1, 0, 5, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (17, 7, 6, 1, 0, 5, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (18, 8, 6, 1, 0, 5, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (19, 9, 7, 1, 0, 5, 9)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (20, 10, 7, 0, 0, 5, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (21, 11, 7, 0, 0, 5, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (22, 12, 7, 0, 0, 5, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (23, 2, 8, 1, 0, 2, 16)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (24, 3, 8, 1, 0, 2, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (25, 4, 8, 1, 0, 2, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (26, 5, 8, 1, 0, 2, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (27, 6, 8, 1, 0, 2, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (28, 7, 8, 1, 0, 2, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (29, 8, 8, 1, 0, 2, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (30, 2, 9, 1, 0, 3, 17)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (31, 3, 9, 1, 0, 3, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (32, 4, 9, 1, 0, 3, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (33, 5, 9, 1, 0, 3, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (34, 6, 9, 1, 0, 3, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (35, 7, 9, 1, 0, 3, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (36, 8, 9, 1, 0, 3, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (37, 2, 10, 1, 0, 15, 2)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (38, 3, 10, 0, 0, 15, 4)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (39, 4, 10, 0, 0, 15, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (40, 5, 10, 0, 0, 15, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (41, 6, 10, 0, 0, 15, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (42, 7, 10, 0, 0, 15, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (43, 8, 10, 0, 0, 15, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (44, 2, 11, 0, 0, 14, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (45, 3, 11, 0, 0, 14, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (46, 4, 11, 0, 0, 14, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (47, 5, 11, 0, 0, 14, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (48, 6, 11, 0, 0, 14, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (49, 7, 11, 0, 0, 14, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (50, 8, 11, 0, 0, 14, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (51, 2, 12, 1, 0, 16, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (52, 3, 12, 1, 0, 16, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (53, 4, 12, 1, 0, 16, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (54, 5, 12, 1, 0, 16, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (55, 6, 12, 1, 0, 16, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (56, 7, 12, 1, 0, 16, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (57, 8, 12, 1, 0, 16, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (58, 9, 13, 0, 0, 16, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (59, 10, 13, 0, 0, 16, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (60, 11, 13, 0, 0, 16, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (61, 12, 13, 0, 0, 16, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (62, 2, 14, 1, 0, 17, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (63, 3, 14, 1, 0, 17, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (64, 4, 14, 1, 0, 17, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (65, 5, 14, 1, 0, 17, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (66, 6, 14, 1, 0, 17, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (67, 7, 14, 1, 0, 17, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (68, 8, 14, 1, 0, 17, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (69, 9, 15, 0, 0, 17, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (70, 10, 15, 0, 0, 17, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (71, 11, 15, 0, 0, 17, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (72, 12, 15, 0, 0, 17, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (73, 2, 16, 1, 0, 18, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (74, 3, 16, 1, 0, 18, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (75, 4, 16, 1, 0, 18, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (76, 5, 16, 1, 0, 18, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (77, 6, 16, 1, 0, 18, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (78, 7, 16, 1, 0, 18, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (79, 8, 16, 1, 0, 18, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (80, 9, 17, 0, 0, 18, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (81, 10, 17, 0, 0, 18, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (82, 11, 17, 0, 0, 18, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (83, 12, 17, 0, 0, 18, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (84, 2, 18, 1, 0, 19, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (85, 3, 18, 1, 0, 19, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (86, 4, 18, 1, 0, 19, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (87, 5, 18, 1, 0, 19, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (88, 6, 18, 1, 0, 19, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (89, 7, 18, 1, 0, 19, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (90, 8, 18, 1, 0, 19, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (91, 9, 19, 0, 0, 19, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (92, 10, 19, 0, 0, 19, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (93, 11, 19, 0, 0, 19, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (94, 12, 19, 0, 0, 19, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (95, 2, 20, 1, 0, 20, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (96, 3, 20, 1, 0, 20, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (97, 4, 20, 1, 0, 20, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (98, 5, 20, 1, 0, 20, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (99, 6, 20, 1, 0, 20, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (100, 7, 20, 1, 0, 20, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (101, 8, 20, 1, 0, 20, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (102, 9, 21, 0, 0, 20, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (103, 10, 21, 0, 0, 20, 1)
GO
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (104, 11, 21, 0, 0, 20, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (105, 12, 21, 0, 0, 20, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (106, 2, 22, 1, 0, 21, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (107, 3, 22, 1, 0, 21, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (108, 4, 22, 1, 0, 21, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (109, 5, 22, 1, 0, 21, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (110, 6, 22, 1, 0, 21, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (111, 7, 22, 1, 0, 21, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (112, 8, 22, 1, 0, 21, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (113, 9, 23, 0, 0, 21, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (114, 10, 23, 0, 0, 21, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (115, 11, 23, 0, 0, 21, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (116, 12, 23, 0, 0, 21, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (117, 2, 24, 1, 0, 22, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (118, 3, 24, 1, 0, 22, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (119, 4, 24, 1, 0, 22, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (120, 5, 24, 1, 0, 22, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (121, 6, 24, 1, 0, 22, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (122, 7, 24, 1, 0, 22, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (123, 8, 24, 1, 0, 22, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (124, 9, 25, 0, 0, 22, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (125, 10, 25, 0, 0, 22, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (126, 11, 25, 0, 0, 22, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (127, 12, 25, 0, 0, 22, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (128, 2, 26, 1, 0, 23, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (129, 3, 26, 1, 0, 23, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (130, 4, 26, 1, 0, 23, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (131, 5, 26, 1, 0, 23, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (132, 6, 26, 1, 0, 23, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (133, 7, 26, 1, 0, 23, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (134, 8, 26, 1, 0, 23, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (135, 9, 27, 0, 0, 23, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (136, 10, 27, 0, 0, 23, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (137, 11, 27, 0, 0, 23, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (138, 12, 27, 0, 0, 23, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (139, 2, 28, 1, 0, 24, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (140, 3, 28, 1, 0, 24, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (141, 4, 28, 1, 0, 24, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (142, 5, 28, 1, 0, 24, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (143, 6, 28, 1, 0, 24, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (144, 7, 28, 1, 0, 24, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (145, 8, 28, 1, 0, 24, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (146, 9, 29, 0, 0, 24, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (147, 10, 29, 0, 0, 24, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (148, 11, 29, 0, 0, 24, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (149, 12, 29, 0, 0, 24, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (150, 2, 30, 1, 0, 25, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (151, 3, 30, 1, 0, 25, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (152, 4, 30, 1, 0, 25, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (153, 5, 30, 1, 0, 25, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (154, 6, 30, 1, 0, 25, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (155, 7, 30, 1, 0, 25, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (156, 8, 30, 1, 0, 25, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (157, 9, 31, 0, 0, 25, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (158, 10, 31, 0, 0, 25, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (159, 11, 31, 0, 0, 25, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (160, 12, 31, 0, 0, 25, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (161, 2, 32, 1, 0, 26, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (162, 3, 32, 1, 0, 26, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (163, 4, 32, 1, 0, 26, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (164, 5, 32, 1, 0, 26, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (165, 6, 32, 1, 0, 26, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (166, 7, 32, 1, 0, 26, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (167, 8, 32, 1, 0, 26, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (168, 9, 33, 0, 0, 26, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (169, 10, 33, 0, 0, 26, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (170, 11, 33, 0, 0, 26, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (171, 12, 33, 0, 0, 26, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (172, 2, 34, 1, 0, 27, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (173, 3, 34, 1, 0, 27, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (174, 4, 34, 1, 0, 27, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (175, 5, 34, 1, 0, 27, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (176, 6, 34, 1, 0, 27, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (177, 7, 34, 1, 0, 27, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (178, 8, 34, 1, 0, 27, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (179, 9, 35, 0, 0, 27, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (180, 10, 35, 0, 0, 27, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (181, 11, 35, 0, 0, 27, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (182, 12, 35, 0, 0, 27, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (183, 2, 36, 1, 0, 28, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (184, 3, 36, 1, 0, 28, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (185, 4, 36, 1, 0, 28, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (186, 5, 36, 1, 0, 28, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (187, 6, 36, 1, 0, 28, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (188, 7, 36, 1, 0, 28, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (189, 8, 36, 1, 0, 28, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (190, 9, 37, 0, 0, 28, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (191, 10, 37, 0, 0, 28, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (192, 11, 37, 0, 0, 28, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (193, 12, 37, 0, 0, 28, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (194, 2, 38, 1, 0, 29, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (195, 3, 38, 1, 0, 29, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (196, 4, 38, 1, 0, 29, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (197, 5, 38, 1, 0, 29, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (198, 6, 38, 1, 0, 29, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (199, 7, 38, 1, 0, 29, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (200, 8, 38, 1, 0, 29, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (201, 9, 39, 0, 0, 29, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (202, 10, 39, 0, 0, 29, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (203, 11, 39, 0, 0, 29, 1)
GO
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (204, 12, 39, 0, 0, 29, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (205, 2, 40, 1, 0, 30, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (206, 3, 40, 1, 0, 30, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (207, 4, 40, 1, 0, 30, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (208, 5, 40, 1, 0, 30, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (209, 6, 40, 1, 0, 30, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (210, 7, 40, 1, 0, 30, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (211, 8, 40, 1, 0, 30, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (212, 9, 41, 0, 0, 30, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (213, 10, 41, 0, 0, 30, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (214, 11, 41, 0, 0, 30, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (215, 12, 41, 0, 0, 30, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (216, 2, 42, 1, 0, 31, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (217, 3, 42, 1, 0, 31, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (218, 4, 42, 1, 0, 31, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (219, 5, 42, 1, 0, 31, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (220, 6, 42, 1, 0, 31, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (221, 7, 42, 1, 0, 31, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (222, 8, 42, 1, 0, 31, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (223, 9, 43, 0, 0, 31, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (224, 10, 43, 0, 0, 31, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (225, 11, 43, 0, 0, 31, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (226, 12, 43, 0, 0, 31, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (227, 2, 44, 1, 0, 32, 14)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (228, 3, 44, 1, 0, 32, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (229, 4, 44, 1, 0, 32, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (230, 5, 44, 1, 0, 32, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (231, 6, 44, 1, 0, 32, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (232, 7, 44, 1, 0, 32, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (233, 8, 44, 1, 0, 32, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (234, 2, 45, 1, 0, 33, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (235, 3, 45, 1, 0, 33, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (236, 4, 45, 1, 0, 33, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (237, 5, 45, 1, 0, 33, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (238, 6, 45, 1, 0, 33, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (239, 7, 45, 1, 0, 33, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (240, 8, 45, 1, 0, 33, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (241, 9, 46, 1, 0, 33, 9)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (242, 10, 46, 0, 0, 33, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (243, 11, 46, 0, 0, 33, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (244, 12, 46, 0, 0, 33, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (245, 9, 47, 0, 0, 32, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (246, 10, 47, 0, 0, 32, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (247, 11, 47, 0, 0, 32, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (248, 12, 47, 0, 0, 32, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (249, 2, 48, 1, 0, 34, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (250, 3, 48, 1, 0, 34, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (251, 4, 48, 1, 0, 34, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (252, 5, 48, 1, 0, 34, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (253, 6, 48, 1, 0, 34, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (254, 7, 48, 1, 0, 34, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (255, 8, 48, 1, 0, 34, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (256, 9, 49, 0, 0, 34, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (257, 10, 49, 0, 0, 34, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (258, 11, 49, 0, 0, 34, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (259, 12, 49, 0, 0, 34, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (260, 2, 50, 1, 0, 35, 21)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (261, 3, 50, 1, 0, 35, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (262, 4, 50, 1, 0, 35, 5)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (263, 5, 50, 1, 0, 35, 11)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (264, 6, 50, 1, 0, 35, 12)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (265, 7, 50, 1, 0, 35, 10)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (266, 8, 50, 1, 0, 35, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (267, 9, 51, 1, 0, 35, 9)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (268, 10, 51, 1, 0, 35, 8)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (269, 11, 51, 0, 0, 35, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (270, 12, 51, 0, 0, 35, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (271, 9, 52, 0, 0, 2, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (272, 10, 52, 0, 0, 2, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (273, 11, 52, 0, 0, 2, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (274, 12, 52, 0, 0, 2, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (275, 9, 53, 0, 0, 3, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (276, 10, 53, 0, 0, 3, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (277, 11, 53, 0, 0, 3, 1)
INSERT [dbo].[User_Course] ([id], [course_id], [user_speciality_level_id], [is_finish], [time], [user_id], [order_lesson]) VALUES (278, 12, 53, 0, 0, 3, 1)
SET IDENTITY_INSERT [dbo].[User_Course] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Speciality_Level] ON 

INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (5, 4, 2, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (6, 5, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (7, 5, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (8, 2, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (9, 3, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (10, 15, 2, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (11, 14, 2, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (12, 16, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (13, 16, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (14, 17, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (15, 17, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (16, 18, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (17, 18, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (18, 19, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (19, 19, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (20, 20, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (21, 20, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (22, 21, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (23, 21, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (24, 22, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (25, 22, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (26, 23, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (27, 23, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (28, 24, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (29, 24, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (30, 25, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (31, 25, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (32, 26, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (33, 26, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (34, 27, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (35, 27, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (36, 28, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (37, 28, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (38, 29, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (39, 29, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (40, 30, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (41, 30, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (42, 31, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (43, 31, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (44, 32, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (45, 33, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (46, 33, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (47, 32, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (48, 34, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (49, 34, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (50, 35, 2, 1)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (51, 35, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (52, 2, 3, 0)
INSERT [dbo].[User_Speciality_Level] ([id], [user_id], [speciality_level_id], [is_finish]) VALUES (53, 3, 3, 0)
SET IDENTITY_INSERT [dbo].[User_Speciality_Level] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Speciality_Level_Test] ON 

INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (1, 0, 5, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (2, 0, 5, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (3, 0, 5, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (4, 0, 5, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (5, 1, 5, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (6, 1, 5, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (7, 1, 5, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (8, 0, 8, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (9, 0, 8, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (10, 1, 8, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (11, 1, 12, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (12, 1, 14, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (13, 1, 16, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (14, 1, 18, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (15, 1, 20, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (16, 1, 22, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (17, 1, 24, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (18, 1, 26, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (19, 1, 28, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (20, 1, 30, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (21, 1, 32, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (22, 1, 34, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (23, 1, 36, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (24, 1, 38, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (25, 1, 40, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (26, 1, 42, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (27, 1, 45, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (28, 1, 44, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (29, 1, 48, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (30, 1, 50, CAST(20.00 AS Decimal(18, 2)))
INSERT [dbo].[User_Speciality_Level_Test] ([id], [is_approved], [user_speciality_level_id], [points]) VALUES (31, 1, 9, CAST(20.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[User_Speciality_Level_Test] OFF
GO
/****** Object:  Index [IX_Chat_user_id_1]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Chat_user_id_1] ON [dbo].[Chat]
(
	[user_id_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Chat_user_id_2]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Chat_user_id_2] ON [dbo].[Chat]
(
	[user_id_2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Chat_Bot_user_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Chat_Bot_user_id] ON [dbo].[Chat_Bot]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Chat_Bot_Session_chat_bot_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Chat_Bot_Session_chat_bot_id] ON [dbo].[Chat_Bot_Session]
(
	[chat_bot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Chat_Session_chat_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Chat_Session_chat_id] ON [dbo].[Chat_Session]
(
	[chat_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Chat_Session_user_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Chat_Session_user_id] ON [dbo].[Chat_Session]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course_speciality_level_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Course_speciality_level_id] ON [dbo].[Course]
(
	[speciality_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Course_Lesson_course_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Course_Lesson_course_id] ON [dbo].[Course_Lesson]
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Notification_User_user_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Notification_User_user_id] ON [dbo].[Notification_User]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Speciality_Level_speciality_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Speciality_Level_speciality_id] ON [dbo].[Speciality_Level]
(
	[speciality_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Speciality_Level_Certificate_speciality_level_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_Speciality_Level_Certificate_speciality_level_id] ON [dbo].[Speciality_Level_Certificate]
(
	[speciality_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Course_course_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_User_Course_course_id] ON [dbo].[User_Course]
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Course_user_speciality_level_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_User_Course_user_speciality_level_id] ON [dbo].[User_Course]
(
	[user_speciality_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Speciality_Level_speciality_level_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_User_Speciality_Level_speciality_level_id] ON [dbo].[User_Speciality_Level]
(
	[speciality_level_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Speciality_Level_user_id]    Script Date: 12/10/2022 12:23:25 ******/
CREATE NONCLUSTERED INDEX [IX_User_Speciality_Level_user_id] ON [dbo].[User_Speciality_Level]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_User] FOREIGN KEY([user_id_1])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_User]
GO
ALTER TABLE [dbo].[Chat]  WITH CHECK ADD  CONSTRAINT [FK_Chat_User1] FOREIGN KEY([user_id_2])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Chat] CHECK CONSTRAINT [FK_Chat_User1]
GO
ALTER TABLE [dbo].[Chat_Bot]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Bot_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Chat_Bot] CHECK CONSTRAINT [FK_Chat_Bot_User]
GO
ALTER TABLE [dbo].[Chat_Bot_Session]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Bot_Session_Chat_Bot] FOREIGN KEY([chat_bot_id])
REFERENCES [dbo].[Chat_Bot] ([id])
GO
ALTER TABLE [dbo].[Chat_Bot_Session] CHECK CONSTRAINT [FK_Chat_Bot_Session_Chat_Bot]
GO
ALTER TABLE [dbo].[Chat_Session]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Session_Chat] FOREIGN KEY([chat_id])
REFERENCES [dbo].[Chat] ([id])
GO
ALTER TABLE [dbo].[Chat_Session] CHECK CONSTRAINT [FK_Chat_Session_Chat]
GO
ALTER TABLE [dbo].[Chat_Session]  WITH CHECK ADD  CONSTRAINT [FK_Chat_Session_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Chat_Session] CHECK CONSTRAINT [FK_Chat_Session_User]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Speciality_Level] FOREIGN KEY([speciality_level_id])
REFERENCES [dbo].[Speciality_Level] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Speciality_Level]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Topic] FOREIGN KEY([topic_id])
REFERENCES [dbo].[Topic] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Topic]
GO
ALTER TABLE [dbo].[Course_Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Course_Lesson_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Course_Lesson] CHECK CONSTRAINT [FK_Course_Lesson_Course]
GO
ALTER TABLE [dbo].[Notification_User]  WITH CHECK ADD  CONSTRAINT [FK_Notification_User_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Notification_User] CHECK CONSTRAINT [FK_Notification_User_User]
GO
ALTER TABLE [dbo].[Speciality_Level]  WITH CHECK ADD  CONSTRAINT [FK_Speciality_Level_Speciality] FOREIGN KEY([speciality_id])
REFERENCES [dbo].[Speciality] ([id])
GO
ALTER TABLE [dbo].[Speciality_Level] CHECK CONSTRAINT [FK_Speciality_Level_Speciality]
GO
ALTER TABLE [dbo].[Speciality_Level_Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Speciality_Level_Certificate_Speciality_Level] FOREIGN KEY([speciality_level_id])
REFERENCES [dbo].[Speciality_Level] ([id])
GO
ALTER TABLE [dbo].[Speciality_Level_Certificate] CHECK CONSTRAINT [FK_Speciality_Level_Certificate_Speciality_Level]
GO
ALTER TABLE [dbo].[Speciality_Level_Test]  WITH CHECK ADD  CONSTRAINT [FK_Speciality_Level_Test_Speciality_Level] FOREIGN KEY([speciality_level_id])
REFERENCES [dbo].[Speciality_Level] ([id])
GO
ALTER TABLE [dbo].[Speciality_Level_Test] CHECK CONSTRAINT [FK_Speciality_Level_Test_Speciality_Level]
GO
ALTER TABLE [dbo].[Speciality_Level_Test_Option]  WITH CHECK ADD  CONSTRAINT [FK_Speciality_Level_Test_Option_Speciality_Level_Test] FOREIGN KEY([speciality_level_test_id])
REFERENCES [dbo].[Speciality_Level_Test] ([id])
GO
ALTER TABLE [dbo].[Speciality_Level_Test_Option] CHECK CONSTRAINT [FK_Speciality_Level_Test_Option_Speciality_Level_Test]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FK_User_Course_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FK_User_Course_Course]
GO
ALTER TABLE [dbo].[User_Course]  WITH CHECK ADD  CONSTRAINT [FK_User_Course_User_Speciality_Level] FOREIGN KEY([user_speciality_level_id])
REFERENCES [dbo].[User_Speciality_Level] ([id])
GO
ALTER TABLE [dbo].[User_Course] CHECK CONSTRAINT [FK_User_Course_User_Speciality_Level]
GO
ALTER TABLE [dbo].[User_Speciality_Level]  WITH CHECK ADD  CONSTRAINT [FK_User_Speciality_Level_Speciality_Level] FOREIGN KEY([speciality_level_id])
REFERENCES [dbo].[Speciality_Level] ([id])
GO
ALTER TABLE [dbo].[User_Speciality_Level] CHECK CONSTRAINT [FK_User_Speciality_Level_Speciality_Level]
GO
ALTER TABLE [dbo].[User_Speciality_Level]  WITH CHECK ADD  CONSTRAINT [FK_User_Speciality_Level_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[User_Speciality_Level] CHECK CONSTRAINT [FK_User_Speciality_Level_User]
GO
ALTER TABLE [dbo].[User_Speciality_Level_Test]  WITH CHECK ADD  CONSTRAINT [FK_User_Speciality_Level_Test_User_Speciality_Level] FOREIGN KEY([user_speciality_level_id])
REFERENCES [dbo].[User_Speciality_Level] ([id])
GO
ALTER TABLE [dbo].[User_Speciality_Level_Test] CHECK CONSTRAINT [FK_User_Speciality_Level_Test_User_Speciality_Level]
GO
USE [master]
GO
ALTER DATABASE [dbcoaching] SET  READ_WRITE 
GO
