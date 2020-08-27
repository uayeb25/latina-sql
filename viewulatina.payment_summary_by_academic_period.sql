SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [ulatina].[payment_summary_by_academic_period]
as
with payment_history as (
	select	studentid,
			payment1amount payment,
			1 paid,
			academiccycle
	from [ulatina].[FinanceInformation]
	where payment1amount > 0  
	union
	select	studentid,
			payment2amount ,
			1 paid,
			academiccycle
	from [ulatina].[FinanceInformation]
	where payment2amount > 0  
	union
	select	studentid,
			payment3amount,
			1 paid,
			academiccycle
	from [ulatina].[FinanceInformation]
	where payment3amount > 0 
	union
	select	studentid,
			payment4amount,
			1 paid,
			academiccycle
	from [ulatina].[FinanceInformation]
	where payment4amount > 0  
)

select	studentid,
		academiccycle,
		avg(payment) AVG_PMT,
		sum(paid) N_PAYMENTS
from payment_history
group by studentid, academiccycle




GO
