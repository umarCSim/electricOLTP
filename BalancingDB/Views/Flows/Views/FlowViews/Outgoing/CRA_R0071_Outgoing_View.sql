CREATE VIEW [dbo].[CRA_R0071_Outgoing_View]
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
	--MSG
	,[MessageDetails]
	,[ActionDescription]
	,[AuthorisedSignatory]
	,[Password]
	--BP2
	,[PointDetails]
	,[PointId]
	,[PointType]
	,[EffectiveFromDate]
	,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[MSG_V1] ON [MSG_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN dbo.BP2 ON BP2.FK_FileHeaderId = AAA.FileHeaderId
