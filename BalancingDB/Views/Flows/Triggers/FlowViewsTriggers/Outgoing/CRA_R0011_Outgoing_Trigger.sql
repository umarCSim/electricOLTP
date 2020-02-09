CREATE TRIGGER [CRA_R0011_Outgoing_View_Trigger_Insert] ON [dbo].[CRA_R0011_Outgoing_View]
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @FK_HeaderId INT
		,@FK_FlowKeyId INT
		,@FK_SPT_V1Id INT
		,@FK_SR2_V1Id INT
		,@FK_IE3_V1Id INT
		,@FK_RA2_V1Id INT
		,@FK_AULId INT
		,@FK_PRD_V1Id INT
		,@FK_AUSId INT
		,@Inserted_Id INT
	DECLARE @HeaderSequenceNumber NVARCHAR

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
	SELECT '0021'
		,@FK_HeaderId

	SET @FK_FlowKeyId = SCOPE_IDENTITY()

	INSERT INTO SPT_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[Stage2ParticipantDetails]
		,[Stage2ParticipantId]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([Stage2ParticipantDetails], 'SPT')
		,[Stage2ParticipantId]
	FROM inserted

	SET @FK_SPT_V1Id = SCOPE_IDENTITY()

	INSERT INTO SR2_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[SettlementReportDetails]
		,[ReportType]
		,[DistributionMethod]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([SettlementReportDetails], 'SR2')
		,[ReportType]
		,[DistributionMethod]
	FROM inserted

	SET @FK_SR2_V1Id = SCOPE_IDENTITY()

	INSERT INTO IE3_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[InterconnectorErrorAdministratorDetails]
		,[InterconnectorId]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([InterconnectorErrorAdministratorDetails], 'IE3')
		,[InterconnectorId]
		,[EffectiveFromDate_IE3]
		,[EffectiveToDate_IE3]
	FROM inserted

	SET @FK_IE3_V1Id = SCOPE_IDENTITY()

	INSERT INTO RA2_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[RoleAddressDetails]
		,[AddressLine1]
		,[AddressLine2]
		,[AddressLine3]
		,[AddressLine4]
		,[AddressLine5]
		,[AddressLine6]
		,[AddressLine7]
		,[AddressLine8]
		,[AddressLine9]
		,[PostCode]
		,[TelephoneNo]
		,[FaxNo]
		,[EmailAddress]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([RoleAddressDetails], 'RA2')
		,[AddressLine1]
		,[AddressLine2]
		,[AddressLine3]
		,[AddressLine4]
		,[AddressLine5]
		,[AddressLine6]
		,[AddressLine7]
		,[AddressLine8]
		,[AddressLine9]
		,[PostCode]
		,[TelephoneNo]
		,[FaxNo]
		,[EmailAddress_RA2]
	FROM inserted

	SET @FK_RA2_V1Id = SCOPE_IDENTITY()

	INSERT INTO AUL (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[AuthorisationLevels]
		,[Activity]
		,[EffectiveFromDate]
		,[EffectiveToDate]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([AuthorisationLevels], 'AUL')
		,[Activity_AUL]
		,[EffectiveFromDate_AUL]
		,[EffectiveToDate_AUL]
	FROM inserted

	SET @FK_AULId = SCOPE_IDENTITY()

	INSERT INTO PRD_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[PartyRoleDetails]
		,[PartyType]
		,[RegistrationEffectiveFromDate]
		,[RegistrationEffectiveToDate]
		--,RA2_V1Id
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([PartyRoleDetails], 'PRD')
		,[PartyType]
		,[RegistrationEffectiveFromDate]
		,[RegistrationEffectiveToDate]
		--,@FK_RA2_V1Id
	FROM inserted

	SET @FK_PRD_V1Id = SCOPE_IDENTITY()

	INSERT INTO AUS (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[AuthorisedSignatories]
		,[SignatoryName]
		,[Password]
		,[ContactPhoneNo]
		,[EmailAddress]
		--,AUL_V1Id
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([AuthorisedSignatories], 'AUS')
		,[SignatoryName]
		,[Password]
		,[ContactPhoneNo]
		,[EmailAddress_AUS]
		--,@FK_AULId
	FROM inserted

	SET @FK_AUSId = SCOPE_IDENTITY()

	INSERT INTO PD5_V1 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[BSCPartyDetails]
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationPassword]
		,[BSCPartyName]
		,[BSCPartyId]
		,[PartyAuthenticationKeyDetails]
		--,[PRD_V1Id]
		--,[SPT_V1Id]
		--,[AUS_V1Id]
		--,[SR2_V1Id]
		--,[IE3_V1Id]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([BSCPartyDetails], 'PD5')
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationPassword]
		,[BSCPartyName]
		,[BSCPartyId]
		,[PartyAuthenticationKeyDetails]
		--,@FK_PRD_V1Id
		--,@FK_SPT_V1Id
		--,@FK_AUSId
		--,@FK_SR2_V1Id
		--,@FK_IE3_V1Id
	FROM inserted
END
GO

CREATE TRIGGER [CRA_R0011_Outgoing_View_Trigger_Update] ON [dbo].[CRA_R0011_Outgoing_View]
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

		UPDATE [dbo].[PD5_V1]
		SET [BSCPartyDetails] = inserted.BSCPartyDetails
			,[ActionDescription] = inserted.ActionDescription
			,[PartyAuthenticationName] = inserted.PartyAuthenticationName
			,[PartyAuthenticationPassword] = inserted.PartyAuthenticationPassword
			,[BSCPartyName] = inserted.BSCPartyName
			,[BSCPartyId] = inserted.BSCPartyId
			,[PartyAuthenticationKeyDetails] = inserted.PartyAuthenticationKeyDetails
		FROM [PD5_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = PD5_V1.FK_FileHeaderId

		UPDATE [dbo].[PRD_V1]
		SET [PartyRoleDetails] = inserted.PartyRoleDetails
			,[PartyType] = inserted.PartyType
			,[RegistrationEffectiveFromDate] = inserted.RegistrationEffectiveFromDate
			,[RegistrationEffectiveToDate] = inserted.RegistrationEffectiveToDate
		FROM [PRD_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = PRD_V1.FK_FileHeaderId

		UPDATE [dbo].[RA2_V1]
		SET [RoleAddressDetails] = inserted.RoleAddressDetails
			,[AddressLine1] = inserted.AddressLine1
			,[AddressLine2] = inserted.AddressLine2
			,[AddressLine3] = inserted.AddressLine3
			,[AddressLine4] = inserted.AddressLine4
			,[AddressLine5] = inserted.AddressLine5
			,[AddressLine6] = inserted.AddressLine6
			,[AddressLine7] = inserted.AddressLine7
			,[AddressLine8] = inserted.AddressLine8
			,[AddressLine9] = inserted.AddressLine9
			,[PostCode] = inserted.PostCode
			,[TelephoneNo] = inserted.TelephoneNo
			,[FaxNo] = inserted.FaxNo
			,[EmailAddress] = inserted.EmailAddress_RA2
		FROM [RA2_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = RA2_V1.FK_FileHeaderId

		UPDATE [dbo].[SPT_V1]
		SET [Stage2ParticipantDetails] = inserted.Stage2ParticipantDetails
			,[Stage2ParticipantId] = inserted.Stage2ParticipantId
		FROM [SPT_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = SPT_V1.FK_FileHeaderId

		UPDATE [dbo].[AUS]
		SET [AuthorisedSignatories] = inserted.AuthorisedSignatories
			,[SignatoryName] = inserted.SignatoryName
			,[Password] = inserted.[Password]
			,[ContactPhoneNo] = inserted.ContactPhoneNo
			,[EmailAddress] = inserted.EmailAddress_AUS
		FROM [AUS]
		INNER JOIN inserted ON inserted.[FileHeaderId] = AUS.FK_FileHeaderId

		UPDATE [dbo].[AUL]
		SET [AuthorisationLevels] = inserted.AuthorisationLevels
			,[Activity] = inserted.Activity_AUL
			,[EffectiveFromDate] = inserted.EffectiveFromDate_AUL
			,[EffectiveToDate] = inserted.EffectiveToDate_AUL
		FROM [AUL]
		INNER JOIN inserted ON inserted.[FileHeaderId] = AUL.FK_FileHeaderId

		UPDATE [dbo].[SR2_V1]
		SET [SettlementReportDetails] = inserted.SettlementReportDetails
			,[ReportType] = inserted.ReportType
			,[DistributionMethod] = inserted.DistributionMethod
		FROM [SR2_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = SR2_V1.FK_FileHeaderId

		UPDATE [dbo].[IE3_V1]
		SET [InterconnectorErrorAdministratorDetails] = inserted.InterconnectorErrorAdministratorDetails
			,[InterconnectorId] = inserted.InterconnectorId
			,[EffectiveFromDate] = inserted.EffectiveFromDate_IE3
			,[EffectiveToDate] = inserted.EffectiveToDate_IE3
		FROM [IE3_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = IE3_V1.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


