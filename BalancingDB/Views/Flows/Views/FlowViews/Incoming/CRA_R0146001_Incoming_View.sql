CREATE VIEW [dbo].[CRA_R0146001_Incoming_View]
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
	--TUD
	,[TradingUnitName1]
	,TUD_V1.[ActionCode] AS [ActionCode_TUD]
	,[RegistrationStatus]
	,[TradingUnitNames]
	--BU5
	,[BMUnitDetails]
	,BU5_v1.[ActionCode] AS [ActionCode_BU5]
	,[BMUnitId]
	,[EffectiveFromDate]
	,[EffectiveToDate]
FROM AAA
INNER JOIN FlowKeys ON FlowKeys.FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[RRH_V5] ON [RRH_V5].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[TUD_V1] ON [TUD_V1].FK_FileHeaderId = AAA.FileHeaderId
INNER JOIN [dbo].[BU5_v1] ON [BU5_v1].FK_FileHeaderId = AAA.FileHeaderId
