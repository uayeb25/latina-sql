SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [ulatina].[CE_BY_CA_HIST] 
as 
SELECT	studentid,
		avg(case when [creditsattempled] > 0 then  cast(cast([creditsearned] as float) / cast([creditsattempled] as float) as float) else 0 end) CE_BY_CA_HIST
FROM [ulatina].[academic]
where academiccycle not in (
	select [value] from ulatina.settings where category = 'Academic'
)
group by studentid
GO
