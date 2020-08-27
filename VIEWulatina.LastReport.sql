SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [ulatina].[LastReport] AS
SELECT WO.LaureateKey,
	   WO.ApKey,
	   WO.WkOfAp,
	   WO.RiskDecile,
	   WO.ScoredProbability,
	   WO.GeneralRisk,
	   WO.Factor1,
	   WO.Factor2,
	   WO.Factor3,
	   WO.Factor4,
	   SA.age,
	   SA.gender,
	   SA.campus,
	   SA.career,
	   SA.city,
	   SA.credits,
	   SA.courses,
	   WCV.DaysWithoutFinancialActivity,
	   SA.degree,
	   SA.discountpercent,
	   CAST(SA.finalgrade AS float) finalgrade,
	   SA.highschooltype,
	   SA.maritalstatus,
	   SA.numacademiccycles,
	   SA.paymentplan,
	   SA.PaymentsOwed,
	   SA.schedule,
	   SA.scholarshipflag,
	   SA.scholarshippercent,
	   SA.scholarshiptype,
	   SA.university,
	   WCV.LatePayments,
	   SA.PercCreditsEarned,
       SA.studenttype,
       SA.studentsubtype,
	   SA.coursesRegistry,
	   SA.totalbalance
FROM [ulatina].[WeeklyOutput] WO
LEFT JOIN [ulatina].[Sabana] SA
ON WO.LaureateKey = SA.studentid AND WO.ApKey = SA.academiccycle AND WO.WkOfAp = SA.week
LEFT JOIN [ulatina].[WeeklyCalculatedVariables] WCV
ON WO.LaureateKey = WCV.studentid AND WO.ApKey = WCV.academiccycle AND WO.WkOfAp = WCV.week
WHERE WO.WkOfAp = (select value-1 from ulatina.settings where category = 'Week' AND [key] = 'Week') AND
WO.ApKey = (select value from ulatina.settings where category = 'Academic' AND [key] = 'academiccycle')
GO
