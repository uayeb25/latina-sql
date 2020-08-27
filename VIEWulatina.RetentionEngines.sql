SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [ulatina].[RetentionEngines] AS
SELECT A.* 
FROM [ulatina].[Engines] A
INNER JOIN [ulatina].[EngineSchedule] B
ON A.Category = B.Category
WHERE B.ApKey = (SELECT [value] FROM [ulatina].[settings] 
WHERE category = 'Academic' AND [key] = 'academiccycle')
AND B.DateTo >= GETDATE() AND B.DateFrom <= GETDATE()
GO
