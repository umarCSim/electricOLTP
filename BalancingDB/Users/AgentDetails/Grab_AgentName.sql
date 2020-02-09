CREATE TABLE [dbo].[Grab_AgentName]
(
	[Grab_AgentNameId] INT NOT NULL PRIMARY KEY IDENTITY (1,1), 
	[AgentId] INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentIdentity(AgentId),
    [RoleType] VARCHAR(50) NULL,
	[Salute] VARCHAR (30) NULL, 
    [FullName] VARCHAR(30) NULL, 
    [Firstname] VARCHAR(30) NULL, 
    [MiddleName] VARCHAR(30) NULL, 
    [Surname] VARCHAR(30) NULL,
	[EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL,
	[Default] BIT NOT NULL DEFAULT 0
)
