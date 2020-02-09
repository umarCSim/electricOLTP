CREATE VIEW [dbo].[CRA_R0241001_Incoming_View]
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
	--PA1
	  ,[BSCPartyAgentDetails] 
      ,PA1_V1.[ActionCode] AS [ActionCode_PA1]
      ,PA1_V1.[AgentName] AS [AgentName_PA1]
	--AR4
	 ,[AgentRoleDetails]
      ,AR4.[ActionCode] AS [ActionCode_AR4]
      ,AR4.[AgentType] AS [AgentType_AR4]
      ,AR4.[EffectiveFromDate] AS [EffectiveFromDate_AR4]
      ,AR4.[EffectiveToDate] AS [EffectiveToDate_AR4]
	--RA4
	 ,RA4_V3.[RoleAddressDetails] AS [RoleAddressDetails_RA4]
      ,RA4_V3.[ActionCode]AS [ActionCode_RA4]
      ,RA4_V3.[AddressLine1]AS [AddressLine_RA4]
      ,RA4_V3.[AddressLine2]AS [AddressLine2_RA4]
      ,RA4_V3.[AddressLine3]AS [AddressLine3_RA4]
      ,RA4_V3.[AddressLine4]AS [AddressLine4_RA4]
      ,RA4_V3.[AddressLine5]AS [AddressLine5_RA4]
      ,RA4_V3.[AddressLine6]AS[AddressLine6_RA4]
      ,RA4_V3.[AddressLine7]AS [AddressLine7_RA4]
      ,RA4_V3.[AddressLine8] AS [AddressLine8_RA4]
      ,RA4_V3.[AddressLine9]AS [AddressLine9_RA4]
      ,RA4_V3.[PostCode]AS [PostCode_RA4]
      ,[TelephoneNo]
      ,RA4_V3.[FaxNo]AS [FaxNo_V3] 
      ,[EmailAddress]
	--AC1
	,[CertificationAccreditationDetails]
      ,AC1.	[ActionCode]AS [ActionCode_AC1]
      ,AC1.[CertificationAccreditationStatus]
	--BS3
	,[BSCServiceAgentDetails]
      ,BS3_V1.[ActionCode]AS [ActionCode_BS3]
      ,BS3_V1.[AgentName]
	--RD1
	  ,[ServiceAgentRoleDetails]
      ,RD1_V1.[ActionCode] AS [ActionCode_RD1]
      ,RD1_V1.[AgentType]
      ,RD1_V1.[EffectiveFromDate]
      ,RD1_V1.[EffectiveToDate]
	--RA5
	  ,RA5_V1.[RoleAddressDetails]
      ,RA5_V1.[ActionCode]
      ,RA5_V1.[AddressLine1]
      ,RA5_V1.[AddressLine2]
      ,RA5_V1.[AddressLine3]
      ,RA5_V1.[AddressLine4]
      ,RA5_V1.[AddressLine5]
      ,RA5_V1.[AddressLine6]
      ,RA5_V1.[AddressLine7]
      ,RA5_V1.[AddressLine8]
      ,RA5_V1.[AddressLine9]
      ,RA5_V1.[PostCode]
      ,RA5_V1.[Telephone No]
      ,RA5_V1.[FaxNo]
      ,[EMail Address]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN PA1_V1 ON PA1_V1.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN AR4 ON AR4.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN RA4_V3 ON RA4_V3.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN AC1 ON AC1.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN BS3_V1 ON BS3_V1.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN RD1_V1 ON RD1_V1.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN RA5_V1 ON RA5_V1.FK_FileHeaderId = AAA.FileHeaderId
