SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [errorulatina].[scholarshipInformation](
	[studentid] [varchar](50) NOT NULL,
	[academiccycle] [varchar](50) NOT NULL,
	[scholarshippercent] [varchar](10) NULL,
	[discountpercent] [varchar](10) NULL,
	[scholarshiptype] [varchar](50) NULL,
	[university] [varchar](200) NULL
) ON [PRIMARY]
GO
