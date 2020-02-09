CREATE VIEW [dbo].[CRA_R0144001_Incoming_View]
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
	--BP1
	,[BSCServiceAgentDetails]
	,BP1_V1.[ActionCode] AS [ActionCode_BP1]
	,[AgentName]
	,BP1_V1.[AgentId]
	--SR4
	,[ServiceAgentRoleDetails]
	,SR4_V1.[ActionCode] AS [ActionCode_SR4]
	,[AgentType]
	,[RegistrationStatus]
	,[RegistrationEffectiveFromDate]
	,[RegistrationEffectiveToDate]
	--SA1
	,[RoleAddressDetails]
	,SA1_V1.[ActionCode] AS [ActionCode_SA1]
	,[AddressLine1]
	,[AddressLine2]
	,[AddressLine3]
	,[AddressLine4]
	,[AddressLine5]
	,[AddressLine6]
	,[AddressLine7]
	,[AddressLine8]
	,[AddressLine9]
	,[PostCode]
	,[TelephoneNo]
	,[FaxNo]
	,[EmailAddress]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BP1_V1] ON [BP1_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SR4_V1] ON [SR4_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SA1_V1] ON [SA1_V1].FK_FileHeaderId = AAA.FileHeaderId
