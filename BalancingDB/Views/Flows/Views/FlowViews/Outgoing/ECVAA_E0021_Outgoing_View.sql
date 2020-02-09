CREATE VIEW [dbo].[ECVAA_E0021_Outgoing_View]
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
	--CPD
	,[CounterPartyDetails]
	,[ECVParty1Id]
	,[ECVParty1Name]
	,[ECVParty1ProductionConsumptionFlag]
	,[ECVParty2Id]
	,[ECVParty2Name]
	,[ECVParty2ProductionConsumptionFlag]
	--EAR
	,[ECVNAARequest]
	,[AuthorizationChange]
	,[ECVNAId]
	,[ECVNAName]
	,[ECVNAId2]
	,[ECVNAName2]
	,[ECVNAAId]
	,[AssociatedVNNRIndicator]
	,[ReportRequirement]
	,[EffectiveFromDate]
	,[EffectiveToDate]
	,[NotificationAmendmentType]
	,[NotificationAmendmentTypeEffectiveFromDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[CPD_V4] ON [CPD_V4].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[EAR_V4] ON [EAR_V4].FK_FileHeaderId = AAA.FileHeaderId
