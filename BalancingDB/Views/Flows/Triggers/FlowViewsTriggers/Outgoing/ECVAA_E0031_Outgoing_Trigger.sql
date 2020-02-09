CREATE TRIGGER [ECVAA_E0031_Outgoing_View_Trigger_Insert] ON [dbo].[ECVAA_E0031_Outgoing_View]
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

	INSERT INTO dbo.LSD_V3 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[LeadSubsidiaryPartyPairDetails]
		,[BMUnitId]
		,[LeadPartyId]
		,[LeadPartyName]
		,[LeadPartyProductionConsumptionFlag]
		,[SubsidiaryPartyId]
		,[SubsidiaryPartyName]
		,[SubsidiaryPartyProductionConsumptionFlag]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[LeadSubsidiaryPartyPairDetails]
		,[BMUnitId]
		,[LeadPartyId]
		,[LeadPartyName]
		,[LeadPartyProductionConsumptionFlag]
		,[SubsidiaryPartyId]
		,[SubsidiaryPartyName]
		,[SubsidiaryPartyProductionConsumptionFlag]
	FROM inserted

	INSERT INTO dbo.MAR_V3 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[MeterVolumeReallocations]
		,[MVRNAId]
		,[MVRNAName]
		,[MVRNAId2]
		,[MVRNAName2]
		,[MVRNAAId]
		,[AssociatedVNNRIndicator]
		,[ReportRequirement]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,[MeterVolumeReallocations]
		,[MVRNAId]
		,[MVRNAName]
		,[MVRNAId2]
		,[MVRNAName2]
		,[MVRNAAId]
		,[AssociatedVNNRIndicator]
		,[ReportRequirement]
		,[EffectiveFromDate]
		,[EffectiveToDate]
	FROM inserted
END
GO

CREATE TRIGGER [ECVAA_E0031_Outgoing_View_Trigger_Update] ON [dbo].[ECVAA_E0031_Outgoing_View]
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

		UPDATE [dbo].[LSD_V3]
		SET [LeadSubsidiaryPartyPairDetails] = inserted.LeadSubsidiaryPartyPairDetails
			,[BMUnitId] = inserted.BMUnitId
			,[LeadPartyId] = inserted.LeadPartyId
			,[LeadPartyName] = inserted.LeadPartyName
			,[LeadPartyProductionConsumptionFlag] = inserted.LeadPartyProductionConsumptionFlag
			,[SubsidiaryPartyId] = inserted.SubsidiaryPartyId
			,[SubsidiaryPartyName] = inserted.SubsidiaryPartyName
			,[SubsidiaryPartyProductionConsumptionFlag] = inserted.SubsidiaryPartyProductionConsumptionFlag
		FROM [LSD_V3]
		INNER JOIN inserted ON inserted.[FileHeaderId] = LSD_V3.FK_FileHeaderId

		UPDATE [dbo].[MAR_V3]
		SET [MeterVolumeReallocations] = inserted.MeterVolumeReallocations
			,[MVRNAId] = inserted.MVRNAAId
			,[MVRNAName] = inserted.MVRNAName
			,[MVRNAId2] = inserted.MVRNAId2
			,[MVRNAName2] = inserted.MVRNAName2
			,[MVRNAAId] = inserted.MVRNAAId
			,[AssociatedVNNRIndicator] = inserted.AssociatedVNNRIndicator
			,[ReportRequirement] = inserted.ReportRequirement
			,[EffectiveFromDate] = inserted.EffectiveFromDate
			,[EffectiveToDate] = inserted.EffectiveToDate
		FROM [MAR_V3]
		INNER JOIN inserted ON inserted.[FileHeaderId] = MAR_V3.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


