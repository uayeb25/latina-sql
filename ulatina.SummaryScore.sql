SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[SummaryScore](
	[model] [nvarchar](255) NOT NULL,
	[week] [nvarchar](255) NOT NULL,
	[green] [float] NULL,
	[yellow] [float] NULL,
	[orange] [float] NULL,
	[red] [float] NULL,
	[university] [nvarchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[SummaryScore] ADD  CONSTRAINT [PK_summary] PRIMARY KEY CLUSTERED 
(
	[model] ASC,
	[week] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
