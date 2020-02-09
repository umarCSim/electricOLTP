CREATE PROCEDURE [dbo].[SP_GetTable_MAR_SSIS] @FileHeaderId INT
AS
SELECT [MeterVolumeReallocations]
	,[MVRNAId]
	,[MVRNAName]
	,[MVRNAId2]
	,[MVRNAName2]
	,[MVRNAAId]
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
FROM [dbo].[MAR_V3]
WHERE FK_FileHeaderId = @FileHeaderId

RETURN 0
