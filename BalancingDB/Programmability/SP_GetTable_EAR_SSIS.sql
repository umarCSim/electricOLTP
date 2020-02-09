CREATE PROCEDURE [dbo].[SP_GetTable_EAR_SSIS] @FileHeaderId INT
AS
SELECT [ECVNAARequest]
	,[AuthorizationChange] --This is NOT NULL
	,[ECVNAId]
	,[ECVNAName]
	,[ECVNAId2]
	,[ECVNAName2]
	,[ECVNAAId]
	,IIF(ISNULL([AssociatedVNNRIndicator], 0) = 0, '', '') AS [AssociatedVNNRIndicator]
	,[ReportRequirement]
	,CONCAT (
		FORMAT([EffectiveFromDate], 'yyyy')
		,FORMAT([EffectiveFromDate], 'MM')
		,FORMAT([EffectiveFromDate], 'dd')
		,FORMAT([EffectiveFromDate], 'hh')
		,FORMAT([EffectiveFromDate], 'mm')
		,FORMAT([EffectiveFromDate], 'ss')
		) AS [EffectiveFromDate]
	,CONCAT (
		FORMAT([EffectiveToDate], 'yyyy')
		,FORMAT([EffectiveToDate], 'MM')
		,FORMAT([EffectiveToDate], 'dd')
		,FORMAT([EffectiveToDate], 'hh')
		,FORMAT([EffectiveToDate], 'mm')
		,FORMAT([EffectiveToDate], 'ss')
		) AS [EffectiveToDate]
	,[NotificationAmendmentType]
	,CONCAT (
		FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'yyyy')
		,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'MM')
		,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'dd')
		,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'hh')
		,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'mm')
		,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'ss')
		) AS [NotificationAmendmentTypeEffectiveFromDate]
FROM [dbo].[EAR_V4]
WHERE FK_FileHeaderId = @FileHeaderId

RETURN 0
