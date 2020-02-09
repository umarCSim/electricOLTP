CREATE TABLE [dbo].[Grab_AgentTelephone]
(
	[Grab_AgentTelephoneId] INT NOT NULL PRIMARY KEY IDENTITY (1,1), 
    [AgentId] INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentIdentity(AgentId),
	[LandlineTelephoneNumber] VARCHAR(15) NULL, 	
    [MobileTelephoneNumber] VARCHAR(15) NULL,
    [FaxNumber] VARCHAR(15) NULL, 
    [EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL, 
    [Default] BIT NOT NULL DEFAULT 0
)
