CREATE VIEW [dbo].[CRA_R0211001_Incoming_View]
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
	--BPA
	      ,[BSCPartyAgentDetails]
      ,BPA_V1.[AgentName] AS [AgentName_BPA]
      ,BPA_V1.[AgentId] AS [AgentId_BPA]
	--AR1
	      ,[AgentRoleDetails]
      ,AR1.[AgentType] AS [AgentType_AR1]
      ,AR1.[EffectiveFromDate] AS [EffectiveFromDate_AR1]
      ,AR1.[EffectiveToDate] AS [EffectiveToDate_AR1]
	--RAD
	      ,RAD_V1.[RoleAddressDetails] AS [RoleAddressDetails_RAD]
      ,RAD_V1.[AddressLine1] AS [AddressLine1_RAD]
      ,RAD_V1.[AddressLine2] AS [AddressLine2_RAD]
      ,RAD_V1.[AddressLine3] AS [AddressLine3_RAD]
      ,RAD_V1.[AddressLine4] AS [AddressLine4_RAD]
      ,RAD_V1.[AddressLine5] AS [AddressLine5_RAD]
      ,RAD_V1.[AddressLine6] AS [AddressLine6_RAD]
      ,RAD_V1.[AddressLine7] AS [AddressLine7_RAD]
      ,RAD_V1.[AddressLine8] AS [AddressLine8_RAD]
      ,RAD_V1.[AddressLine9] AS [AddressLine9_RAD]
      ,RAD_V1.[PostCode] AS [PostCode_RAD]
      ,RAD_V1.[Telephone No] AS [Telephone_No_RAD]
      ,RAD_V1.[FaxNo] AS [FaxNo_RAD]
      ,RAD_V1.[EMail Address] AS [EMailAddress_RAD]
	--ACD
	      ,[CertificationAccreditationDetails]
      ,[CertificationAccreditationStatus]
	--BSA
	      ,[BSCServiceAgentDetails]
      ,BSA_V1.[AgentName]
      ,BSA_V1.[AgentId]
	--SRD
	      ,[ServiceAgentRoleDetails]
      ,[SRD_V1].[AgentType]
      ,[SRD_V1].[EffectiveFromDate]
      ,[SRD_V1].[EffectiveToDate]
	--SAD
	      ,SAD_V1.[RoleAddressDetails]
      ,SAD_V1.[AddressLine1]
      ,SAD_V1.[AddressLine2]
      ,SAD_V1.[AddressLine3]
      ,SAD_V1.[AddressLine4]
      ,SAD_V1.[AddressLine5]
      ,SAD_V1.[AddressLine6]
      ,SAD_V1.[AddressLine7]
      ,SAD_V1.[AddressLine8]
      ,SAD_V1.[AddressLine9]
      ,SAD_V1.[PostCode]
      ,SAD_V1.[Telephone No]
      ,SAD_V1.[FaxNo]
      ,SAD_V1.[EMail Address]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BPA_V1] ON [BPA_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[AR1] ON [AR1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RAD_V1] ON [RAD_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[ACD] ON [ACD].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BSA_V1] ON [BSA_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SRD_V1] ON [SRD_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[SAD_V1] ON [SAD_V1].FK_FileHeaderId = AAA.FileHeaderId

