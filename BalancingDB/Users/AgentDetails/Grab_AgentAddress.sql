CREATE TABLE [dbo].[Grab_AgentAddress]
(
	[Grab_AgentAddressId] INT NOT NULL PRIMARY KEY IDENTITY (1,1),
	[AgentId] INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentIdentity(AgentId),
    [AddressLine1] VARCHAR(40) NULL, 
    [AddressLine2] VARCHAR(40) NULL, 
    [AddressLine3] VARCHAR(40) NULL, 
    [AddressLine4] VARCHAR(40) NULL, 
    [AddressLine5] VARCHAR(40) NULL, 
    [AddressLine6] VARCHAR(40) NULL, 
    [AddressLine7] VARCHAR(40) NULL, 
    [AddressLine8] VARCHAR(40) NULL, 
    [AddressLine9] VARCHAR(40) NULL, 
    [PostCode] VARCHAR(10) NULL,
	[EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL,
	[Default] BIT NOT NULL DEFAULT 0
)
