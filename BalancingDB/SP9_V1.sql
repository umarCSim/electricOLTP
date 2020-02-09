CREATE TABLE [dbo].[SP9_V1]
(
	[SP9_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [Stage2ParticipantDetails] VARCHAR(3) NOT NULL, 
    [ActionCode] VARCHAR(9) NULL, 
    [Stage2ParticipantId] VARCHAR(4) NOT NULL,
	CONSTRAINT CK_SP9_V1Id_Stage2ParticipantDetails_CorrectValue CHECK (Stage2ParticipantDetails = 'SP9'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SP9',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'SP9_V1',
    @level2type = N'COLUMN',
    @level2name = 'Stage2ParticipantDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'SP9_V1',
    @level2type = N'COLUMN',
    @level2name = 'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0207',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'SP9_V1',
    @level2type = N'COLUMN',
    @level2name = 'Stage2ParticipantId'