USE [eval2]
GO
/****** Object:  Table [dbo].[EvalTests]    Script Date: 4/15/2021 6:45:46 AM ******/
SET ANSI_NULLS ON
GO

DROP TABLE [dbo].[EvalTests]
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
SET IDENTITY_INSERT [dbo].[EvalTests] ON 

INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (1, 1, 1, 0, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (2, 1, 1, 0, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (3, 1, 1, 0, 7, N'525')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (5, 1, 1, 0, 9, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (6, 1, 1, 0, 10, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (7, 2, 1, 0, 3, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (8, 2, 1, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (9, 2, 1, 0, 7, N'40')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (11, 2, 1, 0, 9, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (12, 2, 1, 0, 10, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (76, 13, 5, 1, 3, N'9')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (77, 13, 5, 1, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (78, 13, 5, 1, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (79, 13, 5, 1, 4, N'500')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (80, 13, 5, 1, 5, N'750')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (81, 13, 5, 1, 11, N'0')
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
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (82, 14, 6, 3, 3, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (119, 11, 4, 2, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (84, 14, 6, 3, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (85, 14, 6, 3, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (86, 14, 6, 3, 4, N'500')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (87, 14, 6, 3, 5, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (88, 14, 6, 3, 11, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (120, 11, 4, 2, 7, N'525')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (121, 11, 4, 2, 9, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (122, 11, 4, 2, 10, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (123, 20, 4, 0, 3, N'15')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (149, 20, 4, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (150, 20, 4, 0, 7, N'98')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (151, 20, 4, 0, 4, N'400')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (152, 20, 4, 0, 5, N'600')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (153, 20, 4, 0, 11, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (99, 17, 7, 2, 3, N'21')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (100, 17, 7, 2, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (101, 17, 7, 2, 7, N'500')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (102, 17, 7, 2, 9, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (103, 17, 7, 2, 10, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (60, 10, 4, 0, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (61, 10, 4, 2, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (62, 10, 4, 2, 7, N'700')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (63, 10, 4, 2, 9, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (64, 10, 4, 2, 10, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (65, 11, 4, 2, 3, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (129, 21, 4, 0, 3, N'12')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (130, 21, 4, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (70, 12, 3, 0, 3, N'8')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (71, 12, 3, 0, 2, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (72, 12, 3, 0, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (73, 12, 3, 0, 4, N'300')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (74, 12, 3, 0, 5, N'600')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (75, 12, 3, 0, 11, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (131, 21, 4, 0, 7, N'4')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (132, 21, 4, 0, 6, N'750')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (133, 21, 4, 0, 11, N'4')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (113, 19, 3, 0, 3, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (114, 19, 3, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (115, 19, 3, 0, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (116, 19, 3, 0, 4, N'400')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (117, 19, 3, 0, 5, N'500')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (118, 19, 3, 0, 11, N'0')
SET IDENTITY_INSERT [dbo].[EvalTests] OFF
GO
