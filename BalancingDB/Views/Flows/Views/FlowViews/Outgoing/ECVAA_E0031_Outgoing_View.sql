CREATE VIEW [dbo].[ECVAA_E0031_Outgoing_View]
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
	--LSD
	,[LeadSubsidiaryPartyPairDetails]
	,[BMUnitId]
	,[LeadPartyId]
	,[LeadPartyName]
	,[LeadPartyProductionConsumptionFlag]
	,[SubsidiaryPartyId]
	,[SubsidiaryPartyName]
	,[SubsidiaryPartyProductionConsumptionFlag]
	--MAR
	,[MeterVolumeReallocations]
	,[MVRNAId]
	,[MVRNAName]
	,[MVRNAId2]
	,[MVRNAName2]
	,[MVRNAAId]
	,[AssociatedVNNRIndicator]
	,[ReportRequirement]
	,[EffectiveFromDate]
	,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[LSD_V3] ON [LSD_V3].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[MAR_V3] ON [MAR_V3].FK_FileHeaderId = AAA.FileHeaderId
