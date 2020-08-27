SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[outputs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[studentid] [nvarchar](50) NULL,
	[academiccycle] [nvarchar](50) NULL,
	[week] [float] NULL,
	[university] [nvarchar](50) NULL,
	[studenttype] [nvarchar](50) NULL,
	[has_survey] [float] NULL,
	[stop_out_flag_1_predicted] [int] NULL,
	[general_risk] [nvarchar](50) NULL,
	[risk_decile] [float] NULL,
	[Scored_Probabilities] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [ulatina].[outputs] ADD PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [nci_wi_outputs_A80EC669BAEB37774F4AF0AB20FE45CF] ON [ulatina].[outputs]
(
	[academiccycle] ASC,
	[university] ASC,
	[Scored_Probabilities] ASC
)
INCLUDE([general_risk],[studentid],[week]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [nci_wi_outputs_D52DC8260DD616F2555F1D5A025F7C4C] ON [ulatina].[outputs]
(
	[academiccycle] ASC,
	[university] ASC
)
INCLUDE([general_risk],[has_survey],[studenttype],[week]) WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [nci_wi_outputs_F4BD9FC5B8D0C5C298C5822850B8833D] ON [ulatina].[outputs]
(
	[has_survey] ASC,
	[studenttype] ASC,
	[university] ASC,
	[week] ASC,
	[academiccycle] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]
GO
