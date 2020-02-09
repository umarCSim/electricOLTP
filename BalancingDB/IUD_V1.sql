CREATE TABLE [dbo].[IUD_V1]
(
	[IUD_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [InterconnectorErrorAdministrationDetails] VARCHAR(3) NOT NULL, 
    [ActionCode] VARCHAR(9) NULL, 
    [InterconnectorId] VARCHAR(10) NOT NULL, 
    [EffectiveFromDate] DATETIME2 NOT NULL, 
    [EffectiveToDate] DATETIME2 NULL,
	CONSTRAINT CK_IUD_V1Id_InterconnectorErrorAdministrationDetails_CorrectValue CHECK (InterconnectorErrorAdministrationDetails = 'IUD'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'IUD',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'IUD_V1',
    @level2type = N'COLUMN',
    @level2name = N'InterconnectorErrorAdministrationDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'IUD_V1',
    @level2type = N'COLUMN',
    @level2name = N'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0098',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'IUD_V1',
    @level2type = N'COLUMN',
    @level2name = N'InterconnectorId'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0081',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'IUD_V1',
    @level2type = N'COLUMN',
    @level2name = N'EffectiveFromDate'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0083',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'IUD_V1',
    @level2type = N'COLUMN',
    @level2name = N'EffectiveToDate'