CREATE TRIGGER [CRA_R0071_Outgoing_View_Trigger_Insert] ON [dbo].[CRA_R0071_Outgoing_View]
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
	SELECT '0071'
		,@FK_HeaderId

	SET @FK_FlowKeyId = SCOPE_IDENTITY()

	INSERT INTO dbo.MSG_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[MessageDetails]
		,[ActionDescription]
		,[AuthorisedSignatory]
		,[Password]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[MessageDetails]
		,[ActionDescription]
		,[AuthorisedSignatory]
		,[Password]
	FROM inserted

	INSERT INTO dbo.BP2 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[PointDetails]
		,[PointId]
		,[PointType]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[PointDetails]
		,[PointId]
		,[PointType]
		,[EffectiveFromDate]
		,[EffectiveToDate]
	FROM inserted
END
GO

CREATE TRIGGER [CRA_R0071_Outgoing_View_Trigger_Update] ON [dbo].[CRA_R0071_Outgoing_View]
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

		UPDATE [dbo].[MSG_V1]
		SET [MessageDetails] = inserted.MessageDetails
			,[ActionDescription] = inserted.ActionDescription
			,[AuthorisedSignatory] = inserted.AuthorisedSignatory
			,[Password] = inserted.[Password]
		FROM [MSG_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = MSG_V1.FK_FileHeaderId

		UPDATE [dbo].[BP2]
		SET [PointDetails] = inserted.PointDetails
			,[PointId] = inserted.PointId
			,[PointType] = inserted.PointType
			,[EffectiveFromDate] = inserted.EffectiveFromDate
			,[EffectiveToDate] = inserted.EffectiveToDate
		FROM [BP2]
		INNER JOIN inserted ON inserted.[FileHeaderId] = BP2.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


