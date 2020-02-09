CREATE VIEW [dbo].[CRA_R0145005_Incoming_View]
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
	--RRH
	,[RegistrationReportHeader]
	,[RequestingRegistrant]
	,[RegistrationType]
	--BU3
	,[BMUnitDetails]
	,BU3_V5.[ActionCode] AS [ActionCode_BU3]
	,[RegistrationStatus]
	,[BMUnitName]
	,BU3_V5.[BMUnitId] AS [BMUnitId_BU3]
	,[BMUnitType]
	,[NGCBMUnitName]
	,[Zone]
	,[NationalGridReference]
	,[GSPGroupId]
	,[GenerationCapacity]
	,[DemandCapacity]
	,[TransmissionLossFactor]
	,[WorkingDayCreditAssessmentLoadFactor]
	,[NonWorkingDayCreditAssessmentLoadFactor]
	,[SupplierExportCreditAssessmentLoadFactor]
	,[WorkingDayBmUnitCreditAssessmentImportCapability]
	,[NonWorkingDayBmUnitCreditAssessmentImportCapability]
	,[WorkingDayBmUnitCreditAssessmentExportCapability]
	,[NonWorkingDayBmUnitCreditAssessmentExportCapability]
	,[ProductionConsumptionFlag]
	,[ProductionConsumptionStatus]
	,[ExemptExportFlag]
	,[ManualCreditQualifyingFlag]
	,[CreditQualifyingStatus]
	,[BaseTUFlag]
	,[FPNFlag]
	,[InterconnectorId]
	,BU3_V5.[EffectiveFromDate] AS [EffectiveFromDate_BU3_V5]
	,BU3_V5.[EffectiveToDate] AS [EffectiveToDate_BU3_V5]
	--JB2
	,[BMUnitGroupDetails]
	,JB2_V5.[ActionCode] AS [ActionCode_JB2]
	,[JointBMUnitId]
	,JB2_V5.[EffectiveFromDate] AS [EffectiveFromDate_JB2]
	,JB2_V5.[EffectiveToDate] AS [EffectiveToDate_JB2]
	--JB3
	,[BMUnitGroupMember]
	,JB3_V5.[ActionCode] AS [ActionCode_JB3]
	,JB3_V5.[BMUnitId] AS [BMUnitId_JB3]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BU3_V5] ON [BU3_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[JB2_V5] ON [JB2_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[JB3_V5] ON [JB3_V5].FK_FileHeaderId = AAA.FileHeaderId
