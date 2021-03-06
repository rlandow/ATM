USE [ATM]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2/24/2018 10:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2/24/2018 10:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Type] [nvarchar](max) NULL,
	[Amount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_dbo.Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Transfers]    Script Date: 2/24/2018 10:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transfers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TargetAccount] [int] NOT NULL,
	[TransactionID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Transfers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/24/2018 10:32:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pin] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (1, 1, CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (2, 2, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (3, 2, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (4, 3, CAST(400.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (5, 3, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (6, 3, CAST(600.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (7, 4, CAST(700.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (8, 4, CAST(800.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (9, 4, CAST(900.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (10, 5, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (11, 5, CAST(1100.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (12, 5, CAST(1200.00 AS Decimal(18, 2)))
INSERT [dbo].[Accounts] ([Id], [UserId], [Balance]) VALUES (13, 5, CAST(1300.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Accounts] OFF
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (1, 2, N'D', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (2, 2, N'D', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (3, 2, N'D', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (4, 2, N'D', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (5, 2, N'W', CAST(100.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (6, 7, N'T', CAST(111.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (7, 7, N'T', CAST(211.00 AS Decimal(18, 2)))
INSERT [dbo].[Transactions] ([Id], [AccountId], [Type], [Amount]) VALUES (8, 7, N'T', CAST(311.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
SET IDENTITY_INSERT [dbo].[Transfers] ON 

INSERT [dbo].[Transfers] ([Id], [TargetAccount], [TransactionID]) VALUES (1, 9, 8)
SET IDENTITY_INSERT [dbo].[Transfers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Pin]) VALUES (1, 1234)
INSERT [dbo].[Users] ([Id], [Pin]) VALUES (2, 2345)
INSERT [dbo].[Users] ([Id], [Pin]) VALUES (3, 3456)
INSERT [dbo].[Users] ([Id], [Pin]) VALUES (4, 4567)
INSERT [dbo].[Users] ([Id], [Pin]) VALUES (5, 5678)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Accounts_dbo.Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_dbo.Accounts_dbo.Users_UserId]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transactions_dbo.Accounts_AccountId] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_dbo.Transactions_dbo.Accounts_AccountId]
GO
ALTER TABLE [dbo].[Transfers]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Transfers_dbo.Transactions_TransactionID] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[Transactions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transfers] CHECK CONSTRAINT [FK_dbo.Transfers_dbo.Transactions_TransactionID]
GO
