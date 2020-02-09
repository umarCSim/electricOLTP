CREATE VIEW [dbo].[CRA_R0061_Outgoing_View]
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
	--TR1
	,[TradingUnitRegistrationHeader]
	,[ActionDescription]
	,[PartyAuthenticationName]
	,[PartyAuthenticationpassword]
	--TU1
	,[TradingUnitDetails]
	,[TradingUnitName]
	--BU2
	,[BMUnitDetails]
	,[BMUnitId]
	,[EffectiveFromDate]
	,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[TR1_V1] ON [TR1_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[TU1_V1] ON [TU1_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BU2_V1] ON [BU2_V1].FK_FileHeaderId = AAA.FileHeaderId
