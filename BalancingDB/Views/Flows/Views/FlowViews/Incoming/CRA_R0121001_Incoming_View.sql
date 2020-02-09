CREATE VIEW [dbo].[CRA_R0121001_Incoming_View]
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
	--CED
	,[CRAEncryptionDetails]
	,[CRAEncryptionKey]
	,[EffectiveFromDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[CED_V1] ON [CED_V1].FK_FileHeaderId = AAA.FileHeaderId
