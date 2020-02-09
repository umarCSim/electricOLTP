CREATE VIEW [dbo].[BalancingPersonalDetails_CurrentUser_View]
AS
--We are using a CTE in place of variables as variables are not allowed in views
WITH Vars (Current_User_Id) --Columns
AS (
	SELECT USER_ID(CURRENT_USER) AS Current_User_Id
	)
SELECT DISTINCT A.[AgentId]
	--,A.[EffectiveFrom_AgentIdentity]
	--,A.[EffectiveTo_AgentIdentity]
	,A.[UserId]
	--,A.[EffectiveFrom_AgentUser]
	--,A.[EffectiveTo_AgentUser]
	,G_AgentName.[RoleType]
	,G_AgentName.[Salute]
	,G_AgentName.[FullName]
	,G_AgentName.[Firstname]
	,G_AgentName.[MiddleName]
	,G_AgentName.[Surname]
	--,G_AgentName.[EffectiveFrom_AgentName]
	--,G_AgentName.[EffectiveTo_AgentName]
	,G_AgentName.[Default_AgentName]
	,G_AgentAddr.[AddressLine1]
	,G_AgentAddr.[AddressLine2]
	,G_AgentAddr.[AddressLine3]
	,G_AgentAddr.[AddressLine4]
	,G_AgentAddr.[AddressLine5]
	,G_AgentAddr.[AddressLine6]
	,G_AgentAddr.[AddressLine7]
	,G_AgentAddr.[AddressLine8]
	,G_AgentAddr.[AddressLine9]
	,G_AgentAddr.[PostCode]
	--,G_AgentAddr.[EffectiveFrom_Address]
	--,G_AgentAddr.[EffectiveTo_Address]
	,G_AgentAddr.[Default_Address]
	,G_AgentEmail.[EmailAddress]
	--,G_AgentEmail.[EffectiveFrom_Email]
	--,G_AgentEmail.[EffectiveTo_Email]
	,G_AgentEmail.[Default_Email]
	,G_AgentTelephone.[LandlineTelephoneNumber]
	,G_AgentTelephone.[MobileTelephoneNumber]
	,G_AgentTelephone.[FaxNumber]
	--,G_AgentTelephone.[EffectiveFrom_Telephone]
	--,G_AgentTelephone.[EffectiveTo_Telephone]
	,G_AgentTelephone.[Default_Telephone]
FROM dbo.BalancingPersonelDetails_View A --Using self joins here so that we can condense results down to unique rows for the drop down
INNER JOIN Vars V ON V.Current_User_Id = A.[UserId]
INNER JOIN dbo.BalancingPersonelDetails_View G_AgentName ON G_AgentName.AgentId = A.AgentId
	AND G_AgentName.Default_AgentName = 1
INNER JOIN dbo.BalancingPersonelDetails_View G_AgentAddr ON G_AgentAddr.AgentId = A.AgentId
	AND G_AgentAddr.Default_Address = 1
INNER JOIN dbo.BalancingPersonelDetails_View G_AgentEmail ON G_AgentEmail.AgentId = A.AgentId
	AND G_AgentEmail.Default_Email = 1
INNER JOIN dbo.BalancingPersonelDetails_View G_AgentTelephone ON G_AgentTelephone.AgentId = A.AgentId
	AND G_AgentTelephone.Default_Telephone = 1
WHERE A.EffectiveTo_AgentIdentity IS NULL
	AND A.EffectiveTo_AgentUser IS NULL
	AND G_AgentName.[EffectiveTo_AgentName] IS NULL
	AND G_AgentAddr.[EffectiveTo_Address] IS NULL
	AND G_AgentEmail.[EffectiveTo_Email] IS NULL
	AND G_AgentTelephone.[EffectiveTo_Telephone] IS NULL
GO


