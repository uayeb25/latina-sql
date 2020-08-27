SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [ulatina].[Sabana] AS
SELECT A.studentid,
	   A.academiccycle,
	   (select [value] from [ulatina].[settings] 
where category = 'Week' AND [key] = 'Week') week,
	   R.university,
	   A.courses,
	   A.career,
	   ISNULL(CAST(A.creditsearned AS FLOAT)/NULLIF(A.creditsattempled,0),0) PercCreditsEarned,
	   D.gender,
	   D.age,
	   D.maritalstatus,
	   D.city,
	   F.paymentplan,
	   F.totalbalance,
	   F.payment1date,
	   F.payment2date,
	   F.payment3date,
	   F.payment4date,
	   ISNULL(FC.DaysWithoutFinancialActivity,DATEDIFF(day,R.classstartdate,GETDATE())) DaysWithoutFinancialActivity,
	   ISNULL(FC.PaymentsOwed,0) PaymentsOwed,
	   IIF(F.payment1date = '1900-01-01' OR F.payment1date > PS.P1DueDate,1,0) Late1,
	   IIF(F.payment2date = '1900-01-01' OR F.payment2date > PS.P2DueDate,1,0) Late2,
	   IIF(F.payment3date = '1900-01-01' OR F.payment3date > PS.P3DueDate,1,0) Late3,
	   IIF(F.payment4date = '1900-01-01' OR F.payment4date > PS.P4DueDate,1,0) Late4,
	   NS.highschooltype,
	   R.faculty,
	   R.finalgrade,
	   R.courses coursesRegistry,
	   R.studenttype,
	   R.credits,
	   R.studentsubtype,
	   R.campus,
	   R.degree,
	   R.numacademiccycles,
	   R.schedule,
	   R.enrollmentdate,
	   R.classstartdate,
	   CAST(SI.discountpercent as float) discountpercent,
	   SI.scholarshiptype,
	   CAST(SI.scholarshippercent as float) scholarshippercent,
	   R.scholarshipflag
FROM [ulatina].[academic] A
LEFT JOIN [ulatina].[demographic] D
ON A.studentid = D.studentid AND A.academiccycle = D.academiccycle
LEFT JOIN [ulatina].[FinanceInformation] F
ON A.studentid = F.studentid AND A.academiccycle = F.academiccycle
LEFT JOIN [ulatina].[registry] R
ON A.studentid = R.studentid AND A.academiccycle = R.academiccycle
LEFT JOIN [ulatina].[newstudent] NS
ON A.studentid = NS.studentid AND A.academiccycle = NS.academiccycle
LEFT JOIN [ulatina].[scholarshipInformation] SI
ON A.studentid = SI.studentid AND A.academiccycle = SI.academiccycle
LEFT JOIN (select F.studentid,
	   F.academiccycle,
	   A.DaysWithoutFinancialActivity,
	   C.PaymentsOwed
from [ulatina].[FinanceInformation] F
LEFT JOIN [ulatina].[registry] R
ON F.studentid = R.studentid AND F.academiccycle = R.academiccycle
cross apply (select min(py) DaysWithoutFinancialActivity
from (VALUES (DATEDIFF(day,F.payment1date,GETDATE())),
(DATEDIFF(day,F.payment2date,GETDATE())),
(DATEDIFF(day,F.payment3date,GETDATE())),
(DATEDIFF(day,F.payment4date,GETDATE())),
(DATEDIFF(day,R.classstartdate,GETDATE()))) AS a(py)) A
cross apply (select count(pyow) PaymentsOwed
from (VALUES (payment1date),(payment2date),(payment3date),(payment4date)) AS a(pyow)
where pyow = '1900-1-1') C
where paymentplan != 'CONTADO') FC
ON A.studentid = FC.studentid AND A.academiccycle = FC.academiccycle
LEFT JOIN [ulatina].[PaymentSchedule] PS
ON A.academiccycle = PS.ApKey
WHERE A.academiccycle = (select min([value]) from [ulatina].[settings] 
where category = 'Academic' AND [key] = 'academiccycle')



GO
