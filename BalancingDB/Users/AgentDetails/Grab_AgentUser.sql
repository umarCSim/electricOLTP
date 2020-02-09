CREATE TABLE [dbo].[Grab_AgentUser]
(
	[UserId] INT NOT NULL PRIMARY KEY, 
    [AgentId] INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentIdentity(AgentId),
	[EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL
)
