CREATE TRIGGER [CRA_R0031_Outgoing_View_Trigger_Insert] ON [dbo].[CRA_R0031_Outgoing_View]
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @FK_HeaderId INT
		,@FK_FlowKeyId INT
		,@FK_RA3_V1Id INT
		,@FK_ACDId INT
		,@FK_AULId INT
		,@FK_AUSId INT
		,@FK_ARDId INT
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
		,AgentId
		)
	SELECT '0031'
		,@FK_HeaderId
		,AgentId
	FROM inserted

	SET @FK_FlowKeyId = SCOPE_IDENTITY()

	INSERT INTO RA3_V1 (
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
		,ISNULL([RoleAddressDetails], 'RA3')
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
		,[EmailAddress_RA3]
	FROM inserted

	SET @FK_RA3_V1Id = SCOPE_IDENTITY()

	INSERT INTO ACD (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[CertificationAccreditationDetails]
		,[CertificationAccreditationStatus]
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([CertificationAccreditationDetails], 'ACD')
		,[CertificationAccreditationStatus]
	FROM inserted

	SET @FK_ACDId = SCOPE_IDENTITY()

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
		,[Activity]
		,[EffectiveFromDate]
		,[EffectiveToDate]
	FROM inserted

	SET @FK_AULId = SCOPE_IDENTITY()

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

	INSERT INTO ARD (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[AgentRoleDetails]
		,[AgentType]
		,[RegistrationEffectiveFromDate]
		,[RegistrationEffectiveToDate]
		--,RA3_V3Id
		--,ACD_V1Id
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([AgentRoleDetails], 'ARD')
		,[AgentType]
		,[RegistrationEffectiveFromDate]
		,[RegistrationEffectiveToDate]
		--,@FK_RA3_V1Id
		--,@FK_ACDId
	FROM inserted

	SET @FK_ARDId = SCOPE_IDENTITY()

	INSERT INTO BA2 (
		FK_FileHeaderId
		,FK_FlowKeyId
		,[BSCPartyAgentDetails]
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationPassword]
		,[AgentName]
		--,ARD_V1Id
		--,AUS_V1Id
		)
	SELECT @FK_HeaderId
		,@FK_FlowKeyId
		,ISNULL([BSCPartyAgentDetails], 'BA2')
		,[ActionDescription]
		,[PartyAuthenticationName]
		,[PartyAuthenticationPassword]
		,[AgentName]
		--,@FK_ARDId
		--,@FK_AUSId
	FROM inserted
END
GO

CREATE TRIGGER [CRA_R0031_Outgoing_View_Trigger_Update] ON [dbo].[CRA_R0031_Outgoing_View]
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

		UPDATE [dbo].[RA3_V1]
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
			,[EmailAddress] = inserted.EmailAddress_RA3
		FROM [RA3_V1]
		INNER JOIN inserted ON inserted.[FileHeaderId] = RA3_V1.FK_FileHeaderId

		UPDATE [dbo].[ACD]
		SET [CertificationAccreditationDetails] = inserted.CertificationAccreditationDetails
			,[CertificationAccreditationStatus] = inserted.CertificationAccreditationStatus
		FROM [ACD]
		INNER JOIN inserted ON inserted.[FileHeaderId] = ACD.FK_FileHeaderId

		UPDATE [dbo].[AUL]
		SET [AuthorisationLevels] = inserted.AuthorisationLevels
			,[Activity] = inserted.Activity
			,[EffectiveFromDate] = inserted.EffectiveFromDate
			,[EffectiveToDate] = inserted.EffectiveToDate
		FROM [AUL]
		INNER JOIN inserted ON inserted.[FileHeaderId] = AUL.FK_FileHeaderId

		UPDATE [dbo].[AUS]
		SET [AuthorisedSignatories] = inserted.AuthorisedSignatories
			,[SignatoryName] = inserted.SignatoryName
			,[Password] = inserted.[Password]
			,[ContactPhoneNo] = inserted.ContactPhoneNo
			,[EmailAddress] = inserted.EmailAddress_AUS
		FROM [AUS]
		INNER JOIN inserted ON inserted.[FileHeaderId] = AUS.FK_FileHeaderId

		UPDATE [dbo].[ARD]
		SET [AgentRoleDetails] = inserted.AgentRoleDetails
			,[AgentType] = inserted.AgentType
			,[RegistrationEffectiveFromDate] = inserted.RegistrationEffectiveFromDate
			,[RegistrationEffectiveToDate] = inserted.RegistrationEffectiveToDate
		FROM [ARD]
		INNER JOIN inserted ON inserted.[FileHeaderId] = ARD.FK_FileHeaderId

		UPDATE [dbo].[BA2]
		SET [BSCPartyAgentDetails] = inserted.BSCPartyAgentDetails
			,[ActionDescription] = inserted.ActionDescription
			,[PartyAuthenticationName] = inserted.PartyAuthenticationName
			,[PartyAuthenticationPassword] = inserted.PartyAuthenticationPassword
			,[AgentName] = inserted.AgentName
		FROM [BA2]
		INNER JOIN inserted ON inserted.[FileHeaderId] = BA2.FK_FileHeaderId
	END
	ELSE
		THROW 51000
			,'File has already been sent'
			,1
END
GO


