CREATE VIEW [dbo].[ECVAA_E0041_Outgoing_View]
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
	--OTD
	,[OmittedDataNoChange]
	,[NoChangetoExistingData]
	--CD9
	,[EnergyContractVolumes]
	,[SettlementPeriod]
	,[energycontractvolume]
	--EDN
	,[ECVNs]
	,[ECVNAAId]
	,[ECVNAAKey]
	,[ECVNECVNAAId]
	,[ECVNReferenceCode]
	,[EffectiveFromDate]
	,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[OTD_V1] ON [OTD_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[CD9] ON [CD9].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[EDN_V1] ON [EDN_V1].FK_FileHeaderId = AAA.FileHeaderId
