CREATE VIEW [dbo].[CRA_R0021_Outgoing_View]
AS
SELECT 
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
	,[InterconnectorErrorAdministratorData]
	,[InterconnectorErrorAdministratorId]
	,[EffectiveFromDate]
	,[EffectiveToDate]
	,[InterconnectorDetails]
	,[InterconnectorId]
	,[InterconnectorAdministratoDetails]
	,[ActionDescription]
	,[PartyAuthenticationName]
	,[PartyAuthenticationPassword]
	,[InterconnectorAdministratorId]
	,[FileSent]
FROM AAA A
INNER JOIN FlowKeys FK ON FK.FK_FileHeaderId = A.FileHeaderId
INNER JOIN IE2_V1 IE2 ON IE2.FK_FileHeaderId = A.FileHeaderId
INNER JOIN EIC_V1 EIC ON EIC.FK_FileHeaderId = A.FileHeaderId
INNER JOIN IA2_V1 IA2 ON IA2.FK_FileHeaderId = A.FileHeaderId
