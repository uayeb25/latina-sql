SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  view [ulatina].[payment_summary]
as
with payment_history as (
	select	studentid,
			payment1amount payment,
			1 paid
	from [ulatina].[FinanceInformation]
	where academiccycle in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment1amount > 0 
	union
	select	studentid,
			payment2amount ,
			1 paid
	from [ulatina].[FinanceInformation]
	where academiccycle in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment2amount > 0 
	union
	select	studentid,
			payment3amount,
			1 paid
	from [ulatina].[FinanceInformation]
	where academiccycle in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment3amount > 0 
	union
	select	studentid,
			payment4amount,
			1 paid 
	from [ulatina].[FinanceInformation]
	where academiccycle in (
		select [value] from ulatina.settings where category = 'Academic'
	) and payment4amount > 0 
)

select	studentid,
		avg(payment) AVG_PMT,
		sum(paid) N_PAYMENTS
from payment_history
group by studentid


GO
