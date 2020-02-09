CREATE TABLE [dbo].[CED_V1]
(
	[CED_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [CRAEncryptionDetails] VARCHAR(3) NOT NULL, 
    [CRAEncryptionKey] VARCHAR(30) NOT NULL, 
    [EffectiveFromDate] DATETIME2 NOT NULL
	CONSTRAINT CK_CED_V1Id_CRAEncryptionDetails_CorrectValue CHECK (CRAEncryptionDetails = 'CED'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'CED',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'CED_V1',
    @level2type = N'COLUMN',
    @level2name = 'CRAEncryptionDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0057',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'CED_V1',
    @level2type = N'COLUMN',
    @level2name = N'CRAEncryptionKey'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0081',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'CED_V1',
    @level2type = N'COLUMN',
    @level2name = N'EffectiveFromDate'