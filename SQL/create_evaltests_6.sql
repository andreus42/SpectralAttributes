USE [eval2]
GO
/****** Object:  Table [dbo].[EvalTests]    Script Date: 4/10/2021 9:16:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [EvalTests]
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

INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (481, 1232, 555, 1, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (2, 1232, 555, 1, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (482, 1232, 555, 1, 7, N'525')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (483, 1232, 555, 1, 10, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (484, 1232, 555, 1, 11, N'2.5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (489, 1233, 555, 1, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (7, 1233, 555, 1, 3, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (490, 1233, 555, 1, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (491, 1233, 555, 1, 4, N'100')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (492, 1233, 555, 1, 5, N'200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (493, 1233, 555, 1, 9, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (12, 1234, 555, 1, 3, N'8')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (33, 1238, 556, 1, 3, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (38, 1239, 556, 1, 3, N'8')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (42, 1240, 557, 1, 1, N'B-avg')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (43, 1240, 557, 1, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (44, 1240, 557, 1, 3, N'11')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (45, 1240, 557, 1, 5, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (46, 1240, 557, 1, 4, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (47, 1240, 557, 1, 7, N'6')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (49, 1241, 557, 1, 3, N'11')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (54, 1242, 558, 2, 1, N'B-abs')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (55, 1242, 558, 2, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (56, 1242, 558, 2, 3, N'10')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (57, 1242, 558, 2, 5, N'700')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (58, 1242, 558, 2, 4, N'1100')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (59, 1242, 558, 2, 7, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (60, 1243, 558, 2, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (61, 1243, 558, 2, 2, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (62, 1243, 558, 2, 5, N'300')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (63, 1243, 558, 2, 4, N'500')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (64, 1243, 558, 2, 7, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (65, 1244, 559, 2, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (66, 1244, 559, 2, 2, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (67, 1244, 559, 2, 5, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (68, 1244, 559, 2, 4, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (69, 1244, 559, 2, 7, N'6')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (70, 1245, 559, 2, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (71, 1245, 559, 2, 2, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (72, 1245, 559, 2, 5, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (73, 1245, 559, 2, 4, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (74, 1245, 559, 2, 7, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (75, 1246, 560, 2, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (76, 1246, 560, 2, 2, N'10')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (77, 1246, 560, 2, 5, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (78, 1246, 560, 2, 4, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (79, 1246, 560, 2, 7, N'6')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (80, 1247, 560, 2, 3, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (81, 1247, 560, 2, 2, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (82, 1247, 560, 2, 5, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (83, 1247, 560, 2, 4, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (84, 1247, 560, 2, 7, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (201, 1248, 555, 1, 3, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (289, 1234, 555, 1, 2, N'2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (290, 1234, 555, 1, 7, N'50')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (291, 1234, 555, 1, 6, N'5798')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (292, 1234, 555, 1, 9, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (494, 1248, 555, 1, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (495, 1248, 555, 1, 7, N'25')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (496, 1248, 555, 1, 10, N'1.2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (497, 1248, 555, 1, 11, N'1.2')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (505, 1239, 556, 1, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (506, 1239, 556, 1, 7, N'92')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (500, 1238, 556, 1, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (501, 1238, 556, 1, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (502, 1238, 556, 1, 4, N'500')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (503, 1238, 556, 1, 5, N'525')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (504, 1238, 556, 1, 9, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (507, 1239, 556, 1, 6, N'517')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (508, 1239, 556, 1, 9, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (509, 1241, 557, 1, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (510, 1241, 557, 1, 7, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (511, 1241, 557, 1, 4, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (512, 1241, 557, 1, 5, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (513, 1241, 557, 1, 9, N'0')
SET IDENTITY_INSERT [dbo].[EvalTests] OFF
GO
