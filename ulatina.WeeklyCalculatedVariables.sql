SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[WeeklyCalculatedVariables](
	[studentid] [nvarchar](50) NOT NULL,
	[academiccycle] [nvarchar](50) NOT NULL,
	[week] [nvarchar](50) NOT NULL,
	[Model] [nvarchar](50) NULL,
	[LatePayments] [float] NULL,
	[PaymentsOwed] [int] NULL,
	[DaysWithoutFinancialActivity] [int] NULL,
	[PercCreditsEarned] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[WeeklyCalculatedVariables] ADD  CONSTRAINT [PK_WeeklyCalculatedVariables] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[academiccycle] ASC,
	[week] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
