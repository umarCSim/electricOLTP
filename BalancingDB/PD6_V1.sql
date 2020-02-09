CREATE TABLE [dbo].[PD6_V1]
(
	[PD6_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [BSCPartyDetails] VARCHAR(3) NOT NULL, 
    [ActionCode] VARCHAR(9) NULL, 
    [BSCPartyName] VARCHAR(30) NOT NULL, 
    [BSCPartyId] VARCHAR(8) NOT NULL,
	CONSTRAINT CK_PD6_V1Id_BSCPartyDetails_CorrectValue CHECK (BSCPartyDetails = 'PD6'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'PD6',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PD6_V1',
    @level2type = N'COLUMN',
    @level2name = N'BSCPartyDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PD6_V1',
    @level2type = N'COLUMN',
    @level2name = N'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0046',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PD6_V1',
    @level2type = N'COLUMN',
    @level2name = N'BSCPartyName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0045',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'PD6_V1',
    @level2type = N'COLUMN',
    @level2name = N'BSCPartyId'