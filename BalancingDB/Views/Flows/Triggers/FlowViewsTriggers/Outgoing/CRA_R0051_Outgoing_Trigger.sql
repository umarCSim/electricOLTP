CREATE TRIGGER [CRA_R0051_Outgoing_View_Trigger_Insert] ON [dbo].[CRA_R0051_Outgoing_View]
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @FK_HeaderId INT
		,@FK_FlowKeyId INT
		,@FK_JBB INT
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
	SELECT '0051'
		,@FK_HeaderId

	SET @FK_FlowKeyId = SCOPE_IDENTITY()

	INSERT INTO JBB_V2 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[BMUnitGroupMember]
		,[BMUnitId]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([BMUnitGroupMember], 'BA2')
		,[BMUnitId_JBB]
	FROM inserted

	SET @FK_JBB = SCOPE_IDENTITY()

	INSERT INTO BR2_V2 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[BMUnitRegistrationHeader]
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationpassword]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([BMUnitRegistrationHeader], 'BR2')
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationpassword]
	FROM inserted

	INSERT INTO BU1_V2 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[BMUnitDetails]
		,[BMUnitName]
		,[BU1_V2].[BMUnitId]
		,[BMUnitType]
		,[NGCBMUnitName]
		,[Zone]
		,[NationalGridReference]
		,[GSPGroupId]
		,[GenerationCapacity]
		,[DemandCapacity]
		,[ProductionConsumptionFlag]
		,[BaseTUFlag]
		,[FPNFlag]
		,[InterconnectorId]
		,[BU1_V2].[EffectiveFromDate]
		,[BU1_V2].[EffectiveToDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([BMUnitDetails], 'BU1')
		,[BMUnitName]
		,[BMUnitId_BU1]
		,[BMUnitType]
		,[NGCBMUnitName]
		,[Zone]
		,[NationalGridReference]
		,[GSPGroupId]
		,[GenerationCapacity]
		,[DemandCapacity]
		,[ProductionConsumptionFlag]
		,[BaseTUFlag]
		,[FPNFlag]
		,[InterconnectorId]
		,[EffectiveFromDate_BU1]
		,[EffectiveToDate_BU1]
	FROM inserted

	INSERT INTO JB1_V2 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[BMUnitGroupDetails]
		,[JointBMUnitId]
		,[JB1_V2].[EffectiveFromDate]
		,[JB1_V2].[EffectiveToDate]
		--,JBB_V1Id
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([BMUnitGroupDetails], 'JB1')
		,[JointBMUnitId]
		,[EffectiveFromDate_JB1]
		,[EffectiveToDate_JB1]
		--,@FK_JBB
	FROM inserted
END
GO

CREATE TRIGGER [CRA_R0051_Outgoing_View_Trigger_Update] ON [dbo].[CRA_R0051_Outgoing_View]
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

		UPDATE [dbo].[JBB_V2]
		SET [JBB_V2].[BMUnitGroupMember] = inserted.BMUnitGroupMember
			,[JBB_V2].[BMUnitId] = inserted.BMUnitId_JBB
		FROM [JBB_V2]
		INNER JOIN inserted ON inserted.[FileHeaderId] = JBB_V2.FK_FileHeaderId

		UPDATE [dbo].[BU1_V2]
		SET [BMUnitDetails] = inserted.BMUnitDetails
			,[BMUnitName] = inserted.BMUnitName
			,[BU1_V2].[BMUnitId] = inserted.BMUnitId_BU1
			,[BMUnitType] = inserted.BMUnitType
			,[NGCBMUnitName] = inserted.NGCBMUnitName
			,[Zone] = inserted.[Zone]
			,[NationalGridReference] = inserted.NationalGridReference
			,[GSPGroupId] = inserted.GSPGroupId
			,[GenerationCapacity] = inserted.GenerationCapacity
			,[DemandCapacity] = inserted.DemandCapacity
			,[ProductionConsumptionFlag] = inserted.ProductionConsumptionFlag
			,[BaseTUFlag] = inserted.BaseTUFlag
			,[FPNFlag] = inserted.FPNFlag
			,[InterconnectorId] = inserted.InterconnectorId
			,[BU1_V2].[EffectiveFromDate] = inserted.EffectiveFromDate_BU1
			,[BU1_V2].[EffectiveToDate] = inserted.EffectiveToDate_BU1
		FROM [BU1_V2]
		INNER JOIN inserted ON inserted.[FileHeaderId] = BU1_V2.FK_FileHeaderId

		UPDATE [dbo].[BR2_V2]
		SET [BMUnitRegistrationHeader] = inserted.BMUnitRegistrationHeader
			,[ActionDescription] = inserted.ActionDescription
			,[PartyAuthenticationName] = inserted.PartyAuthenticationName
			,[PartyAuthenticationpassword] = inserted.PartyAuthenticationpassword
		FROM [BR2_V2]
		INNER JOIN inserted ON inserted.[FileHeaderId] = BR2_V2.FK_FileHeaderId

		UPDATE [dbo].[JB1_V2]
		SET [BMUnitGroupDetails] = inserted.BMUnitGroupDetails
			,[JointBMUnitId] = inserted.JointBMUnitId
			,[JB1_V2].[EffectiveFromDate] = inserted.EffectiveFromDate_JB1
			,[JB1_V2].[EffectiveToDate] = inserted.EffectiveToDate_JB1
		FROM [JB1_V2]
		INNER JOIN inserted ON inserted.[FileHeaderId] = JB1_V2.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


