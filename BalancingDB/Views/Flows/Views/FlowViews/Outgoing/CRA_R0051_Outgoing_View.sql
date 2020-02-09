CREATE VIEW [dbo].[CRA_R0051_Outgoing_View]
AS
SELECT
	--AAA
	[FileHeaderId]
	,[FlowKeyId]
	,[RecordType]
	,[FileType]
	,[MessageRole]
	,[CreationTime]
	,[FromRoleCode]
	,[FromParticipantId]
	,[ToRoleCode]
	,[ToParticipantId]
	,[SequenceNumber]
	,[TestDataFlag]
	,[FileSent]
	--JBB
	,[BMUnitGroupMember]
	,[JBB_V2].[BMUnitId] AS [BMUnitId_JBB]
	--BR2
	,[BMUnitRegistrationHeader]
	,[ActionDescription]
	,[PartyAuthenticationName]
	,[PartyAuthenticationpassword]
	--BU1
	,[BMUnitDetails]
	,[BMUnitName]
	,[BU1_V2].[BMUnitId] AS [BMUnitId_BU1]
	,[BMUnitType]
	,[NGCBMUnitName]
	,[Zone]
	,[NationalGridReference]
	,[GSPGroupId]
	,[GenerationCapacity]
	,[DemandCapacity]
	,[ProductionConsumptionFlag]
	,[BaseTUFlag]
	,[FPNFlag]
	,[InterconnectorId]
	,[BU1_V2].[EffectiveFromDate] AS [EffectiveFromDate_BU1]
	,[BU1_V2].[EffectiveToDate] AS [EffectiveToDate_BU1]
	--JB1
	,[BMUnitGroupDetails]
	,[JointBMUnitId]
	,[JB1_V2].[EffectiveFromDate] AS [EffectiveFromDate_JB1]
	,[JB1_V2].[EffectiveToDate] AS [EffectiveToDate_JB1]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[JBB_V2] ON JBB_V2.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BR2_V2] ON BR2_V2.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BU1_V2] ON BU1_V2.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[JB1_V2] ON JB1_V2.FK_FileHeaderId = AAA.FileHeaderId
