SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [errorulatina].[demographic](
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
