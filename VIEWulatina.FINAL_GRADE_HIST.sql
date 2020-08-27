SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [ulatina].[FINAL_GRADE_HIST]
as
SELECT studentid, CAST(avg([finalgrade]) AS FLOAT) FINAL_GRADE_HIST
from [ulatina].[registry]
where [academiccycle] not in (
	select [value] from ulatina.settings where category = 'Academic'
)
group by studentid
GO
