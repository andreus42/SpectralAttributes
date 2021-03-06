USE [eval2]
GO
/****** Object:  Table [dbo].[TestTypes]    Script Date: 4/12/2021 2:20:17 PM ******/
SET ANSI_NULLS ON
GO
DROP TABLE [dbo].[SetupParamTypes]
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SetupParamTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [varchar](32) NULL,
	[FrameTypeID] [int] NULL,
	[ParamName] [varchar](32) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[SetupParamTypes] ON 
INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (1, N'0', 0, N'')
INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (2, N'1', 1, N'AOI')
INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (3, N'2', 1, N'Scan Range')
INSERT [dbo].[SetupParamTypes] ([ID], [TypeID], [FrameTypeID], [ParamName]) VALUES (4, N'3', 1, N'Capability Group')
SET IDENTITY_INSERT [dbo].[SetupParamTypes] OFF
GO