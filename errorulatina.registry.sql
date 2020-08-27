SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [errorulatina].[registry](
	[studentid] [nvarchar](50) NOT NULL,
	[academiccycle] [nvarchar](50) NOT NULL,
	[career] [nvarchar](350) NOT NULL,
	[faculty] [nvarchar](500) NULL,
	[degree] [nvarchar](50) NULL,
	[campus] [nvarchar](200) NULL,
	[numacademiccycles] [int] NULL,
	[schedule] [nvarchar](100) NULL,
	[classstartdate] [date] NULL,
	[enrollmentdate] [date] NULL,
	[credits] [int] NULL,
	[courses] [int] NULL,
	[coursesdropped] [int] NULL,
	[finalgrade] [decimal](18, 2) NULL,
	[creditsearned] [int] NULL,
	[stopoutflag] [nvarchar](5) NULL,
	[earlystopoutflag] [nvarchar](5) NULL,
	[withdrawalflag] [nvarchar](5) NULL,
	[studenttype] [nvarchar](50) NULL,
	[studentsubtype] [nvarchar](50) NULL,
	[scholarshipflag] [nvarchar](5) NULL,
	[university] [varchar](200) NULL
) ON [PRIMARY]
GO
