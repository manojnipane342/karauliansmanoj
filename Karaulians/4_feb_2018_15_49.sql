USE [karaulians]
GO
/****** Object:  Table [dbo].[users]    Script Date: 02/04/2018 15:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[profile_pic] [varchar](50) NULL,
	[is_delete] [bit] NULL,
	[is_active] [bit] NULL,
	[created_date] [datetime] NULL,
	[role_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON
INSERT [dbo].[users] ([id], [first_name], [email], [password], [profile_pic], [is_delete], [is_active], [created_date], [role_id]) VALUES (1, N'jam', N'a@gmail.com', N'123', NULL, 0, 1, CAST(0x0000A85B00000000 AS DateTime), 1)
INSERT [dbo].[users] ([id], [first_name], [email], [password], [profile_pic], [is_delete], [is_active], [created_date], [role_id]) VALUES (9, NULL, N'as@gmail.com', N'Test@123', N'MQO_04_02_2018_03_10_34.jpg', 0, 1, NULL, 0)
INSERT [dbo].[users] ([id], [first_name], [email], [password], [profile_pic], [is_delete], [is_active], [created_date], [role_id]) VALUES (10, N'akshay bhagwat', N'ak@gmail.com', N'Test@123', N'026_04_02_2018_03_45_47.jpg', 0, 1, NULL, 0)
INSERT [dbo].[users] ([id], [first_name], [email], [password], [profile_pic], [is_delete], [is_active], [created_date], [role_id]) VALUES (11, N'manoj nipane', N'manojnipane342@gmail.com', N'Manoj@123', N'CWC_04_02_2018_03_46_34.jpg', 0, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[users] OFF
/****** Object:  Table [dbo].[user_role]    Script Date: 02/04/2018 15:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_user_role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[user_role] ON
INSERT [dbo].[user_role] ([id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[user_role] ([id], [role_name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[user_role] OFF
/****** Object:  Table [dbo].[blogs]    Script Date: 02/04/2018 15:49:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[blogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[created_date] [datetime] NULL,
	[description] [nvarchar](max) NULL,
	[images] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK__blogs__user_id__07020F21]    Script Date: 02/04/2018 15:49:27 ******/
ALTER TABLE [dbo].[blogs]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[users] ([id])
GO
