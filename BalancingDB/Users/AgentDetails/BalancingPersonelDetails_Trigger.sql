CREATE TRIGGER [BalancingPersonelDetails_Trigger_Insert] ON BalancingPersonelDetails_View
INSTEAD OF INSERT
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @FK_AgentId INT
		--UserId is not an identity
		,@FK_AgentName INT
		,@FK_Address INT
		,@FK_Email INT
		,@FK_Telephone INT

	--Only insert an AgentId if creating a new agent, otherwise, grab the AgentId and use it for other table inserts
	IF (
			EXISTS (
				SELECT [Grab_AgentIdentity].AgentId
				FROM [Grab_AgentIdentity]
				INNER JOIN inserted ON inserted.AgentId = [Grab_AgentIdentity].AgentId
				)
			)
		SET @FK_AgentId = (
				SELECT AgentId
				FROM inserted
				)
	ELSE
	BEGIN
		INSERT INTO [Grab_AgentIdentity] (
			EffectiveFromDate
			,EffectiveToDate
			)
		SELECT EffectiveFrom_AgentIdentity
			,EffectiveTo_AgentIdentity
		FROM inserted

		SET @FK_AgentId = SCOPE_IDENTITY()
	END

	--There must be a Userid available. Use 'SELECT * FROM sysusers' to see a list of database users
	--Don't do anything if there the UserId doesn't exist
	IF (
			NOT EXISTS (
				SELECT [Grab_AgentUser].[UserId]
				FROM [Grab_AgentUser]
				INNER JOIN inserted ON inserted.[UserId] = [Grab_AgentUser].[UserId]
				)
			)
	BEGIN
		INSERT INTO [Grab_AgentUser] (
			[AgentId]
			,[UserId]
			,EffectiveFromDate
			,EffectiveToDate
			)
		SELECT @FK_AgentId
			,[UserId]
			,EffectiveFrom_AgentIdentity
			,EffectiveTo_AgentIdentity
		FROM inserted
	END

	--Straight inserts
	INSERT INTO [Grab_AgentName] (
		[AgentId]
		,[RoleType]
		,[Salute]
		,[FullName]
		,[Firstname]
		,[MiddleName]
		,[Surname]
		,Grab_AgentName.EffectiveFromDate
		,Grab_AgentName.EffectiveToDate
		,Grab_AgentName.[Default]
		)
	SELECT @FK_AgentId
		,[RoleType]
		,[Salute]
		,[FullName]
		,[Firstname]
		,[MiddleName]
		,[Surname]
		,[EffectiveFrom_AgentName]
		,[EffectiveTo_AgentName]
		,[Default_AgentName]
	FROM inserted

	SET @FK_AgentName = SCOPE_IDENTITY()

	INSERT INTO [Grab_AgentAddress] (
		[AgentId]
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
		,[Grab_AgentAddress].EffectiveFromDate
		,[Grab_AgentAddress].EffectiveToDate
		,[Grab_AgentAddress].[Default]
		)
	SELECT @FK_AgentId
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
		,[EffectiveFrom_Address]
		,[EffectiveTo_Address]
		,[Default_Address]
	FROM inserted

	SET @FK_Address = SCOPE_IDENTITY()

	INSERT INTO [Grab_AgentEmail] (
		AgentId
		,[EmailAddress]
		,[Grab_AgentEmail].EffectiveFromDate
		,[Grab_AgentEmail].EffectiveToDate
		,[Grab_AgentEmail].[Default]
		)
	SELECT @FK_AgentId
		,[EmailAddress]
		,[EffectiveFrom_Email]
		,[EffectiveTo_Email]
		,[Default_Email]
	FROM inserted

	SET @FK_Email = SCOPE_IDENTITY()

	INSERT INTO [Grab_AgentTelephone] (
		AgentId
		,[LandlineTelephoneNumber]
		,[MobileTelephoneNumber]
		,[FaxNumber]
		,[Grab_AgentTelephone].EffectiveFromDate
		,[Grab_AgentTelephone].EffectiveToDate
		,[Grab_AgentTelephone].[Default]
		)
	SELECT @FK_AgentId
		,[LandlineTelephoneNumber]
		,[MobileTelephoneNumber]
		,[FaxNumber]
		,[EffectiveFrom_Telephone]
		,[EffectiveTo_Telephone]
		,[Default_Telephone]
	FROM inserted

	SET @FK_Telephone = SCOPE_IDENTITY()

	--Insert references
	INSERT INTO [Grab_AgentKeys] (
		AgentId
		,UserId
		,Grab_AgentNameId
		,Grab_AgentAddressId
		,Grab_AgentEmailId
		,Grab_TelephoneId
		)
	SELECT @FK_AgentId
		,[UserId]
		,@FK_AgentName
		,@FK_Address
		,@FK_Email
		,@FK_Telephone
	FROM inserted
END
GO

CREATE TRIGGER [BalancingPersonelDetails_Trigger_Update] ON BalancingPersonelDetails_View
INSTEAD OF UPDATE
AS
BEGIN
	SET NOCOUNT ON

	UPDATE Grab_AgentIdentity
	SET Grab_AgentIdentity.EffectiveToDate = inserted.EffectiveTo_AgentIdentity
	FROM inserted

	UPDATE Grab_AgentUser
	SET Grab_AgentUser.EffectiveToDate = inserted.EffectiveTo_AgentUser
	FROM inserted

	UPDATE Grab_AgentName
	SET Grab_AgentName.[Default] = inserted.Default_AgentName
		,Grab_AgentName.EffectiveToDate = inserted.EffectiveTo_AgentName
	FROM inserted
	INNER JOIN [Grab_AgentKeys] ON [Grab_AgentKeys].[Grab_AgentKeyId] = inserted.[Grab_AgentKeyId]
	INNER JOIN Grab_AgentName ON Grab_AgentName.Grab_AgentNameId = [Grab_AgentKeys].Grab_AgentNameId

	UPDATE [Grab_AgentAddress]
	SET [Grab_AgentAddress].[Default] = inserted.Default_Address
		,[Grab_AgentAddress].EffectiveToDate = inserted.EffectiveTo_Address
	FROM inserted
	INNER JOIN [Grab_AgentKeys] ON [Grab_AgentKeys].[Grab_AgentKeyId] = inserted.[Grab_AgentKeyId]
	INNER JOIN [Grab_AgentAddress] ON [Grab_AgentAddress].[Grab_AgentAddressId] = [Grab_AgentKeys].Grab_AgentAddressId

	UPDATE [Grab_AgentEmail]
	SET [Grab_AgentEmail].[Default] = inserted.Default_Email
		,[Grab_AgentEmail].EffectiveToDate = inserted.EffectiveTo_Email
	FROM inserted
	INNER JOIN [Grab_AgentKeys] ON [Grab_AgentKeys].[Grab_AgentKeyId] = inserted.[Grab_AgentKeyId]
	INNER JOIN [Grab_AgentEmail] ON [Grab_AgentEmail].[Grab_AgentEmailId] = [Grab_AgentKeys].Grab_AgentEmailId

	UPDATE [Grab_AgentTelephone]
	SET [Grab_AgentTelephone].[Default] = inserted.Default_Telephone
		,[Grab_AgentTelephone].EffectiveToDate = inserted.EffectiveTo_Telephone
	FROM inserted
	INNER JOIN [Grab_AgentKeys] ON [Grab_AgentKeys].[Grab_AgentKeyId] = inserted.[Grab_AgentKeyId]
	INNER JOIN [Grab_AgentTelephone] ON [Grab_AgentTelephone].[Grab_AgentTelephoneId] = [Grab_AgentKeys].Grab_TelephoneId
END
