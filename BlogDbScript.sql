USE [master]
GO
/****** Object:  Database [blog]    Script Date: 21-Aug-16 23:47:48 ******/
CREATE DATABASE [blog]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'blog', FILENAME = N'C:\Users\PANDITA\blog.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'blog_log', FILENAME = N'C:\Users\PANDITA\blog_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [blog] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [blog].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [blog] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [blog] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [blog] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [blog] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [blog] SET ARITHABORT OFF 
GO
ALTER DATABASE [blog] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [blog] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [blog] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [blog] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [blog] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [blog] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [blog] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [blog] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [blog] SET  DISABLE_BROKER 
GO
ALTER DATABASE [blog] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [blog] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [blog] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [blog] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [blog] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [blog] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [blog] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [blog] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [blog] SET  MULTI_USER 
GO
ALTER DATABASE [blog] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [blog] SET DB_CHAINING OFF 
GO
ALTER DATABASE [blog] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [blog] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [blog] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [blog] SET QUERY_STORE = OFF
GO
USE [blog]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [blog]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 21-Aug-16 23:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[AuthorID] [int] NULL,
	[AuthorName] [nvarchar](100) NULL,
	[PostID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts]    Script Date: 21-Aug-16 23:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
	[AuthorID] [int] NULL,
 CONSTRAINT [PK_posts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Posts_Tags]    Script Date: 21-Aug-16 23:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts_Tags](
	[PostID] [int] NOT NULL,
	[TagID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 21-Aug-16 23:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 21-Aug-16 23:47:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [varbinary](50) NULL,
	[FullName] [nvarchar](100) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (1, N'I''m reading all of your posts, and each of them is more interesting. I will continue to follow you and read everything you post on your blog.
', NULL, N'Isaac Netero', 1, CAST(N'2015-02-11T12:34:55.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (2, N'This blog is a gold mine. It is simply amazing. I am very curious to how this blog remained hidden from me for so long. I will be following it every day, from now on.
', 4, NULL, 1, CAST(N'2016-03-25T10:03:05.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (3, N'Another awesome post... I am indeed amazed by how great your posts are. Keep up the awesome work.
', NULL, N'Isaac Netero', 2, CAST(N'2015-02-02T12:22:45.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (4, N'How will you interprete the problems you''ve faced in the Customer Services? Do you have an answer or an assumption to why they are existent?
', 15, NULL, 2, CAST(N'2016-05-30T19:54:55.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (5, N'The hype is strong in this one...', NULL, N'Pesho Peshov', 7, CAST(N'2016-06-14T19:07:03.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (6, N'Quite a nice post I must say. However the answers to the questions are not very clear. Can you provide us with better answers.
', 4, NULL, 7, CAST(N'2016-06-24T22:44:33.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (7, N'The real is strong in this one.
', 7, NULL, 7, CAST(N'2016-07-11T13:23:59.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (8, N'I will be following your posts, for the future. They seem quite intriguing.
', NULL, N'Isaac Netero', 7, CAST(N'2016-07-11T14:24:03.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (9, N'Well, I am off to finding my dream wife.
', NULL, N'Pesho Peshov', 8, CAST(N'2016-06-14T15:03:27.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (10, N'This is a very relative topic. A lot of questions and arguments are orbiting arround it.
', 5, NULL, 8, CAST(N'2016-06-24T17:37:41.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (11, N'Pink Fluffy Unicorns Dancing On Rainbows.
', NULL, N'Isaac Netero', 9, CAST(N'2016-06-14T06:41:24.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (12, N'How will the values of Data change in the near future, in your opinion.
', 13, NULL, 10, CAST(N'2016-06-14T23:24:03.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (13, N'I find this quite accurate, but can we be guaranteed that this scheme will work for the near future?
', NULL, N'Pesho Peshov', 10, CAST(N'2016-06-24T22:11:03.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (14, N'11/10 post. I have never seen a better blog post than this one.
', 9, NULL, 10, CAST(N'2016-07-11T12:05:05.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (15, N'The statistics are quite worrying.
', NULL, N'Isaac Netero', 11, CAST(N'2016-06-14T13:44:12.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (16, N'What is the best Cybercrime figting association currently existent, in your opinion?
', 1, NULL, 11, CAST(N'2016-06-24T14:55:08.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (17, N'Can you make an extended topic about all of the important features?
', NULL, N'Isaac Netero', 12, CAST(N'2016-06-10T15:33:41.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (18, N'Now this will be quite interesting to use.
', NULL, N'Pesho Peshov', 12, CAST(N'2016-07-11T16:37:45.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (19, N'I have actually met this guy in New York. It was an awesome feeling.
', 6, NULL, 12, CAST(N'2016-07-12T17:11:54.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (20, N'What will be the next era considering, the current one, and the direction it is headed?
', NULL, N'Isaac Netero', 13, CAST(N'2016-06-14T18:56:32.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (21, N'What are your assumptions of the next era?
', NULL, N'Pesho Peshov', 13, CAST(N'2016-06-24T19:32:28.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (22, N'I would like to know if you have any plans for the next era.
', 7, NULL, 13, CAST(N'2016-07-11T19:33:22.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (23, N'This was a rather fun-making post. Some of the other posts, I find, are rather booring. This one, certainly, is not.
', NULL, N'Pesho Peshov', 14, CAST(N'2016-06-14T20:22:33.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (24, N'Security has been my hobby, since my childhood. I will continue following your posts, they intrigue me.
', NULL, N'Isaac Netero', 15, CAST(N'2016-06-14T21:05:52.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (25, N'Is there any future in the machine learning. I mean, can I be sure to succeed, and earn a lot, if I concentrate in this environment.
', NULL, N'Isaac Netero', 16, CAST(N'2016-06-14T22:52:44.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (26, N'Another great post in this great blog. I am indeed, amazed by it.
', NULL, N'Pesho Peshov', 16, CAST(N'2016-06-24T23:44:17.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (27, N'This was certainly quite educational. I have learn a lot from it, and I have even started reading about these things.
', 3, NULL, 16, CAST(N'2016-07-11T00:12:46.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (28, N'I would like to see more posts about Data Protection. Keep up the posts on this topic.
', NULL, N'Isaac Netero', 17, CAST(N'2016-06-14T01:14:25.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (29, N'I am a bit negatively pointed to this post. There are some stable facts specifying that we are, indeed, in an "ice age".
', NULL, N'Pesho Peshov', 17, CAST(N'2016-06-14T02:54:03.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (30, N'What will be the outcome if these 2 principles are not well supervised.
', NULL, N'Isaac Netero', 24, CAST(N'2016-06-14T04:24:28.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (31, N'I am interested in the evolution of roboethics. What books should I read about those topics?
', NULL, N'Isaac Netero', 26, CAST(N'2016-06-14T03:38:41.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (32, N'I have been given the task to create a presentation on the same topic. May I use your posts as they are valuable information?
', 14, NULL, 26, CAST(N'2016-06-16T05:55:55.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (33, N'When will you speak about these topics at an actual conference? I''d like to attend to it.
', 12, NULL, 26, CAST(N'2016-06-18T06:56:15.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (34, N'Very good post. Me likey.
', NULL, N'Pesho Peshov', 26, CAST(N'2016-07-12T07:26:33.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (35, N'Can you give more advices about, what it takes to be an architect?
', NULL, N'Isaac Netero', 27, CAST(N'2016-06-14T09:44:12.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (36, N'When will you speak about the Data Lakes in a more serious manner?
', 6, NULL, 27, CAST(N'2016-06-16T08:12:58.000' AS DateTime))
INSERT [dbo].[Comments] ([ID], [Text], [AuthorID], [AuthorName], [PostID], [Date]) VALUES (37, N'I am completely new to the this topic but I would like to learn a lot about these kinds of things. Can you give me a suitable source?', NULL, N'Pesho Peshov', 27, CAST(N'2016-06-18T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (1, N'Първа публикация', N'Вдйдкфйдй окйсдклйсдкй ййсдкслйдклс дхухфудфх', CAST(N'2016-08-02T21:26:44.640' AS DateTime), 4)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (2, N'заглави', N'някъв текст', CAST(N'2016-08-02T21:29:09.237' AS DateTime), 1)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (3, N'jdsds', N'dnsjdskdnj', CAST(N'2016-08-02T21:36:08.820' AS DateTime), NULL)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (4, N'This Saturday: The Glass Cage Match at the Boston Book Festival', N'I’ve been involved with the Boston Book Festival since Deborah Porter founded it in 2009, and it’s become one of my favorite events of the year. And since I had a for-real mainstream published book come out this year (as opposed to a self-published glorified pamphlet) I get to participate this year as a full-fledged author in the session titled “Technology: Promise and Peril”. What makes this especially exciting to me is the fact that I’ll share the stage with Nick Carr, who’s one of my favorite writers and thinkers about technology. I don’t praise Nick because I agree with him so often. Over the years, in fact, we’ve pretty reliably argued about some big questions, including whether IT matters for competitive differentiation and whether Google makes us stupid.
', CAST(N'2014-10-20T07:08:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (5, N'MIT’s Second Machine Age Conference in September: Sign up Now', N'I am sorry to brag, but this really is an all-star lineup. If you’re at all interested in technological progress and its implications for our businesses, economies, and societies, you should attend the 2014 Second Machine Age conference.  It’s being held on September 10 and 11 at the gorgeous MIT Media Lab building, and organized jointly by the Institute’s Industrial Liaison Program and the Initiative on the Digital Economy (which I cofounded with Erik Brynjolfsson). Erik and I are both speaking, but that’s not the the exciting part (sorry, Erik). What’s truly exciting is the group of people who have agreed to join us and share their latest work and thinking.
', CAST(N'2014-08-21T14:44:00.000' AS DateTime), 8)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (6, N'When Using Your Smartphone Can Be the Best Thing for Your Mental Health
', N'My last post here took on Zeynep Tufekci and, by extension, others who believe the current trend of using robots and other forms of advanced technology for caregiving is, as she put it, “an abdication of a desire to remain human, to be connected to each other through care, and to take care of each other.”  I wonder how these self-appointed guardians of our humanity feel about the new iPhone app that provides automated diagnoses of imminent mood swings for people with bipolar disorder. I love this technology, for the reasons nicely enumerated in this Slate article by Aimee Swartz. Bipolar disorder is common – it affects almost 6 million American adults — and can be very hard to live with, both for people with the condition and for those around them. None of my loved ones have it, thankfully, but I’ve watched families I know well suffer greatly as they try to help one of their members cope with the illness.
', CAST(N'2014-08-07T19:53:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (7, N'Examining the Internet of Things: What’s hype? What’s real?
', N'The Internet of Things is one of the biggest buzzwords in technology today, and indeed, it does have the potential to be a truly transformational force in the way that we live and work today. However, if you peel back the “potential” and excitable future-speak surrounding IoT, and look at the actual reality of where it is today, the story is much, much different.  Yes, Internet-enabled “things” ranging from phones to watches to cars are getting smarter by being able to access, share and interpret data in new ways. But in our enthusiasm to embrace a Jetsons-like future powered by IoT, we’re losing sight of the infrastructure required (both at the literal hardware and organizational/institutional levels) to actually elevate this technology beyond buzzword status.
', CAST(N'2016-06-14T17:04:00.000' AS DateTime), 8)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (8, N'Is it OK to date someone from work?', N'The short answer: Yes, so long as you write your own script like an adult, and not a senseless fable chaser. The long answer: If you find yourself in a position where a mental assessment between career and courtship is spearheading your journey forward, congratulations: you’re an adult, with adult ideas and adult capabilities. You’ve likely worked long enough in your career to have both tested and challenged your competence. And if you’re asking yourself the question of whether Prince (or Princess) Charming is worth the pursuit, it means you have something more to lose than a glass slipper. But love is the most potent of potions, and neither a call from Human Resources, nor a disapproving side-eye from a colleague, can ever really tarnish the pungent elixir of passion.
', CAST(N'2016-06-14T22:27:00.000' AS DateTime), 15)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (9, N'Beginning the Journey to CyberSecurity Maturity', N'RSA just released results of our second annual RSA Cybersecurity Poverty Index. We’re really excited about the results, but it may not be for the reasons you think. We’re excited because of the number of respondents (more than double the 2015 Index), the breadth of industries and governments represented, and the amount of time organizations are taking to assess their security and risk management programs. The results themselves show that there is a lot of room for organizations to improve. The basis of the RSA Cybersecurity Poverty Index is the internationally developed and recognized NIST Cybersecurity Framework (CSF). Based on the CSF’s 5 foundational capabilities: Identify, Protect, Detect, Respond and Recover, respondents answer questions that determine their level of maturity in an online self-assessment.
', CAST(N'2016-06-14T23:17:00.000' AS DateTime), 13)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (10, N'Determining the Economic Value of Data', N'Data is an unusual currency. Most currencies exhibit a one-to-one transactional relationship. For example, the quantifiable value of a dollar is considered to be finite – it can only be used to buy one item or service at a time, or a person can only do one paid job at a time. But measuring the value of data is not constrained by those transactional limitations. In fact, data currency exhibits a network effect, where data can be used at the same time across multiple use cases thereby increasing its value to the organization. This makes data a powerful currency in which to invest. Nonetheless, we struggle to assign economic value to an intangible asset like data. Being able to attach economic value to data is key if we want organizations to truly manage data as a corporate asset. However, accounting already has a mechanism for quantifying the value of an intangible asset like data. It’s called goodwill.
', CAST(N'2016-06-14T20:12:00.000' AS DateTime), 14)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (11, N'Current State Of Cybercrime in 2016', N'The bon mot that “crime doesn’t pay” certainly predates the advent of cybercrime. Today, these digital hold-ups against businesses are highly profitable.  Let’s face it: if cybercrime was a publicly traded stock, realizing the return on investment, we’d all be on the phone with our respective broker begging for them to include it in our portfolio. In sum, cybercrime is big business. And business, unfortunately, is paying the price for it, both figuratively as well as literally in all kinds of ways that have gone well beyond the relatively mundane instances of worms and phreakers.  Hackers, cyber thieves and just plain bad actors continue to innovative their nefarious schemes to influence sketchy decisions (and actions) by consumers and businesses and to profit from an organization’s loss of data and reputation.
', CAST(N'2016-06-13T16:34:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (12, N'5 Features of a Modern Service Experience', N'It’s been a fun few weeks, starting with a series of customer meetings in New York City. I’m always grateful to spend time with our customers and value our healthy discussions about what we do well as a team and, at times, where we can improve. These meetings were well-timed, as they led right in to EMC World, which again provided focused opportunity to meet with several customers each day. EMC World is such a great customer event – not only to hear about the amazing product launches, but how our customers’ business problems now have answers, options and clear paths to success. EMC World’s theme this year was “Modernize”. Never has one word meant so much in this industry – it has so many Digital Transformation connotations – and it was on full display in the exhibit hall. Many of our key customers and partners were demonstrating solutions that benefited from the “modernize” mindset, making big strides in their respective customer portfolio. EMC is not immune to this either and we have been busy evolving our deep portfolio of service tools to help our customers and partners.
', CAST(N'2016-06-13T14:41:00.000' AS DateTime), 6)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (13, N'The end of an era… Is always the start of a new one.', N'NULLI’ve been contemplating the news from Cisco this week on Tuesday – the departure of MPLS. For those of you that don’t know what I’m talking about here, Mario Mazzola, Prem Jain, Luca Cafiero and Soni Jiandani were a legendary part of the Cisco story (and made for a handy self-referential acronym for those in the networking biz). Every high tech company has an innovation engine (usually more than one). At EMC, one innovation engine we use over and over again is EMC Ventures in addition to organic R&D.   Cisco used MPLS spin-out/spin-ins multiple times with great effect.    Many people noted the role of MPLS in Insieme (Nexus 9000 and ACI) and Project California (UCS, Nexus 1000v, Nexus 5000, Nexus 6000), but I think that misses important history.   People forget that back in the day, the networking business was much more fragmented – 3COM, Bay Networks, Cabletron and many, many others.    MPLS came to Cisco through the acquisition of Cresendo Networks – which ultimately resulted in the Catalyst family of switches, surely one of the most successful IT products ever, and the beginning of the dominance of Cisco, and the beginning of a long era.
', CAST(N'2016-06-10T19:04:00.000' AS DateTime), 6)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (14, N'Sci-Fi Today, Reality TV Tomorrow', N'There’s been a fair bit of hype surrounding the latest SpaceX upright rocket landing. Simple as it seems, the excitement Sci-Fi Today, Reality TV Tomorrow, at least for me, stems from how the feat has brought us one step closer to fulfilling our sci-fi fantasies – etched into our minds by the many blockbuster flicks Hollywood has produced. If you can recall one of the opening scenes of The Martian, we witnessed the Mars Ascent Vehicle (MAV) lifting off, attempting to escape an ensuing dust storm. While most of the focus was on the misfortune of Mark Watney – played by Matt Damon, left behind after being struck by debris, you could say we took for granted how easily the MAV ascended into space. Combine the thought of how the MAV got there in the first place, and you have yourself a similar parallel to the SpaceX launch and landing. So what am I getting at? Science fiction only remains science fiction until technology catches up with our imagination. This applies not just to space travel, but every other area of technological advancement.
', CAST(N'2016-06-09T07:35:00.000' AS DateTime), 8)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (15, N'“I am an Imposter.”', N'I was invited to give a keynote at the Cloud Security Alliance (CSA) Congress in Dublin recently, on behalf of my EMC colleague Said Tabet. Two years before, I had spoken at the CSA Congress in Rome about the EU-funded SPECS and SPARKS projects and their relevance to cloud in terms of GRC and security analytics. But this time, I felt that I needed to have discussion about the implications of the dramatic changes in identity management over the past several years, particularly in terms of the dramatics changes affecting the trust-related decisions that we as users and organizations make every day: the disappearance of organization boundaries due to cloud, mobile and social, the increased intermingling of personal and professional identities, the resultant expansion of the attack surface and the increased importance of understanding identity-related issues in order to manage risk.
', CAST(N'2016-06-09T09:28:25.000' AS DateTime), 9)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (16, N'How To Deal With Class Imbalance And Machine Learning On Big Data.', N'As data scientists, we work with a large amount of diverse data. A common task for us is supervised statistical classification. Classification underpins many activities that are a part of our everyday lives. Emails are classified as spam or not spam, credit card purchases are classified as fraudulent or legitimate, and custom web advertisements are shown to people based on their viewing habits. A ubiquitous, yet difficult problem in machine learning classification is class imbalance, which occurs when one class occurs far less frequently than the others. For example, how do you create a classifier to detect fraudulent transactions if only 1% of all transactions are fraudulent? In this post, I take a deep-dive into class imbalance, discussing the challenges associated with large datasets and approaches to tackle the class imbalance problem.
', CAST(N'2016-06-08T09:33:00.000' AS DateTime), 13)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (17, N'Data Protection Everywhere – Why Is It So Important in Today’s Modern Data Center?
', N'We are entering into a new age. No, it’s not another ice age, so no need to grab your coat and boots. This age brings no snow, but yields an ever-increasing presence of clouds. Let me explain. I am referring to the age of the modern data center. Over the past 15 years, IT has worked in a relatively predictable manner. However, all of this has started to change. Disruptive forces such as cloud computing and the Internet of Things have transformed the way applications are built and utilized. The modern data center refers to the future of IT infrastructure. Companies must transform in order to deliver on their customers ever-growing expectations, and data is going to be the competitive differentiator for businesses over the next decade. Something of such importance should be kept safe and protected. This calls for a data protection strategy that acknowledges the current landscape because it is likely that customers will need to continue supporting their current environments, as well as transform for next generation infrastructure initiatives.
', CAST(N'2016-06-08T08:44:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (18, N'Composable Data Fabric session from Discover', N'What is Composable Data Fabric? Muthukumar Murugan works in the HPE Storage Office of the CTO and presented in this theater session from HPE Discover. The session discusses what is CDF, why the need for it, the benefits, and HPE R&D investment in it.
', CAST(N'2015-03-03T09:21:00.000' AS DateTime), 8)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (19, N'Yes, Composable Infrastructure Is Ready for Prime Time!', N'Is Composable Infrastructure ready for prime time? In the follow up to my previous podcast, I answer that question in today''s podcast. We also tackle trying to understand why is Dell trying to slow the adoption of Composable Infrastructure.
', CAST(N'2014-09-06T05:24:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (20, N'Why Choosing the Right (Storage) Infrastructure Matters for DevOps', N'By Srikanth Venkataseshu. Deploying a DevOps model with the right IT infrastructure can help your ideas quickly become reality and put you ahead of the competition. Here''s how HPE 3PAR StoreServ can make that happen.
', CAST(N'2016-11-01T01:33:00.000' AS DateTime), 6)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (21, N'Neuromorphic Computing: Labs Research Revealed at Discover
', N'My friend and colleague in Hewlett Packard Labs Martina Trucco (Strategy and Communications Manager) reached out to me prior to Discover and asked if I''d be interested in getting the scoop on research that would be previewed for the first time at Discover. Martina has helped me get an insider''s view many times and I knew this would be another home run. The topic was Neuromorphic Computing. If you had seen me preping for this video, you would have got a good laugh out of it. On the last day of Discover after an exhausting week, my brain was having a hard time locking in on the words Neuromorphic Computing. Ironic! I went to the Labs Spotlight Session titled the “Tomorrow Show” so I could get my first introduction to the topic and get some "b-roll" footage. Cat Graves was on stage with Martina and Richard Lewington, Technical Communications Manager for Labs.  The discussion with Cat was just one of three really interesting technologies that were discussed during the session.
', CAST(N'2010-09-22T12:59:00.000' AS DateTime), 9)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (22, N'Get Expert Advice: How to Accelerate Oracle Backups Using HPE StoreOnce
', N'Use these 10 silver bullets to tune an entire solution stack – Oracle, Oracle Recovery Manager (RMAN) and StoreOnce Catalyst and StoreOnce Catalyst – to meet the RPO/RTO SLA for backups and restores, plus a brief discussion on the newly released Recovery Manager Central for Oracle (RMC-O). As a part of my job, I interact with Oracle DBAs, backup admins and IT management teams from a wide variety of customers to discuss data protection needs for their enterprise Oracle environments. We might give demonstrations of HPE solutions (OR) run proof-of-concepts in their environment. The common question that I face from almost every other customer is “How do I reliably complete my backups fast as well as be 100% sure about seamless recovery capability later on when needed?” Or in some instances simply “I have a 20TB+ database and a backup window of 4 hrs. How can I meet my SLA? Any recommendations from HPE?”...
', CAST(N'2015-02-02T13:46:00.000' AS DateTime), 13)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (23, N'2 IT Guys Balance It All
', N'Running any IT department can be a balancing act, but IT administrators at Republic National Distributing Company (RNDC) in Atlanta have taken it to the extreme. According to Systems Architect Michael Lindsey, RNDC is the second largest liquor distributor in the U.S. With two core data centers and dozens of remote locations all over the country, you would think he’d need a pretty large staff and a really large travel budget. In fact, he has neither. There are only two guys managing their distributed network of servers and storage, and this year their travel budget was eliminated altogether.
', CAST(N'2000-03-25T17:48:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (24, N'Agility and Stability', N'“Agility” is the facility of quick response — the ability to be nimble. In general, to be agile entails the ability to detect changes in your environment as well as the ability to respond quickly and appropriately. Being “agile” (in the traditional sense) is about excelling in a constantly changing environment, much like a serious athlete who masterfully integrates the aspects of balance, speed, strength, coordination, and reaction to the dynamics on the field. Management’s unique perspective includes the business needs, the competition, the pace of innovation, product demand, and the organization’s role in the enterprise. Management’s challenge is to bring this perspective to the Agile teams and collaborate and lead so as to bring the best value to the business.
', CAST(N'2016-06-28T19:01:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (25, N'What measures are you taking to protect your data?', N'Cutter’s Curt Hall is conducting research on the measures organizations are taking to safeguard their data in light of the persistent breaches that have become commonplace in our world. This confidential survey seeks to gauge the various trends impacting organizations’ data security protection practices, and the extent to which organizations are using data-centric practices and technologies. Survey results will be revealed in upcoming Cutter Consortium research. Those who complete the survey will receive a $50 Cutter Bookstore credit. Thanks in advance for your participation! Take the survey.
', CAST(N'2016-05-03T22:23:00.000' AS DateTime), 7)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (26, N'The Emergence of Roboethics
', N'The boundary between machine capabilities and what once seemed uniquely human has certainly moved over the years, justifying concerns that the relatively new field of roboethics addresses. Roboethics goes beyond job losses and looks at the impact of robotization on society as a whole; that is the major topic here. (I will address job losses at the end.) An algorithm can be unethical in both obvious and subtle ways. It could be illegal, as may have been the case with Volkswagen’s engine management algorithms for its “clean” diesel engines. It could be unethical in the sense that it violates a sense of fair play.
', CAST(N'2016-06-14T22:13:00.000' AS DateTime), 3)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (27, N'How to Architect a Data Lake', N'“How do you architect a lake?” If the question sounds like the opening line of a joke, the answer would clearly come as: “You don’t. You can only discover one.” Whether it is data warehouses or marts, data lakes, or reservoirs, the IT industry has a penchant for metaphor. The subliminal images conjured in the human mind by the above terms are, in my opinion, of critical importance in guiding thinking about the fundamental meanings and architectures of these constructs. Thus, a data warehouse is a large, cavernous, but well-organized location for gathering and storing data prior to its final use and a place where consumers are less than welcome for fear of being knocked down by a forklift truck. A data mart, on the other hand, creates an image of something between your friendly corner store and Walmart.
', CAST(N'2016-06-14T15:18:00.000' AS DateTime), 3)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (28, N'Attention Agile Organizations: Alignment = Better Decision Making', N'A frequent complaint we hear from Agile teams is that their self-organization is not respected and their manager routinely overrules their decisions. If you talk to the manager, he or she complains that the team doesn’t respect company policies anymore and makes decisions it’s not entitled to make. What seems to be a battle about power in many cases and like a confusion of self-organization with autonomy turns out to be an unfinished Agile integration into the organization.
', CAST(N'2016-05-31T18:35:00.000' AS DateTime), 6)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (29, N'Call for Papers: Business-Driven Digital Transformation', N'Digital transformation is at the top of many executive agendas and organizations are investing substantial resources to make it happen. While there may be internal benefits such as efficiency gains, the primary driver for digital transformation is the customer. Customers are now in the driver’s seat with high expectations demanding what they want, when they want it, and how they want it – and they will go elsewhere to find it if not satisfied. Years of growth and change have created tremendous complexity and redundancy in large enterprises. This complexity has become more transparent to the customer and so improving the customer experience and achieving true digital transformation requires significant changes to the business and IT environment. Organizations also need to prepare themselves to adapt to future strategic and operational changes more quickly as the pace of change is only increasing.
', CAST(N'2016-05-24T22:11:00.000' AS DateTime), 2)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (30, N'EA’s Role in the Innovation Management Process
', N'By asking the CEOs of some of the most successful and influential companies in the world, such as GE and Google, a clear definition of innovation manage­ment emerges. The definition addresses the need to quickly and effectively implement organizational goals and objectives to remain competitive and the desire to strengthen advantages through the adoption of innovative ideas, products, processes, and business models. Enterprises facing increasing competition and the pressure of techno­logical innovation are beginning to realize that to drive organic business growth and maintain a competitive advantage, they need to discover and imple­ment innovation quickly and with great care to ensure maximum value. One-off innovations are moderately easy to take advantage of, but to create a pipeline of innovative ideas that materially impacts the growth of an organization, it is critical to nurture an innovation management proc­ess that can be sustained and that can remain flexible and adjustable to accommodate changes in the competitive environment. Today’s enterprises need to manage and govern the process of innovation; it is a crucial facet of a company’s overall function.
', CAST(N'2016-05-03T14:35:00.000' AS DateTime), 1)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (31, N'Blog Unavailable', N'The blog is temporary unavailable. Sorry for inconvenience', CAST(N'2016-07-15T12:33:48.000' AS DateTime), NULL)
INSERT [dbo].[Posts] ([ID], [Title], [Body], [Date], [AuthorID]) VALUES (32, N'Blog Available Again', N'The blog is available again. Enjoy...', CAST(N'2016-07-15T13:28:48.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Posts] OFF
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (24, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (24, 34)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (24, 32)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (25, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (25, 21)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (25, 19)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (26, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (26, 35)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (26, 24)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (27, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (27, 36)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (27, 21)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (27, 32)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (28, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (28, 37)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (28, 38)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (28, 32)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (29, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (29, 4)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (30, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (30, 24)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (30, 39)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (30, 40)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (6, 13)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (7, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (7, 14)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (7, 16)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (8, 16)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (4, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (4, 7)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (1, 2)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (1, 3)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (2, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (2, 4)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (2, 5)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (4, 8)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (5, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (5, 10)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (5, 7)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (1, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (3, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (3, 6)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (3, 7)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (3, 8)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (5, 11)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (6, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (6, 12)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (8, 17)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (8, 18)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (9, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (9, 19)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (9, 20)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (10, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (10, 11)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (10, 21)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (11, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (11, 19)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (11, 20)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (11, 22)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (12, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (12, 19)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (12, 23)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (13, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (13, 24)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (13, 25)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (14, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (14, 24)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (14, 26)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (15, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (15, 19)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (16, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (16, 27)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (16, 21)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (17, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (17, 21)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (17, 19)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (17, 23)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (18, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (18, 21)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (19, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (19, 28)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (20, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (20, 28)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (20, 30)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (21, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (21, 29)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (21, 31)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (21, 24)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (22, 1)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (22, 32)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (22, 33)
INSERT [dbo].[Posts_Tags] ([PostID], [TagID]) VALUES (23, 1)
SET IDENTITY_INSERT [dbo].[Tags] ON 

INSERT [dbo].[Tags] ([ID], [Name]) VALUES (32, N'advice')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (37, N'agile')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (34, N'agility')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (36, N'architecture')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (4, N'business')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (25, N'cisco')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (8, N'conference')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (22, N'crime')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (20, N'cyber')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (21, N'data')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (16, N'date')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (30, N'devops')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (40, N'ea')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (11, N'economy')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (24, N'evolution')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (2, N'facebook')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (7, N'friends')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (13, N'health')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (29, N'hp')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (15, N'hype')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (28, N'infrastructure')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (14, N'internet')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (1, N'it')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (27, N'machine learning')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (39, N'management')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (10, N'mit')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (23, N'modern')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (3, N'news')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (33, N'oracle')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (38, N'organization')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (5, N'problems')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (31, N'research')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (35, N'roboethics')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (26, N'scifi')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (19, N'security')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (12, N'smartphone')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (17, N'social life')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (6, N'technology')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (41, N'unused-tag')
INSERT [dbo].[Tags] ([ID], [Name]) VALUES (18, N'work')
SET IDENTITY_INSERT [dbo].[Tags] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (1, N'pesho', NULL, NULL)
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (2, N'gosho', 0x2356466DFD, N'Goshko Goshkov')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (3, N'kiro', NULL, N'Kiril Ivanov')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (4, N'miro', 0x015464A8, N'Miroslav Mirov')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (5, N'stamat', 0xD03DD1535E4F00C645D644E0E88F1980F1A588F56C8D335B8EB9BC171F6A15B2, NULL)
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (6, N'tengo', 0x408B8A4423E274C54C01C7BE02ED9FCEB02ABF8F575422AA85B38EC3A2E32F54, N'Teng Qingshan')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (7, N'may', 0xE9ED2DBDD526464FA5EEFED3782BA14B4638F7D083E7260EDD72D9E8E5B2AB7A, N'May Nuwa')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (8, N'loo', 0x83563F0370A61638E84256C7C2A2CF0C5D11D4D37890C17554FAEC05AFB36A7F, N'Loo Chao-xing')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (9, N'abdur', 0x76115DA992C027EA05678013413395BBAD9182DC40F956B1C128C17898B30B0B, N'Abdur Raheem Hatem')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (10, N'CRay', 0x88CCD68ED060AF3C20D6AEBE19E07BEE6DFE3639A7DF54FB0DB1F5A35904EE73, N'Charles Ray')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (11, N'dama', 0x5CA1B6F741E5A24291BD34223750C3E0E57202B0D9EA857B077871D8F383C8CE, N'Damaskinos Stathakis')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (12, N'C.Athena', 0x9BCA1B652792C998BBDA1F9D090BD0F0F74677076BB83FD8194E80C4276A72F0, N'Athena Collia')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (13, N'GBotev', 0xEDDB8B35C6523C3B6B37E09EA9CBED22EE0857405D733310FE2CB06A22ECF553, N'Grozdan Botev')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (14, N'V.R.S.', 0x1F8E8D1ED50CC1B1C0D2223D95528908F4EC38B6C104202E03FA9261490A4FF1, N'Vanya Radkova Stoeva')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (15, N'kaila', 0x088A1E54CC1A69B079CEBAC51C0F03ECF9A4242C2E310D120B712C622F8AB175, N'Uluwehi Kaila')
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (16, N'admin', 0x3060775EB22F2326EA81AAF02ABCD7D25F8E40A96ADA6005DA04A25EB4F4561C, NULL)
INSERT [dbo].[Users] ([ID], [Username], [PasswordHash], [FullName]) VALUES (17, N'guest', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Tags]    Script Date: 21-Aug-16 23:47:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Tags] ON [dbo].[Tags]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_users_Username]    Script Date: 21-Aug-16 23:47:49 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments] ADD  CONSTRAINT [DF_Comments_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Posts] ADD  CONSTRAINT [DF_posts_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_posts_users] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_posts_users]
GO
ALTER TABLE [dbo].[Posts_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Tags_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([ID])
GO
ALTER TABLE [dbo].[Posts_Tags] CHECK CONSTRAINT [FK_Posts_Tags_Posts]
GO
ALTER TABLE [dbo].[Posts_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Tags_Tags] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([ID])
GO
ALTER TABLE [dbo].[Posts_Tags] CHECK CONSTRAINT [FK_Posts_Tags_Tags]
GO
USE [master]
GO
ALTER DATABASE [blog] SET  READ_WRITE 
GO
