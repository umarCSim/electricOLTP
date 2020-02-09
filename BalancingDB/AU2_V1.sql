CREATE TABLE [dbo].[AU2]
(
	[AU2_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [AuthorisationLevels] VARCHAR(3) NOT NULL, 
    [ActionCode] VARCHAR(9) NULL, 
    [Activity] VARCHAR(2) NOT NULL, 
    [EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL,
    CONSTRAINT CK_AU2_V1Id_AuthorisationLevels_CorrectValue CHECK (AuthorisationLevels = 'AU2'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'AU2',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU2',
    @level2type = N'COLUMN',
    @level2name = 'AuthorisationLevels'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU2',
    @level2type = N'COLUMN',
    @level2name = 'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0006',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU2',
    @level2type = N'COLUMN',
    @level2name = N'Activity'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0081',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU2',
    @level2type = N'COLUMN',
    @level2name = 'EffectiveFromDate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0083',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU2',
    @level2type = N'COLUMN',
    @level2name = 'EffectiveToDate'