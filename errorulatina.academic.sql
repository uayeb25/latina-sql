SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [errorulatina].[academic](
	[studentid] [varchar](50) NOT NULL,
	[academiccycle] [varchar](50) NOT NULL,
	[career] [varchar](350) NOT NULL,
	[courses] [int] NULL,
	[coursesfailed] [int] NULL,
	[creditsearned] [int] NULL,
	[creditsattempled] [int] NULL,
	[graduationflag] [int] NULL,
	[university] [varchar](200) NULL
) ON [PRIMARY]
GO
