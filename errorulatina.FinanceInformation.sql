SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [errorulatina].[FinanceInformation](
	[studentid] [varchar](50) NOT NULL,
	[academiccycle] [varchar](50) NOT NULL,
	[paymentplan] [varchar](50) NULL,
	[totalbalance] [int] NULL,
	[payment1amount] [int] NULL,
	[payment2amount] [int] NULL,
	[payment3amount] [int] NULL,
	[payment4amount] [int] NULL,
	[payment1duedate] [int] NULL,
	[payment2duedate] [int] NULL,
	[payment3duedate] [int] NULL,
	[payment4duedate] [int] NULL,
	[payment1date] [date] NULL,
	[payment2date] [date] NULL,
	[payment3date] [date] NULL,
	[payment4date] [date] NULL,
	[university] [varchar](200) NULL
) ON [PRIMARY]
GO
