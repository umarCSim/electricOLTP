CREATE TABLE [dbo].[Grab_AgentIdentity]
(
	[AgentId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL
)
