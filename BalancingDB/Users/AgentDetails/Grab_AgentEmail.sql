CREATE TABLE [dbo].[Grab_AgentEmail]
(
	[Grab_AgentEmailId] INT NOT NULL PRIMARY KEY IDENTITY,  
    [AgentId] INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentIdentity(AgentId), 
    [EmailAddress] VARCHAR(80) NULL,
	[EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL,
	[Default] BIT NOT NULL DEFAULT 0
)
