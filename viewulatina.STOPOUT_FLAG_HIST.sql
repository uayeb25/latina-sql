SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [ulatina].[STOPOUT_FLAG_HIST]
as
select distinct	studentid,
		1 STOPOUT_FLAG_HIST
from [ulatina].[registry]
where [stopoutflag] = 1
GO
