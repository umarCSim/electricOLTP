CREATE TRIGGER [CRA_R0061_Outgoing_View_Trigger_Insert] ON [dbo].[CRA_R0061_Outgoing_View]
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @FK_HeaderId INT
		,@FK_FlowKeyId INT
		,@FK_BU2 INT
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
	SELECT '0061'
		,@FK_HeaderId

	SET @FK_FlowKeyId = SCOPE_IDENTITY()

	INSERT INTO dbo.TR1_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[TradingUnitRegistrationHeader]
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationpassword]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[TradingUnitRegistrationHeader]
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationpassword]
	FROM inserted

	INSERT INTO dbo.BU2_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[BMUnitDetails]
		,[BMUnitId]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[BMUnitDetails]
		,[BMUnitId]
		,[EffectiveFromDate]
		,[EffectiveToDate]
	FROM inserted

	SET @FK_BU2 = SCOPE_IDENTITY()

	INSERT INTO dbo.TU1_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[TradingUnitDetails]
		,[TradingUnitName]
		--,BU2_V1Id
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[TradingUnitDetails]
		,[TradingUnitName]
		--,@FK_BU2
	FROM inserted
END
GO

CREATE TRIGGER [CRA_R0061_Outgoing_View_Trigger_Update] ON [dbo].[CRA_R0061_Outgoing_View]
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

		UPDATE [dbo].[TR1_V1]
		SET [TradingUnitRegistrationHeader] = inserted.TradingUnitRegistrationHeader
			,[ActionDescription] = inserted.ActionDescription
			,[PartyAuthenticationName] = inserted.PartyAuthenticationName
			,[PartyAuthenticationpassword] = inserted.PartyAuthenticationpassword
		FROM [TR1_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = TR1_V1.FK_FileHeaderId

		UPDATE [dbo].[BU2_V1]
		SET [BMUnitDetails] = inserted.BMUnitDetails
			,[BMUnitId] = inserted.BMUnitId
			,[EffectiveFromDate] = inserted.EffectiveFromDate
			,[EffectiveToDate] = inserted.EffectiveToDate
		FROM [BU2_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = BU2_V1.FK_FileHeaderId

		UPDATE [dbo].[TU1_V1]
		SET [TradingUnitDetails] = inserted.TradingUnitDetails
			,[TradingUnitName] = inserted.TradingUnitName
		FROM [TU1_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = TU1_V1.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


