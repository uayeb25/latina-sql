SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[demographic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [nvarchar](50) NULL,
	[academiccycle] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[maritalstatus] [nvarchar](50) NULL,
	[age] [int] NULL,
	[zipcode] [nvarchar](50) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL
) ON [PRIMARY]
GO
ALTER TABLE [ulatina].[demographic] ADD PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
