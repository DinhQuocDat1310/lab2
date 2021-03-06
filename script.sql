USE [J3.L.P0014]
GO
ALTER TABLE [dbo].[result] DROP CONSTRAINT [FK_result_registration]
GO
ALTER TABLE [dbo].[result] DROP CONSTRAINT [FK_result_quiz]
GO
ALTER TABLE [dbo].[quizDetail] DROP CONSTRAINT [FK_quizDetail_quiz]
GO
ALTER TABLE [dbo].[quiz] DROP CONSTRAINT [FK_quiz_subject]
GO
ALTER TABLE [dbo].[question] DROP CONSTRAINT [FK_question_subject]
GO
ALTER TABLE [dbo].[question] DROP CONSTRAINT [FK_question_registration]
GO
ALTER TABLE [dbo].[answer] DROP CONSTRAINT [FK_answer_question]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP TABLE [dbo].[subject]
GO
/****** Object:  Table [dbo].[result]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP TABLE [dbo].[result]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP TABLE [dbo].[registration]
GO
/****** Object:  Table [dbo].[quizDetail]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP TABLE [dbo].[quizDetail]
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP TABLE [dbo].[quiz]
GO
/****** Object:  Table [dbo].[question]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP TABLE [dbo].[question]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP TABLE [dbo].[answer]
GO
USE [master]
GO
/****** Object:  Database [J3.L.P0014]    Script Date: 4/11/2021 9:49:47 PM ******/
DROP DATABASE [J3.L.P0014]
GO
/****** Object:  Database [J3.L.P0014]    Script Date: 4/11/2021 9:49:47 PM ******/
CREATE DATABASE [J3.L.P0014]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'J3.L.P0014', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\J3.L.P0014.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'J3.L.P0014_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\J3.L.P0014_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [J3.L.P0014] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [J3.L.P0014].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [J3.L.P0014] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [J3.L.P0014] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [J3.L.P0014] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [J3.L.P0014] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [J3.L.P0014] SET ARITHABORT OFF 
GO
ALTER DATABASE [J3.L.P0014] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [J3.L.P0014] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [J3.L.P0014] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [J3.L.P0014] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [J3.L.P0014] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [J3.L.P0014] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [J3.L.P0014] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [J3.L.P0014] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [J3.L.P0014] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [J3.L.P0014] SET  DISABLE_BROKER 
GO
ALTER DATABASE [J3.L.P0014] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [J3.L.P0014] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [J3.L.P0014] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [J3.L.P0014] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [J3.L.P0014] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [J3.L.P0014] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [J3.L.P0014] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [J3.L.P0014] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [J3.L.P0014] SET  MULTI_USER 
GO
ALTER DATABASE [J3.L.P0014] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [J3.L.P0014] SET DB_CHAINING OFF 
GO
ALTER DATABASE [J3.L.P0014] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [J3.L.P0014] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [J3.L.P0014] SET DELAYED_DURABILITY = DISABLED 
GO
USE [J3.L.P0014]
GO
/****** Object:  Table [dbo].[answer]    Script Date: 4/11/2021 9:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[answer](
	[answerID] [int] IDENTITY(1,1) NOT NULL,
	[questionID] [int] NULL,
	[answerContent] [varchar](300) NULL,
	[correct] [bit] NULL,
 CONSTRAINT [PK_answer] PRIMARY KEY CLUSTERED 
(
	[answerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[question]    Script Date: 4/11/2021 9:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[question](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](200) NULL,
	[questionContent] [varchar](300) NULL,
	[createDate] [date] NULL,
	[subjectID] [varchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_question] PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[quiz]    Script Date: 4/11/2021 9:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[quiz](
	[quizID] [int] IDENTITY(1,1) NOT NULL,
	[subjectID] [varchar](50) NULL,
	[numberQuestion] [int] NULL,
	[timeLimit] [nvarchar](50) NULL,
	[dateTakeQuiz] [date] NULL,
	[timeTakeQuiz] [time](7) NULL,
 CONSTRAINT [PK_quiz] PRIMARY KEY CLUSTERED 
(
	[quizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[quizDetail]    Script Date: 4/11/2021 9:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[quizDetail](
	[quizID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[answerID] [int] NULL,
 CONSTRAINT [PK_quizDetail] PRIMARY KEY CLUSTERED 
(
	[quizID] ASC,
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[registration]    Script Date: 4/11/2021 9:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[registration](
	[email] [varchar](200) NOT NULL,
	[name] [varchar](250) NULL,
	[password] [varchar](max) NULL,
	[role] [varchar](20) NULL,
	[status] [varchar](20) NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[result]    Script Date: 4/11/2021 9:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[result](
	[resultID] [int] IDENTITY(1,1) NOT NULL,
	[quizID] [int] NULL,
	[email] [varchar](200) NULL,
	[score] [float] NULL,
	[numberCorrect] [int] NULL,
 CONSTRAINT [PK_result] PRIMARY KEY CLUSTERED 
(
	[resultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[subject]    Script Date: 4/11/2021 9:49:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[subject](
	[subjectID] [varchar](50) NOT NULL,
	[subjectName] [varchar](100) NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[answer] ON 

INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (1, 1, N'Java Servlets are programs that run on a Web or Application server', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (2, 1, N' Java Servlets act as a middle layer between a request coming from a Web browser or other HTTP client and databases or applications on the HTTP server.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (3, 1, N'Both of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (4, 1, N'None of the above', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (5, 2, N'Servlets execute within the address space of a Web server.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (6, 2, N'Servlets are platform-independent because they are written in Java.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (7, 2, N'The full functionality of the Java class libraries is available to a servlet', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (8, 2, N'All of the above', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (9, 3, N'javax.servlet', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (10, 3, N'javax.servlet.http', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (11, 3, N'Both of the above.
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (12, 3, N'None of the above', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (13, 4, N'init, service, destroy', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (14, 4, N'initialize, service, destroy', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (15, 4, N'init, execute, destroy', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (16, 4, N'init, service, delete', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (17, 5, N'The init method is called when the servlet is first created.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (18, 5, N'The init method is called whenever the servlet is invoked.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (19, 5, N'Both of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (20, 5, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (21, 6, N'The init method simply creates or loads some data that will be used throughout the life of the
servlet.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (22, 6, N'The init method is not called again and again for each user request.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (23, 6, N'Both of the above.
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (24, 6, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (25, 7, N'The service method is called when the servlet is first created.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (26, 7, N'The service method is called whenever the servlet is invoked.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (27, 7, N'Both of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (28, 7, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (29, 8, N'The servlet container i. e. webserver calls the service method to handle requests coming from
the client.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (30, 8, N'Each time the server receives a request for a servlet, the server spawns a new thread and
calls service.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (31, 8, N'The service method checks the HTTP request type GET, POST, PUT, DELETE, etc. and calls
doGet, doPost, doPut, doDelete, etc. methods as appropriate.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (32, 8, N'All of the above.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (33, 9, N'A GET request results from a normal request for a URL', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (34, 9, N'The service method checks the HTTP request type as GET and calls doGet method.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (35, 9, N'Both of the above.
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (36, 9, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (37, 10, N'A POST request results from an HTML form that specifically lists POST as the METHOD.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (38, 10, N'The service method checks the HTTP request type as POST and calls doPost method.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (39, 10, N'Both of the above.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (40, 10, N'None of the above', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (41, 11, N'The destroy method is called only once at the end of the life cycle of a servlet.
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (42, 11, N'The destroy method is called after the servlet has executed service method.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (43, 11, N'Both of the above', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (44, 11, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (45, 12, N'After the destroy method is called, the servlet object is marked for garbage collection', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (46, 12, N'The servlet is terminated by calling the destroy method.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (47, 12, N'Both of the above', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (48, 12, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (49, 13, N'interface', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (50, 13, N'abstract class', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (51, 13, N'concreate class', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (52, 13, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (53, 14, N'interface', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (54, 14, N'abstract class', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (55, 14, N'concreate class', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (56, 14, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (57, 15, N'The GET method sends the encoded user information appended to the page request.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (58, 15, N'The GET method is the defualt method to pass information from browser to web server.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (59, 15, N'Both of the above', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (60, 15, N'None of the above', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (61, 16, N'The POST method sends the encoded user information as a seperate message to page
request', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (62, 16, N'The POST method is used to submit form data normally', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (63, 16, N'Both of the above.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (64, 16, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (65, 17, N'request.getParameter', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (66, 17, N'request.getParameterValues', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (67, 17, N'request.getParameterNames', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (68, 17, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (69, 18, N'request.getParameter', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (70, 18, N'request.getParameterValues', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (71, 18, N'request.getParameterNames', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (72, 18, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (73, 19, N'request.getParameter', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (74, 19, N'request.getParameterValues
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (75, 19, N'request.getParameterNames
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (76, 19, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (77, 20, N'response.setContentType
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (78, 20, N'request.setContentType', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (79, 20, N'writer.setContentType', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (80, 20, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (81, 21, N'response.getWriter', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (82, 21, N'request.getWriter', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (83, 21, N'new PrintWriter', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (84, 21, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (85, 22, N'response.getCookies', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (86, 22, N'request.getCookies', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (87, 22, N'Cookies.getCookies', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (88, 22, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (89, 23, N'response.getAttributeNames', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (90, 23, N'request.getAttributeNames', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (91, 23, N'Header.getAttributeNames', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (92, 23, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (93, 24, N'response.getHeaderNames', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (94, 24, N'request.getHeaderNames', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (95, 24, N'Header.getHeaderNames', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (96, 24, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (97, 25, N'request.getParameterNames', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (98, 25, N'response.getParameterNames
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (99, 25, N'Header.getParameterNames', 0)
GO
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (100, 25, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (101, 26, N'request.getSession', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (102, 26, N'response.getSession', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (103, 26, N'new Session', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (104, 26, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (105, 27, N'request.getlocale
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (106, 27, N'response.getLocale', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (107, 27, N'new Locale
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (108, 27, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (109, 28, N'request.getAttributename
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (110, 28, N'response.getAttributename', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (111, 28, N'new Attributename', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (112, 28, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (113, 29, N'new AuthType', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (114, 29, N'response.getAuthType', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (115, 29, N'request.getAuthType', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (116, 29, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (117, 30, N'new InputStream', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (118, 30, N'response.getInputStream
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (119, 30, N'request.getInputStream', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (120, 30, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (121, 31, N'public static int mainString[]args
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (122, 31, N'public int mainString[]args', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (123, 31, N'public static void mainString[]args
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (124, 31, N'None of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (125, 32, N'static
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (126, 32, N'Boolean
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (127, 32, N'void', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (128, 32, N'private', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (129, 33, N'A class is a blue print from which individual objects are created. A class can contain fields and
methods to describe the behavior of an object.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (130, 33, N'class is a special data type.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (131, 33, N'class is used to allocate memory to a data type.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (132, 33, N'none of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (133, 34, N'Java Database Connectivity', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (134, 34, N'Java Driver for Basic Connection
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (135, 34, N'Joint Database Connectivity
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (136, 34, N'Joint Driver for Basic Connection', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (137, 35, N'JDBC is a java based protocol', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (138, 35, N'JDBC is a standard Java API for database-independent connectivity between the Java
programming language and a wide range of databases', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (139, 35, N'JDBC is a specification to tell how to connect to a database.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (140, 35, N'Joint Driver for Basic Connection', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (141, 36, N'JDBC API layer provides the application-to-JDBC Manager connection', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (142, 36, N'JDBC Driver API layer supports the JDBC Manager-to-Driver Connection.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (143, 36, N'Both of the above.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (144, 36, N'None of the above', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (145, 37, N'DriverManager', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (146, 37, N'Driver', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (147, 37, N'Connection', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (148, 37, N'Transaction', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (149, 38, N'Statement', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (150, 38, N'ResultSet', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (151, 38, N'SQLException', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (152, 38, N'ConnectionPool', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (153, 39, N'JDBC DriverManager is a class that manages a list of database drivers.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (154, 39, N'It matches connection requests from the java application with the proper database driver
using communication subprotocol.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (155, 39, N'Both of the above.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (156, 39, N'none of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (157, 40, N'JDBC driver is an interface enabling a Java application to interact with a database.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (158, 40, N'The JDBC driver gives out the connection to the database and implements the protocol for
transferring the query and result between client and database.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (159, 40, N'Both of the above.
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (160, 40, N'none of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (161, 41, N'Connection interface consists of methods for contacting a database.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (162, 41, N'It represents communication context.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (163, 41, N'Both of the above.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (164, 41, N'none of the above', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (165, 42, N'Statement encapsulates an SQL statement which is passed to the database to be parsed and
compiled.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (166, 42, N'Statement encapsulates an SQL statement which is passed to the database to be planned and
executed.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (167, 42, N'Both of the above.', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (168, 42, N'none of the above.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (169, 43, N'ResultSet holds data retrieved from a database after you execute an SQL query using
Statement objects', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (170, 43, N'It acts as an iterator to allow you to move through its data.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (171, 43, N'The java.sql.ResultSet interface represents the result set of a database query.', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (172, 43, N'All of the above', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (173, 44, N'DriverManager', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (174, 44, N'JDBC driver
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (175, 44, N'Connection
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (176, 44, N'Statement
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (177, 45, N'DriverManager', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (178, 45, N'JDBC driver', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (179, 45, N'Connection
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (180, 45, N'Statement
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (181, 46, N'DriverManager
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (182, 46, N'JDBC driver', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (183, 46, N'Connection', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (184, 46, N'Statement
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (185, 47, N'DriverManager', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (186, 47, N'JDBC driver
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (187, 47, N'Connection', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (188, 47, N'Statement', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (189, 48, N'ResultSet', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (190, 48, N'JDBC driver
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (191, 48, N'Connection', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (192, 48, N'Statement', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (193, 49, N'ResultSet.TYPE_FORWARD_ONLY', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (194, 49, N'ResultSet.TYPE_SCROLL_INSENSITIVE', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (195, 49, N'ResultSet.TYPE_SCROLL_SENSITIVE', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (196, 49, N'ResultSet.TYPE_BACKWARD_ONLY', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (197, 50, N'ResultSet.TYPE_FORWARD_ONLY', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (198, 50, N'ResultSet.TYPE_SCROLL_INSENSITIVE
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (199, 50, N'ResultSet.TYPE_SCROLL_SENSITIVE', 0)
GO
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (200, 50, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (201, 51, N'ResultSet.TYPE_FORWARD_ONLY
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (202, 51, N'ResultSet.TYPE_SCROLL_INSENSITIVE
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (203, 51, N'ResultSet.TYPE_SCROLL_SENSITIVE
', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (204, 51, N'None of the above.
', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (205, 52, N'JDBC-ODBC Bridge plus ODBC driver', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (206, 52, N'Native-API, partly Java driver', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (207, 52, N'JDBC-Net, pure Java driver', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (208, 52, N'Native-protocol, pure Java driver', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (209, 53, N'8 bit', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (210, 53, N'32 bit', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (211, 53, N'64 bit', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (212, 53, N'16 bit', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (213, 56, N'1', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (214, 56, N'-1', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (215, 56, N'0', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (216, 56, N'2', 1)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (217, 57, N'1', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (218, 57, N'2', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (219, 57, N'3', 0)
INSERT [dbo].[answer] ([answerID], [questionID], [answerContent], [correct]) VALUES (220, 57, N'4', 1)
SET IDENTITY_INSERT [dbo].[answer] OFF
SET IDENTITY_INSERT [dbo].[question] ON 

INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (1, N'datdq@gmail.com', N'What are Servlets?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (2, N'datdq@gmail.com', N'Which of the following is true about servlets?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (3, N'datdq@gmail.com', N'Which of the following package contains servlet classes?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (4, N'datdq@gmail.com', N'Which of the following is the correct order of servlet life cycle phase methods?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (5, N'datdq@gmail.com', N'When init method of servlet gets called?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (6, N'datdq@gmail.com', N'Which of the following is true about init method of servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (7, N'datdq@gmail.com', N' When service method of servlet gets called?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (8, N'datdq@gmail.com', N'Which of the following is true about service method of servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (9, N'datdq@gmail.com', N'hen doGet method of servlet gets called?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (10, N'datdq@gmail.com', N'When doPost method of servlet gets called?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (11, N'datdq@gmail.com', N'When destroy method of servlet gets called?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (12, N'datdq@gmail.com', N'Which of the following is true about destroy method of servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (13, N'datdq@gmail.com', N'What is javax.servlet.Servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (14, N'datdq@gmail.com', N'What is javax.servlet.http.HttpServlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (15, N'datdq@gmail.com', N'Which of the following is true about HTTP Get method?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (16, N'datdq@gmail.com', N'Which of the following is true about HTTP Post method?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (17, N'datdq@gmail.com', N'Which of the following method can be used to get the value of form parameter?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (18, N'datdq@gmail.com', N'Which of the following method can be used to get the multiple values of a
parameter like checkbox data?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (19, N'datdq@gmail.com', N'Which of the following method can be used to get complete list of all
parameters in the current request?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (20, N'datdq@gmail.com', N'Which of the following code is used to set content type of a page to be serviced
using servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (21, N'datdq@gmail.com', N'Which of the following code is used to get PrintWriter object in servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (22, N'datdq@gmail.com', N'Which of the following code is used to get cookies in servlet?
', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (23, N'datdq@gmail.com', N'Which of the following code is used to get names of the attributes in servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (24, N'datdq@gmail.com', N'Which of the following code is used to get names of the headers in servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (25, N'datdq@gmail.com', N'Which of the following code is used to get names of the parameters in servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (26, N'datdq@gmail.com', N'Which of the following code is used to get session in servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (27, N'datdq@gmail.com', N'Which of the following code is used to get locale in servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (28, N'datdq@gmail.com', N'Which of the following code is used to get a particular attribute in servlet?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (29, N'datdq@gmail.com', N'Which of the following code retrieves the name of the authentication scheme?', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (30, N'datdq@gmail.com', N'Which of the following code retrieves the body of the request as binary data?
', CAST(N'2021-02-16' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (31, N'datdq@gmail.com', N'What is correct syntax for main method of a java class?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (32, N'datdq@gmail.com', N'Which of the following is not a keyword in java?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (33, N'datdq@gmail.com', N'What is a class in java?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (34, N'datdq@gmail.com', N'What JDBC stands for?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (35, N'datdq@gmail.com', N'What is JDBC?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (36, N'datdq@gmail.com', N'Which of the following is true about JDBC architecture?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (37, N'datdq@gmail.com', N'Which of the following is not a component/class of JDBC API?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (38, N'datdq@gmail.com', N'Which of the following is not a component/class of JDBC API?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (39, N'datdq@gmail.com', N'Which of the following is correct about DriverManager class of JDBC?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (40, N'datdq@gmail.com', N'Which of the following is correct about driver interface of JDBC?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (41, N'datdq@gmail.com', N'Which of the following is correct about Connection interface of JDBC?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (42, N'datdq@gmail.com', N'Which of the following is correct about Statement class of JDBC?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (43, N'datdq@gmail.com', N'Which of the following is correct about ResultSet class of JDBC?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (44, N'datdq@gmail.com', N'Which of the following manages a list of database drivers in JDBC?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (45, N'datdq@gmail.com', N'Which of the following gives out the connection to the database and
implements the protocol for transferring the query and result between client and
database?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (46, N'datdq@gmail.com', N'Which of the following consists of methods for contacting a database?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (47, N'datdq@gmail.com', N'Which of the following encapsulates an SQL statement which is passed to the
database to be parsed, compiled, planned and executed?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (48, N'datdq@gmail.com', N'Which of the following holds data retrieved from a database after you execute
an SQL query using Statement objects?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (49, N'datdq@gmail.com', N'Which of the following is not a valid type of ResultSet?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (50, N'datdq@gmail.com', N'In which of the following type of ResultSet, the cursor can only move forward in
the result set?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (51, N'datdq@gmail.com', N'In which of the following type of ResultSet, the cursor can scroll forwards and
backwards, and the result set is not sensitive to changes made by others to the
database that occur after the result set was created.?', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (52, N'datdq@gmail.com', N'Which of the following type of JDBC driver, calls native code of the locally
available ODBC driver?
', CAST(N'2021-02-16' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (53, N'datdq@gmail.com', N'What is the size of short variable?', CAST(N'2021-02-19' AS Date), N'PRJ311', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (56, N'datdq@gmail.com', N'1 + 1 = ?', CAST(N'2021-02-28' AS Date), N'PRJ321', 1)
INSERT [dbo].[question] ([questionID], [email], [questionContent], [createDate], [subjectID], [status]) VALUES (57, N'datdq@gmail.com', N'test ', CAST(N'2021-03-01' AS Date), N'PRJ321', 1)
SET IDENTITY_INSERT [dbo].[question] OFF
SET IDENTITY_INSERT [dbo].[quiz] ON 

INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (1, N'prj321', 10, N'15:0', CAST(N'2021-02-20' AS Date), CAST(N'21:05:28.7700000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (2, N'prj311', 10, N'15:0', CAST(N'2021-02-20' AS Date), CAST(N'21:06:19.5770000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (3, N'prj321', 10, N'15:0', CAST(N'2021-02-21' AS Date), CAST(N'15:55:51.4700000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (4, N'prj321', 10, N'15:0', CAST(N'2021-02-21' AS Date), CAST(N'15:55:55.1070000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (5, N'prj321', 10, N'15:0', CAST(N'2021-02-21' AS Date), CAST(N'16:07:40.1200000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (6, N'prj321', 10, N'15:0', CAST(N'2021-02-21' AS Date), CAST(N'16:07:42.0870000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (7, N'prj321', 10, N'15:0', CAST(N'2021-02-21' AS Date), CAST(N'17:50:19.9800000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (8, N'prj321', 10, N'15:0', CAST(N'2021-02-21' AS Date), CAST(N'17:52:37.0600000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (9, N'prj311', 10, N'15:0', CAST(N'2021-02-21' AS Date), CAST(N'17:53:45.6400000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (10, N'prj321', 10, N'15:0', CAST(N'2021-02-27' AS Date), CAST(N'21:17:25.5070000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (11, N'prj311', 10, N'15:0', CAST(N'2021-02-27' AS Date), CAST(N'21:17:40.4170000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (12, N'prj311', 10, N'15:0', CAST(N'2021-02-27' AS Date), CAST(N'21:17:43.4300000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (13, N'prj321', 10, N'15:0', CAST(N'2021-02-27' AS Date), CAST(N'21:27:38.0930000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (14, N'prj321', 10, N'15:0', CAST(N'2021-02-27' AS Date), CAST(N'21:37:28.3470000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (15, N'prj321', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:01:34.3870000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (16, N'prj321', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:38:46.9230000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (17, N'prj311', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:38:56.5800000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (18, N'prj311', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:39:06.9500000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (19, N'prj311', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:39:16.0530000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (20, N'prj321', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:39:26.9270000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (21, N'prj311', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:39:39.6530000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (22, N'prj321', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:40:20.7870000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (23, N'prj321', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'14:40:31.4270000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (24, N'prj321', 10, N'15:0', CAST(N'2021-02-28' AS Date), CAST(N'22:27:52.8170000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (25, N'prj321', 10, N'15:0', CAST(N'2021-03-01' AS Date), CAST(N'07:31:32.5600000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (26, N'prj321', 10, N'15:0', CAST(N'2021-03-01' AS Date), CAST(N'07:44:17.2030000' AS Time))
INSERT [dbo].[quiz] ([quizID], [subjectID], [numberQuestion], [timeLimit], [dateTakeQuiz], [timeTakeQuiz]) VALUES (27, N'prj321', 10, N'15:0', CAST(N'2021-03-01' AS Date), CAST(N'07:51:24.3770000' AS Time))
SET IDENTITY_INSERT [dbo].[quiz] OFF
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 1, 1)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 4, 13)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 7, 27)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 12, 45)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 14, 53)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 15, 57)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 17, 66)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 22, 86)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 23, 89)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (1, 30, 118)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 31, 123)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 34, 133)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 36, 143)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 39, 155)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 41, 163)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 43, 172)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 45, 178)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 50, 197)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 51, 202)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (2, 53, 212)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 8, 29)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 9, 35)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 12, 47)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 17, 66)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 21, 83)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 22, 86)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 23, 91)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 25, 98)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 26, 102)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (3, 28, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 5, 17)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 8, 31)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 9, 33)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 12, 48)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 13, 49)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 14, 53)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 16, 61)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 18, 69)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 23, 92)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (4, 27, 105)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 1, 1)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 7, 25)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 9, 33)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 11, 41)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 12, 45)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 14, 53)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 15, 57)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 18, 69)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 19, 73)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (5, 23, 89)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 2, 8)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 4, 16)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 8, 32)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 10, 40)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 13, 52)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 18, 72)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 19, 76)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 20, 80)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 26, 104)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (6, 30, 120)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 1, 1)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 3, 11)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 5, 17)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 8, 30)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 12, 45)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 17, 66)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 23, 89)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 25, 98)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 29, 115)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (7, 30, 118)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 1, 2)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 3, 10)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 4, 14)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 9, 33)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 10, 40)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 11, 41)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 13, 51)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 15, 58)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 19, 75)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (8, 25, 98)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 31, 123)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 33, 132)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 35, 139)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 39, 153)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 40, 157)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 44, 175)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 46, 183)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 48, 189)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 51, 201)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (9, 53, 210)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 1, 3)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 10, 38)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 16, 63)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 17, 65)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 18, 70)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 23, 92)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 24, 96)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 28, 112)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 29, 115)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (14, 30, 117)
GO
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 4, 15)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 5, 20)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 8, 32)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 10, 38)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 15, 60)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 19, 73)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 21, 84)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 22, 87)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 25, 98)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (15, 28, 110)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 2, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 4, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 6, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 7, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 10, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 14, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 15, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 16, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 18, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (16, 19, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 31, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 34, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 36, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 38, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 39, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 40, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 42, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 43, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 48, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (17, 49, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 32, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 37, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 38, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 39, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 41, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 46, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 47, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 50, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 51, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (18, 53, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 31, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 34, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 36, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 37, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 40, 160)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 44, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 46, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 48, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 50, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (19, 53, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 1, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 2, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 5, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 7, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 9, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 12, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 13, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 24, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 27, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (20, 28, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 32, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 36, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 37, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 38, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 40, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 45, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 46, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 47, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 50, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (21, 51, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 6, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 7, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 9, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 12, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 13, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 14, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 16, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 17, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 21, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (22, 27, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 2, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 10, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 12, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 13, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 14, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 19, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 24, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 29, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 30, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (23, 56, 216)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 5, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 9, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 10, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 11, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 14, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 16, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 20, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 22, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 28, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (24, 56, 0)
GO
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 3, 11)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 4, 14)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 5, 18)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 14, 55)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 15, 59)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 16, 62)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 17, 66)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 22, 86)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 26, 102)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (25, 30, 119)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 8, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 10, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 11, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 20, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 24, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 25, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 27, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 28, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 56, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (26, 57, 220)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 1, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 6, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 10, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 12, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 14, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 17, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 19, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 21, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 24, 0)
INSERT [dbo].[quizDetail] ([quizID], [questionID], [answerID]) VALUES (27, 56, 216)
INSERT [dbo].[registration] ([email], [name], [password], [role], [status]) VALUES (N'abc@gmail.com', N'Dinh Quoc Guest A', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'student', N'new')
INSERT [dbo].[registration] ([email], [name], [password], [role], [status]) VALUES (N'abcd@gmail.com', N'Dinh Quoc Guest B', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'student', N'new')
INSERT [dbo].[registration] ([email], [name], [password], [role], [status]) VALUES (N'abcy@gmail.com', N'Dinh Quoc Dat Test', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', N'student', N'new')
INSERT [dbo].[registration] ([email], [name], [password], [role], [status]) VALUES (N'datdq@gmail.com', N'Dinh Quoc Dat', N'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad', N'admin', N'new')
INSERT [dbo].[registration] ([email], [name], [password], [role], [status]) VALUES (N'xyz@gmail.com', N'Dinh Quoc Guest X', N'3608bca1e44ea6c4d268eb6db02260269892c0b42b86bbf1e77a6fa16c3c9282', N'student', N'new')
SET IDENTITY_INSERT [dbo].[result] ON 

INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (1, 1, N'abc@gmail.com', 2, 2)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (2, 2, N'abc@gmail.com', 9, 9)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (3, 3, N'abc@gmail.com', 3, 3)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (4, 4, N'abc@gmail.com', 3, 3)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (5, 5, N'abc@gmail.com', 1, 1)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (6, 6, N'abc@gmail.com', 2, 2)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (7, 7, N'abc@gmail.com', 3, 3)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (8, 8, N'abc@gmail.com', 2, 2)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (9, 9, N'abc@gmail.com', 3, 3)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (10, 10, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (11, 11, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (12, 12, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (13, 13, N'xyz@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (14, 14, N'xyz@gmail.com', 4, 4)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (15, 15, N'xyz@gmail.com', 1, 1)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (16, 16, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (17, 17, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (18, 18, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (19, 19, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (20, 20, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (21, 21, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (22, 22, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (23, 23, N'abcd@gmail.com', 1, 1)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (24, 24, N'abcd@gmail.com', 0, 0)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (25, 25, N'abc@gmail.com', 4, 4)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (26, 26, N'abcy@gmail.com', 1, 1)
INSERT [dbo].[result] ([resultID], [quizID], [email], [score], [numberCorrect]) VALUES (27, 27, N'abcd@gmail.com', 1, 1)
SET IDENTITY_INSERT [dbo].[result] OFF
INSERT [dbo].[subject] ([subjectID], [subjectName]) VALUES (N'prj311', N'Java Desktop')
INSERT [dbo].[subject] ([subjectID], [subjectName]) VALUES (N'prj321', N'Java Web Application')
ALTER TABLE [dbo].[answer]  WITH CHECK ADD  CONSTRAINT [FK_answer_question] FOREIGN KEY([questionID])
REFERENCES [dbo].[question] ([questionID])
GO
ALTER TABLE [dbo].[answer] CHECK CONSTRAINT [FK_answer_question]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_registration] FOREIGN KEY([email])
REFERENCES [dbo].[registration] ([email])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_registration]
GO
ALTER TABLE [dbo].[question]  WITH CHECK ADD  CONSTRAINT [FK_question_subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[subject] ([subjectID])
GO
ALTER TABLE [dbo].[question] CHECK CONSTRAINT [FK_question_subject]
GO
ALTER TABLE [dbo].[quiz]  WITH CHECK ADD  CONSTRAINT [FK_quiz_subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[subject] ([subjectID])
GO
ALTER TABLE [dbo].[quiz] CHECK CONSTRAINT [FK_quiz_subject]
GO
ALTER TABLE [dbo].[quizDetail]  WITH CHECK ADD  CONSTRAINT [FK_quizDetail_quiz] FOREIGN KEY([quizID])
REFERENCES [dbo].[quiz] ([quizID])
GO
ALTER TABLE [dbo].[quizDetail] CHECK CONSTRAINT [FK_quizDetail_quiz]
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [FK_result_quiz] FOREIGN KEY([quizID])
REFERENCES [dbo].[quiz] ([quizID])
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [FK_result_quiz]
GO
ALTER TABLE [dbo].[result]  WITH CHECK ADD  CONSTRAINT [FK_result_registration] FOREIGN KEY([email])
REFERENCES [dbo].[registration] ([email])
GO
ALTER TABLE [dbo].[result] CHECK CONSTRAINT [FK_result_registration]
GO
USE [master]
GO
ALTER DATABASE [J3.L.P0014] SET  READ_WRITE 
GO
