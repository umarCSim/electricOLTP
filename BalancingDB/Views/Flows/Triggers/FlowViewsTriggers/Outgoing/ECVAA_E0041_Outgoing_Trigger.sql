CREATE TRIGGER [ECVAA_E0041_Outgoing_View_Trigger_Insert] ON [dbo].[ECVAA_E0041_Outgoing_View]
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @FK_HeaderId INT
		,@FK_FlowKeyId INT
		,@FK_OTD INT
		,@FK_CD9 INT
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

	INSERT INTO dbo.OTD_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[OmittedDataNoChange]
		,[NoChangetoExistingData]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[OmittedDataNoChange]
		,[NoChangetoExistingData]
	FROM inserted

	SET @FK_OTD = SCOPE_IDENTITY()

	INSERT INTO dbo.CD9 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[EnergyContractVolumes]
		,[SettlementPeriod]
		,[energycontractvolume]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[EnergyContractVolumes]
		,[SettlementPeriod]
		,[energycontractvolume]
	FROM inserted

	SET @FK_CD9 = SCOPE_IDENTITY()

	INSERT INTO dbo.EDN_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[ECVNs]
		,[ECVNAAId]
		,[ECVNAAKey]
		,[ECVNECVNAAId]
		,[ECVNReferenceCode]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		--,OTD_V1Id
		--,CD9_V2Id
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[ECVNs]
		,[ECVNAAId]
		,[ECVNAAKey]
		,[ECVNECVNAAId]
		,[ECVNReferenceCode]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		--,@FK_OTD
		--,@FK_CD9
	FROM inserted
END
GO

CREATE TRIGGER [ECVAA_E0041_Outgoing_View_Trigger_Update] ON [dbo].[ECVAA_E0041_Outgoing_View]
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

		UPDATE [dbo].[OTD_V1]
		SET [OmittedDataNoChange] = inserted.OmittedDataNoChange
			,[NoChangetoExistingData] = inserted.NoChangetoExistingData
		FROM [OTD_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = OTD_V1.FK_FileHeaderId

		UPDATE [dbo].[CD9]
		SET [EnergyContractVolumes] = inserted.EnergyContractVolumes
			,[SettlementPeriod] = inserted.SettlementPeriod
			,[energycontractvolume] = inserted.energycontractvolume
		FROM [CD9]
		INNER JOIN inserted ON inserted.[FileHeaderId] = CD9.FK_FileHeaderId

		UPDATE [dbo].[EDN_V1]
		SET [ECVNs] = inserted.ECVNs
			,[ECVNAAId] = inserted.ECVNAAId
			,[ECVNAAKey] = inserted.ECVNAAKey
			,[ECVNECVNAAId] = inserted.ECVNECVNAAId
			,[ECVNReferenceCode] = inserted.ECVNReferenceCode
			,[EffectiveFromDate] = inserted.EffectiveFromDate
			,[EffectiveToDate] = inserted.EffectiveToDate
		FROM [EDN_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = EDN_V1.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


