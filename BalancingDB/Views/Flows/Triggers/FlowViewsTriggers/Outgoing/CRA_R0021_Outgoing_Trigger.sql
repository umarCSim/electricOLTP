CREATE TRIGGER [CRA_R0021_Outgoing_View_Trigger_Insert] ON [dbo].[CRA_R0021_Outgoing_View]
INSTEAD OF INSERT
AS
BEGIN
SET NOCOUNT ON
	DECLARE @FK_HeaderId INT
		,@FK_FlowKeyId INT
		,@FK_IE2_V2Id INT
		,@FK_EIC_V1Id INT
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
		, ISNULL([TestDataFlag], 'NONE')
	FROM inserted
	SET @FK_HeaderId = SCOPE_IDENTITY()


	INSERT INTO dbo.FlowKeys (FlowId, FK_FileHeaderId)
	SELECT '0011', @FK_HeaderId
	SET @FK_FlowKeyId = SCOPE_IDENTITY()

	INSERT INTO [dbo].[IE2_V1] (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[InterconnectorErrorAdministratorData]
		,[InterconnectorErrorAdministratorId]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([InterconnectorErrorAdministratorData], 'IE2')
		,[InterconnectorErrorAdministratorId]
		,[EffectiveFromDate]
		,[EffectiveToDate]
	FROM inserted
	SET @FK_IE2_V2Id = SCOPE_IDENTITY()

		INSERT INTO [dbo].[EIC_V1] (
		[FK_FileHeaderId]
		,[FK_FlowKeyId]
		,[InterconnectorDetails]
		,[InterconnectorId]
		--,[IE2_V2Id]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([InterconnectorDetails], 'EIC')
		,[InterconnectorId]
		--,@FK_IE2_V2Id
	FROM inserted
	SET @FK_EIC_V1Id = SCOPE_IDENTITY()

		INSERT INTO [dbo].[IA2_V1] (
		[FK_FileHeaderId]
		,[FK_FlowKeyId]
		,[InterconnectorAdministratoDetails]
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationPassword]
		,[InterconnectorAdministratorId]
		--,[EIC_V1Id]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([InterconnectorAdministratoDetails], 'IA2')
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationPassword]
		,[InterconnectorAdministratorId]
		--,@FK_EIC_V1Id
	FROM inserted
END
GO

CREATE TRIGGER [CRA_R0021_Outgoing_View_Trigger_Update] ON [dbo].[CRA_R0021_Outgoing_View]
INSTEAD OF UPDATE
AS
BEGIN
SET NOCOUNT ON
		IF(
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

		UPDATE [dbo].[IE2_V1]
		SET [IE2_V1].[InterconnectorErrorAdministratorData] = inserted.InterconnectorErrorAdministratorData
			,[IE2_V1].[InterconnectorErrorAdministratorId] = inserted.InterconnectorErrorAdministratorId
			,[IE2_V1].[EffectiveFromDate] = inserted.EffectiveFromDate
			,[IE2_V1].[EffectiveToDate] = inserted.EffectiveToDate
		FROM [IE2_V1]
		INNER JOIN inserted ON inserted.[FlowKeyId] = IE2_V1.FK_FlowKeyId

		UPDATE [dbo].[EIC_V1]
		SET [EIC_V1].[InterconnectorDetails] = inserted.InterconnectorDetails
			,[EIC_V1].[InterconnectorId] = inserted.InterconnectorId
		FROM [EIC_V1]
		INNER JOIN inserted ON inserted.[FlowKeyId] = EIC_V1.FK_FlowKeyId

		UPDATE [dbo].[IA2_V1]
		SET [IA2_V1].[InterconnectorAdministratoDetails] = inserted.InterconnectorAdministratoDetails
			,[IA2_V1].[ActionDescription] = inserted.[ActionDescription]
			,[IA2_V1].[PartyAuthenticationName] = inserted.[PartyAuthenticationName]
			,[IA2_V1].[PartyAuthenticationPassword] = inserted.[PartyAuthenticationPassword]
			,[IA2_V1].[InterconnectorAdministratorId] = inserted.[InterconnectorAdministratorId]
		FROM [IA2_V1]
		INNER JOIN inserted ON inserted.[FlowKeyId] = IA2_V1.FK_FlowKeyId
		END
		ELSE
		THROW 51000, 'File has already been sent', 1	
END
GO
