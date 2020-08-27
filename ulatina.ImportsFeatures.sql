SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[ImportsFeatures](
	[feature] [varchar](100) NOT NULL,
	[model] [varchar](100) NOT NULL,
	[university] [varchar](100) NOT NULL,
	[score] [float] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[ImportsFeatures] ADD PRIMARY KEY CLUSTERED 
(
	[feature] ASC,
	[model] ASC,
	[university] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
