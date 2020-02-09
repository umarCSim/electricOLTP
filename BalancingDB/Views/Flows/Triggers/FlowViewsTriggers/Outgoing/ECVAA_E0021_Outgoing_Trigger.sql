CREATE TRIGGER [ECVAA_E0021_Outgoing_View_Trigger_Insert] ON [dbo].[ECVAA_E0021_Outgoing_View]
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @FK_HeaderId INT
		,@FK_FlowKeyId INT
		,@Inserted_Id INT
	DECLARE @HeaderSequenceNumber BIGINT

	EXECUTE [dbo].[SP_GetNextSequenceValue] 'Sequence_Outgoing_Flow_Header'
		,@HeaderSequenceNumber OUT

	INSERT INTO [dbo].[AAA] (
		[RecordType]
		,[FileType]
		,[MessageRole]
		,[CreationTime]
		,[FromRoleCode]
		,[FromParticipantId]
		,[ToRoleCode]
		,[ToParticipantId]
		,[SequenceNumber]
		,[TestDataFlag]
		)
	SELECT ISNULL([RecordType], 'AAA')
		,[FileType]
		,[MessageRole]
		,[CreationTime]
		,[FromRoleCode]
		,[FromParticipantId]
		,[ToRoleCode]
		,[ToParticipantId]
		,@HeaderSequenceNumber
		,ISNULL([TestDataFlag], 'NONE')
	FROM inserted

	SET @FK_HeaderId = SCOPE_IDENTITY()

	INSERT INTO dbo.FlowKeys (
		FlowId
		,FK_FileHeaderId
		)
	SELECT '0071'
		,@FK_HeaderId

	SET @FK_FlowKeyId = SCOPE_IDENTITY()

	INSERT INTO dbo.CPD_V4 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[CounterPartyDetails]
		,[ECVParty1Id]
		,[ECVParty1Name]
		,[ECVParty1ProductionConsumptionFlag]
		,[ECVParty2Id]
		,[ECVParty2Name]
		,[ECVParty2ProductionConsumptionFlag]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[CounterPartyDetails]
		,[ECVParty1Id]
		,[ECVParty1Name]
		,[ECVParty1ProductionConsumptionFlag]
		,[ECVParty2Id]
		,[ECVParty2Name]
		,[ECVParty2ProductionConsumptionFlag]
	FROM inserted

	INSERT INTO dbo.EAR_V4 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[ECVNAARequest]
		,[AuthorizationChange]
		,[ECVNAId]
		,[ECVNAName]
		,[ECVNAId2]
		,[ECVNAName2]
		,[ECVNAAId]
		,[AssociatedVNNRIndicator]
		,[ReportRequirement]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		,[NotificationAmendmentType]
		,[NotificationAmendmentTypeEffectiveFromDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[ECVNAARequest]
		,[AuthorizationChange]
		,[ECVNAId]
		,[ECVNAName]
		,[ECVNAId2]
		,[ECVNAName2]
		,[ECVNAAId]
		,[AssociatedVNNRIndicator]
		,[ReportRequirement]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		,[NotificationAmendmentType]
		,[NotificationAmendmentTypeEffectiveFromDate]
	FROM inserted
END
GO

CREATE TRIGGER [ECVAA_E0021_Outgoing_View_Trigger_Update] ON [dbo].[ECVAA_E0021_Outgoing_View]
INSTEAD OF UPDATE
AS
BEGIN
	SET NOCOUNT ON

	IF (
			SELECT [AAA].FileSent
			FROM [AAA]
			INNER JOIN inserted ON inserted.[FileHeaderId] = [AAA].FileHeaderId
			) = 0
	BEGIN
		UPDATE [dbo].[AAA]
		SET [AAA].[RecordType] = inserted.RecordType
			,[AAA].[FileType] = inserted.FileType
			,[AAA].[MessageRole] = inserted.MessageRole
			,[AAA].[CreationTime] = inserted.CreationTime
			,[AAA].[FromRoleCode] = inserted.FromRoleCode
			,[AAA].[FromParticipantId] = inserted.FromParticipantId
			,[AAA].[ToRoleCode] = inserted.ToRoleCode
			,[AAA].[ToParticipantId] = inserted.ToParticipantId
			,[AAA].[SequenceNumber] = inserted.SequenceNumber
			,[AAA].[TestDataFlag] = inserted.TestDataFlag
		FROM [AAA]
		INNER JOIN inserted ON inserted.[FileHeaderId] = AAA.FileHeaderId

		UPDATE [dbo].[CPD_V4]
		SET [CounterPartyDetails] = inserted.CounterPartyDetails
			,[ECVParty1Id] = inserted.ECVParty1Id
			,[ECVParty1Name] = inserted.ECVParty1Name
			,[ECVParty1ProductionConsumptionFlag] = inserted.ECVParty1ProductionConsumptionFlag
			,[ECVParty2Id] = inserted.ECVParty2Id
			,[ECVParty2Name] = inserted.ECVParty2Name
			,[ECVParty2ProductionConsumptionFlag] = inserted.ECVParty2ProductionConsumptionFlag
		FROM [CPD_V4]
		INNER JOIN inserted ON inserted.[FileHeaderId] = CPD_V4.FK_FileHeaderId

		UPDATE [dbo].[EAR_V4]
		SET [ECVNAARequest] = inserted.ECVNAARequest
			,[AuthorizationChange] = inserted.AuthorizationChange
			,[ECVNAId] = inserted.ECVNAId
			,[ECVNAName] = inserted.ECVNAName
			,[ECVNAId2] = inserted.ECVNAId2
			,[ECVNAName2] = inserted.ECVNAName2
			,[ECVNAAId] = inserted.ECVNAAId
			,[AssociatedVNNRIndicator] = inserted.AssociatedVNNRIndicator
			,[ReportRequirement] = inserted.ReportRequirement
			,[EffectiveFromDate] = inserted.EffectiveFromDate
			,[EffectiveToDate] = inserted.EffectiveToDate
			,[NotificationAmendmentType] = inserted.NotificationAmendmentType
			,[NotificationAmendmentTypeEffectiveFromDate] = inserted.NotificationAmendmentTypeEffectiveFromDate
		FROM [EAR_V4]
		INNER JOIN inserted ON inserted.[FileHeaderId] = EAR_V4.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


