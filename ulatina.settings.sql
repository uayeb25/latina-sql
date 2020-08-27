SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[settings](
	[category] [nvarchar](255) NULL,
	[key] [nvarchar](255) NULL,
	[value] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [ulatina].[settings] ADD  CONSTRAINT [PK_settings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF) ON [PRIMARY]
GO
