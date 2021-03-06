﻿CREATE VIEW [dbo].[CRA_R014A001_Incoming_View]
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
	--GPD
      ,[GSPDetails]
      ,[ActionCode]
      ,[RegistrationStatus]
      ,[GSPId]
      ,[EffectiveFromDate]
      ,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[GPD_V1] ON [GPD_V1].FK_FileHeaderId = AAA.FileHeaderId
