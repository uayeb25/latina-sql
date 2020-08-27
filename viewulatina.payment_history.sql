SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   view [ulatina].[payment_history]
as


with payment_history as (

	select	studentid,
			payment1amount payment
	from [ulatina].[FinanceInformation]
	where academiccycle not in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment1amount > 0 
	union

	
	select	studentid,
			payment2amount
	from [ulatina].[FinanceInformation]
	where academiccycle not in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment2amount > 0 
	union
	
	select	studentid,
			payment3amount
	from [ulatina].[FinanceInformation]
	where academiccycle not in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment3amount > 0 
	union
	
	select	studentid,
			payment4amount
	from [ulatina].[FinanceInformation]
	where academiccycle not in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment4amount > 0 
)

select	studentid,
		avg(payment) AVG_PMT_HIST
from payment_history
group by studentid
GO
