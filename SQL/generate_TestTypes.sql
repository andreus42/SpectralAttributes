USE [eval2]
GO
/****** Object:  Table [dbo].[TestTypes]    Script Date: 4/20/2021 8:27:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[TestTypes]
GO
CREATE TABLE [dbo].[TestTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [varchar](32) NULL,
	[FrameTypeID] [int] NULL,
	[ParamName] [varchar](32) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'0', 0, N'')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'1', 1, N'CWL')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'2', 1, N'FWHM')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'3', 1, N'FW @ 10% T-max')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'4', 1, N'FW @ 10% T-abs')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'5', 2, N'T-avg')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'6', 2, N'T-abs')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'7', 2, N'T-max')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'8', 4, N'T-abs@')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'9', 2, N'T-peak')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'10', 3, N'B-avg')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'11', 3, N'B-abs')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'12', 5, N'B-abs@')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'13', 2, N'R-avg')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'14', 2, N'R-abs')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'15', 4, N'R-abs@')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'16', 2, N'R-avg (r-scan)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'17', 2, N'R-abs (r-scan)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'18', 2, N'R-max')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'19', 1, N'R-target')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'20', 1, N'Cuton')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'21', 1, N'Cutoff')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'22', 1, N'Cuton_80-20 ')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'23', 1, N'Cutoff_80-20')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'24', 1, N'Ripple SD')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'25', 6, N'Squareness')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'26', 7, N'CIE')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'27', 8, N'F Prime')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'28', 9, N'FW(M/1)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'29', 10, N'Ripple (Abs%)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'30', 10, N'Ripple (Rel%)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'31', 10, N'Ripple (StdDev)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'32', 11, N'FW 10% (Notch)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'33', 11, N'CWL 10% (Notch)')
INSERT [dbo].[TestTypes] ([TypeID], [FrameTypeID], [ParamName]) VALUES (N'34', 12, N'Dev from avg 0.21%')
GO
SELECT * FROM TestTypes