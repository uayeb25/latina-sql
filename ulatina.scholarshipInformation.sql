SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[scholarshipInformation](
	[studentid] [varchar](50) NOT NULL,
	[academiccycle] [varchar](50) NOT NULL,
	[scholarshippercent] [varchar](10) NULL,
	[discountpercent] [varchar](10) NULL,
	[scholarshiptype] [varchar](50) NULL,
	[university] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[scholarshipInformation] ADD  CONSTRAINT [PK_studentid] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[academiccycle] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
