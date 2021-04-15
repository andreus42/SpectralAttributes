drop table EvalTests;
go

create table EvalTests (
	ID INT IDENTITY (1,1) NOT NULL,
	TestID INT,
	GroupID INT,
	SetID INT,
	ParamID INT,
	ParamValue VARCHAR(32)
)
go

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
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (13, 3, 2, 1, 3, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (14, 3, 2, 1, 2, N'1')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (15, 3, 2, 1, 7, N'95')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (16, 3, 2, 1, 4, N'300')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (17, 3, 2, 1, 5, N'500')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (18, 3, 2, 1, 11, N'0')
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
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (31, 6, 2, 0, 3, N'10')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (32, 6, 2, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (33, 6, 2, 0, 7, N'6')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (34, 6, 2, 0, 4, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (35, 6, 2, 0, 5, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (36, 6, 2, 0, 11, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (37, 7, 2, 0, 3, N'11')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (38, 7, 2, 0, 2, N'0')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (39, 7, 2, 0, 7, N'5')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (40, 7, 2, 0, 4, N'900')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (41, 7, 2, 0, 5, N'1200')
INSERT [dbo].[EvalTests] ([ID], [TestID], [GroupID], [SetID], [ParamID], [ParamValue]) VALUES (42, 7, 2, 0, 11, N'0')
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