CREATE VIEW [dbo].[CRA_R0142001_Incoming_View]
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
	--IAD
	,[InterconnectorAdministratorDetails]
	,IAD_V1.[ActionCode] AS [ActionCode_IAD]
	,[RegistrationStatus]
	,[InterconnectorAdministratorId]
	--EI9
	,[InterconnectorDetails]
	,[EI9_V1].[ActionCode] AS [ActionCode_EI9]
	,[InterconnectorId]
	--IE9
	,[InterconnectorErrorAdministratorData]
	,[IE9_V1].[ActionCode] AS [ActionCode_IE9]
	,[InterconnectorErrorAdministratorId]
	,[EffectiveFromDate]
	,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[IAD_V1] ON [IAD_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[EI9_V1] ON [EI9_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[IE9_V1] ON [IE9_V1].FK_FileHeaderId = AAA.FileHeaderId
