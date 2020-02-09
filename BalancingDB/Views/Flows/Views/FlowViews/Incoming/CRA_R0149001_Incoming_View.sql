CREATE VIEW [dbo].[CRA_R0149001_Incoming_View]
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
	--GGD
      ,[GSPGroupDetails]
      ,[ActionCode]
      ,[RegistrationStatus]
      ,[GSPGroupId]
      ,[GSPGroupName]
      ,[EffectiveFromDate]
      ,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[GGD_V1] ON [GGD_V1].FK_FileHeaderId = AAA.FileHeaderId
