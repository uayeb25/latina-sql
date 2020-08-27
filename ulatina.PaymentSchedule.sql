SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[PaymentSchedule](
	[ApKey] [nvarchar](10) NULL,
	[P1DueDate] [date] NULL,
	[P2DueDate] [date] NULL,
	[P3DueDate] [date] NULL,
	[P4DueDate] [date] NULL
) ON [PRIMARY]
GO
