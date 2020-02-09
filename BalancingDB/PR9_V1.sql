CREATE TABLE [dbo].[PR9_V1]
(
	[PR9_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [PartyRoleDetails] VARCHAR(3) NOT NULL, 
    [ActionCode] VARCHAR(9) NULL, 
    [PartyType] VARCHAR(2) NOT NULL, 
    [RegistrationStatus] CHAR(10) NOT NULL, 
    [RegistrationEffectiveFromDate] DATETIME2 NOT NULL, 
    [RegistrationEffectiveToDate] DATETIME2 NULL, 
	CONSTRAINT CK_PR9_V1Id_PartyRoleDetails_CorrectValue CHECK (PartyRoleDetails = 'PR9'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'PR9',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PR9_V1',
    @level2type = N'COLUMN',
    @level2name = N'PartyRoleDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PR9_V1',
    @level2type = N'COLUMN',
    @level2name = N'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0161',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PR9_V1',
    @level2type = N'COLUMN',
    @level2name = N'PartyType'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0185',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PR9_V1',
    @level2type = N'COLUMN',
    @level2name = N'RegistrationStatus'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0183',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PR9_V1',
    @level2type = N'COLUMN',
    @level2name = N'RegistrationEffectiveFromDate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0184',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PR9_V1',
    @level2type = N'COLUMN',
    @level2name = N'RegistrationEffectiveToDate'