CREATE VIEW [dbo].[BalancingPersonelDetails_View]
AS
SELECT [Grab_AgentKeyId]
	--AgentIdentity
	,Grab_AgentIdentity.[AgentId]
	,Grab_AgentIdentity.EffectiveFromDate AS [EffectiveFrom_AgentIdentity]
	,Grab_AgentIdentity.EffectiveToDate AS [EffectiveTo_AgentIdentity]
	--AgentUser
	,Grab_AgentUser.[UserId]
	,Grab_AgentUser.EffectiveFromDate AS [EffectiveFrom_AgentUser]
	,Grab_AgentUser.EffectiveToDate AS [EffectiveTo_AgentUser]
	--GrabAgentName
	,[RoleType]
	,[Salute]
	,[FullName]
	,[Firstname]
	,[MiddleName]
	,[Surname]
	,Grab_AgentName.EffectiveFromDate AS [EffectiveFrom_AgentName]
	,Grab_AgentName.EffectiveToDate AS [EffectiveTo_AgentName]
	,Grab_AgentName.[Default] AS [Default_AgentName]
	--GrabAddress
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
	,[Grab_AgentAddress].EffectiveFromDate AS [EffectiveFrom_Address]
	,[Grab_AgentAddress].EffectiveToDate AS [EffectiveTo_Address]
	,[Grab_AgentAddress].[Default] AS [Default_Address]
	--Emails
	,[EmailAddress]
	,[Grab_AgentEmail].EffectiveFromDate AS [EffectiveFrom_Email]
	,[Grab_AgentEmail].EffectiveToDate AS [EffectiveTo_Email]
	,[Grab_AgentEmail].[Default] AS [Default_Email]
	--Telephone
	,[LandlineTelephoneNumber]
	,[MobileTelephoneNumber]
	,[FaxNumber]
	,[Grab_AgentTelephone].EffectiveFromDate AS [EffectiveFrom_Telephone]
	,[Grab_AgentTelephone].EffectiveToDate AS [EffectiveTo_Telephone]
	,[Grab_AgentTelephone].[Default] AS [Default_Telephone]
FROM [Grab_AgentKeys]
INNER JOIN Grab_AgentIdentity ON Grab_AgentIdentity.AgentId = [Grab_AgentKeys].AgentId
INNER JOIN Grab_AgentUser ON Grab_AgentUser.[UserId] = [Grab_AgentKeys].UserId
INNER JOIN Grab_AgentName ON Grab_AgentName.Grab_AgentNameId = [Grab_AgentKeys].Grab_AgentNameId
INNER JOIN [Grab_AgentAddress] ON [Grab_AgentAddress].[Grab_AgentAddressId] = [Grab_AgentKeys].Grab_AgentAddressId
INNER JOIN [Grab_AgentEmail] ON [Grab_AgentEmail].[Grab_AgentEmailId] = [Grab_AgentKeys].Grab_AgentEmailId
INNER JOIN [Grab_AgentTelephone] ON [Grab_AgentTelephone].[Grab_AgentTelephoneId] = [Grab_AgentKeys].Grab_TelephoneId
