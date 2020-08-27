SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[EncuestaEstudiantes](
	[studentid] [nvarchar](100) NOT NULL,
	[academiccycle] [nvarchar](80) NOT NULL,
	[university] [nvarchar](100) NOT NULL,
	[preguntacod] [int] NOT NULL,
	[studenttype] [nvarchar](100) NULL,
	[answer] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[EncuestaEstudiantes] ADD  CONSTRAINT [PK_ulatina.encuestaEstudiante] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[academiccycle] ASC,
	[preguntacod] ASC,
	[university] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
ALTER TABLE [ulatina].[EncuestaEstudiantes]  WITH CHECK ADD  CONSTRAINT [FK_EncuestaEstudiantes_Estudiantes_Preguntacod] FOREIGN KEY([preguntacod])
REFERENCES [ulatina].[Encuesta] ([preguntacod])
GO
ALTER TABLE [ulatina].[EncuestaEstudiantes] CHECK CONSTRAINT [FK_EncuestaEstudiantes_Estudiantes_Preguntacod]
GO
