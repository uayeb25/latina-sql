SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [ulatina].[RiskStudent] AS
SELECT
  University,
  TotalStudents,
  Red,
  Yellow,
  Green
FROM (SELECT
  A.University,
  GeneralRisk,
  TotalStudents,
  CAST((CAST(COUNT(B.LaureateKey) AS decimal(10, 2)) / CAST(TotalStudents AS decimal(10, 2))) * 100 AS decimal(10, 2)) AS studcount
FROM (SELECT
  University,
  COUNT(LaureateKey) AS TotalStudents
FROM [ulatina].[RetentionReport]
GROUP BY University) A
INNER JOIN [ulatina].[RetentionReport] B
  ON A.University = B.University
GROUP BY A.University,
         GeneralRisk,
         TotalStudents) ex
PIVOT (
MAX(studcount)
FOR GeneralRisk IN
(Green, Red, Yellow)) AS pvt
GO
