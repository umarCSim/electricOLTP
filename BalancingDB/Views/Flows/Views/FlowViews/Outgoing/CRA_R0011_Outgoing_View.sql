CREATE VIEW [dbo].[CRA_R0011_Outgoing_View]
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
	--PD5
	,[BSCPartyDetails]
	,[ActionDescription]
	,[PartyAuthenticationName]
	,[PartyAuthenticationPassword]
	,[BSCPartyName]
	,[BSCPartyId]
	,[PartyAuthenticationKeyDetails]
	--PRD
	,[PartyRoleDetails]
	,[PartyType]
	,[RegistrationEffectiveFromDate]
	,[RegistrationEffectiveToDate]
	--RA2
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
	,[RA2_V1].[EmailAddress] AS [EmailAddress_RA2]
	--SPT
	,[Stage2ParticipantDetails]
	,[Stage2ParticipantId]
	--AUS
	,[AuthorisedSignatories]
	,[SignatoryName]
	,[Password]
	,[ContactPhoneNo]
	,[AUS].[EmailAddress] AS [EmailAddress_AUS]
	--AUL
	,[AUL].[AuthorisationLevels]
	,[AUL].[Activity] AS [Activity_AUL]
	,[AUL].[EffectiveFromDate] AS [EffectiveFromDate_AUL]
	,[AUL].[EffectiveToDate] AS [EffectiveToDate_AUL]
	--SR2
	,[SettlementReportDetails]
	,[ReportType]
	,[DistributionMethod]
	--IE3
	,[InterconnectorErrorAdministratorDetails]
	,[InterconnectorId]
	,[IE3_V1].[EffectiveFromDate] AS [EffectiveFromDate_IE3]
	,[IE3_V1].[EffectiveToDate] AS [EffectiveToDate_IE3]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[PD5_V1] ON [PD5_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[PRD_V1] ON [PRD_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RA2_V1] ON [RA2_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SPT_V1] ON [SPT_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AUS] ON [AUS].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AUL] ON [AUL].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SR2_V1] ON [SR2_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[IE3_V1] ON [IE3_V1].FK_FileHeaderId = AAA.FileHeaderId
