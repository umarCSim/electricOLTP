CREATE PROCEDURE [dbo].[SP_GetTable_BU1_SSIS] @FileHeaderId INT
AS
SELECT [BMUnitDetails]
	,[BMUnitName]
	,[BU1_V2].[BMUnitId]
	,[BMUnitType]
	,[NGCBMUnitName]
	,[Zone]
	,[NationalGridReference]
	,[GSPGroupId]
	,[GenerationCapacity]
	,[DemandCapacity]
	,[ProductionConsumptionFlag]
	,IIF(ISNULL([BaseTUFlag], 0) = 0, '', '') AS [BaseTUFlag]
	,IIF(ISNULL([FPNFlag], 0) = 0, '', '') AS [FPNFlag]
	,[InterconnectorId]
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
FROM [dbo].[BU1_V2]
WHERE [FK_FileHeaderId] = @FileHeaderId

RETURN 0
