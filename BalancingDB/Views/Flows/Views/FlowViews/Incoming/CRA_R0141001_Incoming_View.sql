CREATE VIEW [dbo].[CRA_R0141001_Incoming_View]
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
	--PD6
	,[BSCPartyDetails]
	,PD6_V1.[ActionCode] AS [ActionCode_PD6]
	,[BSCPartyName]
	,[BSCPartyId]
	--PR9
	,[PartyRoleDetails]
	,PR9_V1.[ActionCode] AS [ActionCode_PR9]
	,[PartyType]
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
	--SP9
	,[Stage2ParticipantDetails]
	,SP9_V1.[ActionCode] AS [ActionCode_SP9]
	,[Stage2ParticipantId]
	--AU1
	,[AuthorisedSignatories]
	,AU1.[ActionCode] AS [ActionCode_AU1]
	,[SignatoryName]
	,[Password]
	,[ContactPhoneNo]
	,AU1.[EMailAddress]
	--SR3
	,[SettlementReportDetails]
	,SR3_V1.[ActionCode] AS [ActionCode_SR3]
	,[ReportType]
	,[DistributionMethod]
	--AU2
	,[AuthorisationLevels]
	,AU2.[ActionCode] AS [ActionCode_AU2]
	,[Activity]
	,AU2.[EffectiveFromDate] AS [EffectiveFromDate_AU2]
	,AU2.[EffectiveToDate] AS [EffectiveToDate_AU2]
	--IUD
	,[InterconnectorErrorAdministrationDetails]
	,IUD_V1.[ActionCode] AS [ActionCode_IUD]
	,[InterconnectorId]
	,IUD_V1.[EffectiveFromDate]
	,IUD_V1.[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[PD6_V1] ON [PD6_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[PR9_V1] ON [PR9_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RA4_V3] ON [RA4_V3].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SP9_V1] ON [SP9_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AU1] ON [AU1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SR3_V1] ON [SR3_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AU2] ON [AU2].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[IUD_V1] ON [IUD_V1].FK_FileHeaderId = AAA.FileHeaderId
