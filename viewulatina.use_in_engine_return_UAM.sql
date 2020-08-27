SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  view [ulatina].[use_in_engine_return_UAM]
as
select distinct
	 r.[studentid],
	  a.[academiccycle],
	   r.career,
	 
	upper([gender]) GENDER,
	upper([maritalstatus]) MARITAL_STATUS,
	[age] AGE,
	substring([zipcode],1,1) ZIPCODE_GROUP,
	upper([city]) CITY,
	upper([state]) AS [STATE],
	upper([highschooltype]) HIGH_SHOOL_TYPE,
	year(getdate()) - cast([graduationyear] as int) TIME_BTW_STUDIES,
	upper(r.[degree]) DEGREE_LEVEL,
	upper(r.[faculty]) FACULTY_OR_SCHOOL,
	upper(r.campus) CAMPUS,
	upper([enrollmentcohort]) ENROLMENT_COHORT,
	[enrollmentyear] ENROLMENT_YEAR,
	[numacademiccycles] NUM_ACADEMIC_CYCLES,
	r.[creditsearned] CREDITS_EARNED,
	[creditsattempled] CREDITS_ATTEMPTED,
	upper([schedule]) SCHEDULE,
	datediff(day,cast([classstartdate] as date),cast([enrollmentdate] as date)) TIME_TO_START,	
	[credits] CREDITS_ENROLLED,
	upper(r.[courses]) COURSES_ENROLLED,
	upper([studentsubtype]) STUDENT_SUB_TYPE,
	upper([scholarshipflag]) SHOLARSHIP_FLAG,
	[scholarshippercent] SCHOLARSHIP_PERCENT,
	[discountpercent] DISCOUNT_PERCENT,
	upper([paymentplan]) PAYMENT_PLAN,
	[coursesfailed] TOTAL_COURSES_FAILURE_HIST,
	isnull(FINAL_GRADE_HIST.FINAL_GRADE_HIST,0) FINAL_GRADE_HIST,
	isnull([AVG_PMT_HIST],0) AVG_PMT_HIST,
	isnull([AVG_PMT],0) AVG_PMT,
	isnull([N_PAYMENTS],0) N_PAYMENTS,
	isnull(STOPOUT_FLAG_HIST.STOPOUT_FLAG_HIST,0) STOPOUT_FLAG_HIST,
	CE_BY_CA_HIST
from [ulatina].[academic] a 
left join [ulatina].[demographic] d
on a.studentid = d.studentid and a.academiccycle = d.academiccycle
left join [ulatina].[registry] r 
on a.studentid = r.studentid and a.academiccycle = r.academiccycle
left join [ulatina].[scholarshipInformation] ss
on a.studentid = ss.studentid and a.academiccycle = ss.academiccycle
left join [ulatina].[newstudent] ns
on a.studentid = ns.studentid and a.academiccycle = ns.academiccycle
left join [ulatina].[FinanceInformation] f
on a.studentid = f.studentid and a.academiccycle = f.academiccycle
left join ulatina.payment_history ph
on a.studentid = ph.studentid
left join ulatina.payment_summary ps
on a.studentid = ps.studentid
left join [ulatina].[questions_to_use] q
on a.studentid = q.studentid
left join [ulatina].STOPOUT_FLAG_HIST
on a.studentid = STOPOUT_FLAG_HIST.studentid
left join [ulatina].FINAL_GRADE_HIST
on a.studentid = [ulatina].FINAL_GRADE_HIST.studentid
left join ulatina.CE_BY_CA_HIST
on a.studentid = ulatina.CE_BY_CA_HIST.studentid
where a.[academiccycle] in (
	select [value] from ulatina.settings where category = 'Academic'
)
and studenttype not in ('REGRESO','NUEVO')
and a.university = 'UAM'





GO
