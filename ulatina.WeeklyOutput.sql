SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[WeeklyOutput](
	[LaureateKey] [nvarchar](50) NOT NULL,
	[ApKey] [nvarchar](50) NOT NULL,
	[WkOfAp] [int] NOT NULL,
	[Model] [nvarchar](50) NULL,
	[ScoredProbability] [float] NULL,
	[Factor1] [nvarchar](50) NULL,
	[Factor2] [nvarchar](50) NULL,
	[Factor3] [nvarchar](50) NULL,
	[Factor4] [nvarchar](50) NULL,
	[RiskDecile] [int] NULL,
	[GeneralRisk] [nvarchar](20) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[WeeklyOutput] ADD  CONSTRAINT [PK_WeeklyOutputs] PRIMARY KEY CLUSTERED 
(
	[LaureateKey] ASC,
	[ApKey] ASC,
	[WkOfAp] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
