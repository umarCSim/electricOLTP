CREATE VIEW [dbo].[ECVAA_E0051_Outgoing_View]
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
	--MV2
	,[MVRreallocations]
	,[SettlementPeriod]
	,[MeteredVolumeFixedReallocation]
	,[MeteredVolumePercentageReallocation]
	--MVN
	,[MVRNs]
	,[MVRNAAId]
	,[MVRNAAkey]
	,[MVRNMVRNAAId]
	,[MVRNReferenceCode]
	,[EffectiveFromDate]
	,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[OTD_V1] ON [OTD_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[MV2_V2] ON [MV2_V2].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[MVN_V1] ON [MVN_V1].FK_FileHeaderId = AAA.FileHeaderId
