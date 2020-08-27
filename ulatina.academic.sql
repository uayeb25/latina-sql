SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[academic](
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
ALTER TABLE [ulatina].[academic] ADD  CONSTRAINT [PK_RegisterInformacion_1] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[academiccycle] ASC,
	[career] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
