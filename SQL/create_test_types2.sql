USE [eval2]
GO
/****** Object:  Table [dbo].[TestTypes]    Script Date: 4/12/2021 2:20:17 PM ******/
SET ANSI_NULLS ON
GO
DROP TABLE [dbo].[TestTypes]
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
SET IDENTITY_INSERT [dbo].[TestTypes] ON 

INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (1, N'0', 0, N'')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (2, N'1', 1, N'CWL')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (3, N'2', 1, N'FWHM')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (4, N'3', 1, N'FW @ 10% T-max')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (5, N'4', 1, N'FW @ 10% T-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (6, N'5', 2, N'T-avg')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (7, N'6', 2, N'T-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (8, N'7', 2, N'T-max')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (9, N'8', 3, N'T-abs@')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (10, N'9', 2, N'T-peak')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (11, N'10', 3, N'B-avg')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (12, N'11', 3, N'B-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (13, N'12', 5, N'B-abs@')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (14, N'13', 2, N'R-avg (T-scan)')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (15, N'14', 2, N'R-abs')
INSERT [dbo].[TestTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (16, N'15', 3, N'R-abs@')
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
