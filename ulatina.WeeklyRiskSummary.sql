SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[WeeklyRiskSummary](
	[University] [nvarchar](50) NOT NULL,
	[ApKey] [nvarchar](10) NOT NULL,
	[WkOfAp] [int] NOT NULL,
	[TotalStudents] [int] NULL,
	[Red] [decimal](10, 2) NULL,
	[Yellow] [decimal](10, 2) NULL,
	[Green] [decimal](10, 2) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[WeeklyRiskSummary] ADD  CONSTRAINT [PK_WeeklyRiskSummary] PRIMARY KEY CLUSTERED 
(
	[University] ASC,
	[ApKey] ASC,
	[WkOfAp] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
