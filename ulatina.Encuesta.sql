SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[Encuesta](
	[preguntacod] [int] IDENTITY(1,1) NOT NULL,
	[pregunta] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ulatina].[Encuesta] ADD  CONSTRAINT [PK_encuesta] PRIMARY KEY CLUSTERED 
(
	[preguntacod] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
