CREATE TABLE [dbo].[Grab_AgentKeys]
(
	[Grab_AgentKeyId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	AgentId INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentIdentity (AgentId),
	UserId INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentUser ([UserId]),
	Grab_AgentNameId INT NOT NULL FOREIGN KEY REFERENCES Grab_AgentName (Grab_AgentNameId),
	Grab_AgentAddressId INT NOT NULL FOREIGN KEY REFERENCES [Grab_AgentAddress] ([Grab_AgentAddressId]),
	Grab_AgentEmailId INT NOT NULL FOREIGN KEY REFERENCES [Grab_AgentEmail] ([Grab_AgentEmailId]),
	Grab_TelephoneId INT NOT NULL FOREIGN KEY REFERENCES [Grab_AgentTelephone] ([Grab_AgentTelephoneId])
)
