SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ulatina].[Engines](
	[ModelName] [nvarchar](50) NULL,
	[ApiKey] [nvarchar](500) NULL,
	[Endpoint] [nvarchar](500) NULL,
	[Category] [nvarchar](10) NULL
) ON [PRIMARY]
GO
