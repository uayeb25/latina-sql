SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[RetentionReport](
	[LaureateKey] [nvarchar](50) NOT NULL,
	[ApKey] [nvarchar](50) NOT NULL,
	[WkOfAp] [int] NOT NULL,
	[RiskDecile] [int] NULL,
	[ScoredProbability] [float] NULL,
	[GeneralRisk] [nvarchar](50) NULL,
	[Factor1] [nvarchar](80) NULL,
	[Factor2] [nvarchar](80) NULL,
	[Factor3] [nvarchar](80) NULL,
	[Factor4] [nvarchar](80) NULL,
	[age] [int] NULL,
	[gender] [nvarchar](80) NULL,
	[campus] [nvarchar](80) NULL,
	[career] [nvarchar](80) NULL,
	[city] [nvarchar](80) NULL,
	[credits] [int] NULL,
	[courses] [int] NULL,
	[DaysWithoutFinancialActivity] [int] NULL,
	[degree] [nvarchar](80) NULL,
	[discountpercent] [float] NULL,
	[finalgrade] [float] NULL,
	[highschooltype] [nvarchar](80) NULL,
	[maritalstatus] [nvarchar](80) NULL,
	[numacademiccycles] [int] NULL,
	[paymentplan] [nvarchar](80) NULL,
	[PaymentsOwed] [int] NULL,
	[schedule] [nvarchar](80) NULL,
	[scholarshipflag] [nvarchar](80) NULL,
	[scholarshippercent] [float] NULL,
	[scholarshiptype] [nvarchar](80) NULL,
	[university] [nvarchar](80) NULL,
	[LatePayments] [float] NULL,
	[PercCreditsEarned] [float] NULL,
	[studenttype] [nvarchar](50) NULL,
	[studentsubtype] [nvarchar](50) NULL,
	[coursesRegistry] [int] NULL,
	[totalbalance] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[RetentionReport] ADD  CONSTRAINT [PK_RetentionReport] PRIMARY KEY CLUSTERED 
(
	[LaureateKey] ASC,
	[ApKey] ASC,
	[WkOfAp] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
