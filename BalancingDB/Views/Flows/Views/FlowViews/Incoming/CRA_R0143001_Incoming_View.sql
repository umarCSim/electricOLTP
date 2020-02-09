CREATE VIEW [dbo].[CRA_R0143001_Incoming_View]
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
	--BA3
	,[BSCPartyAgentDetails]
	,BA3.[ActionCode] AS [ActionCode_BA3]
	,[AgentName]
	,BA3.[AgentId]
	--AR3
	,[AgentRoleDetails]
	,AR3.[ActionCode] AS [ActionCode_AR3]
	,[AgentType]
	,[RegistrationStatus]
	,[RegistrationEffectiveFromDate]
	,[RegistrationEffectiveToDate]
	--RA4
	,[RoleAddressDetails]
	,RA4_V3.[ActionCode] AS [ActionCode_RA4]
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
	,RA4_V3.[EmailAddress] AS [EmailAddress_RA4]
	--AC1
	,[CertificationAccreditationDetails]
	,AC1.[ActionCode] AS [ActionCode_AC1]
	,[CertificationAccreditationStatus]
	--AU1
	,[AuthorisedSignatories]
	,AU1.[ActionCode] AS [ActionCode_AU1]
	,[SignatoryName]
	,[Password]
	,[ContactPhoneNo]
	,AU1.[EMailAddress]
	--AU2
	,[AuthorisationLevels]
	,AU2.[ActionCode] AS [ActionCode_AU2]
	,[Activity]
	,AU2.[EffectiveFromDate] AS [EffectiveFromDate_AU2]
	,AU2.[EffectiveToDate] AS [EffectiveToDate_AU2]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AU2] ON [AU2].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AU1] ON [AU1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RA4_V3] ON [RA4_V3].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AC1] ON [AC1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AR3] ON [AR3].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BA3] ON [BA3].FK_FileHeaderId = AAA.FileHeaderId
