CREATE VIEW [dbo].[CRA_R0031_Outgoing_View]
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
	--FlowKeys
	,FlowKeys.[FlowId]
	,FlowKeys.[AgentId]
	--RA3
	,[RoleAddressDetails]
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
	,[RA3_V1].[EmailAddress] AS [EmailAddress_RA3]
	--ACD
	,[CertificationAccreditationDetails]
	,[CertificationAccreditationStatus]
	--AUL
	,[AuthorisationLevels]
	,[Activity]
	,[EffectiveFromDate]
	,[EffectiveToDate]
	--AUS
	,[AuthorisedSignatories]
	,[SignatoryName]
	,[Password]
	,[ContactPhoneNo]
	,[AUS].[EmailAddress] AS [EmailAddress_AUS]
	--ARD
	,[AgentRoleDetails]
	,[AgentType]
	,[RegistrationEffectiveFromDate]
	,[RegistrationEffectiveToDate]
	--BA2
	,[BSCPartyAgentDetails]
	,[ActionDescription]
	,[PartyAuthenticationName]
	,[PartyAuthenticationPassword]
	,[AgentName]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RA3_V1] ON [RA3_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AUS] ON [AUS].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AUL] ON [AUL].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[ACD] ON [ACD].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[ARD] ON [ARD].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BA2] ON [BA2].FK_FileHeaderId = AAA.FileHeaderId
