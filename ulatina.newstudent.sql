SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[newstudent](
	[studentid] [varchar](50) NOT NULL,
	[academiccycle] [varchar](80) NOT NULL,
	[highschool] [varchar](500) NULL,
	[highschooltype] [varchar](100) NULL,
	[graduationyear] [varchar](50) NULL,
	[enrollmentcohort] [varchar](50) NULL,
	[enrollmentyear] [varchar](50) NULL,
	[university] [varchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
ALTER TABLE [ulatina].[newstudent] ADD  CONSTRAINT [PK_ulatina.newstudent] PRIMARY KEY CLUSTERED 
(
	[studentid] ASC,
	[academiccycle] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
