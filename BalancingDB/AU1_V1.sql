CREATE TABLE [dbo].[AU1]
(
	[AU1_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [AuthorisedSignatories] VARCHAR(3) NOT NULL, 
    [ActionCode] VARCHAR(9) NULL, 
    [SignatoryName] VARCHAR(30) NOT NULL, 
    [Password] VARCHAR(8) NULL, 
    [ContactPhoneNo] VARCHAR(15) NULL, 
    [EMailAddress] VARCHAR(80) NULL, 
    CONSTRAINT CK_AU1_V1Id_AuthorisedSignatories_CorrectValue CHECK (AuthorisedSignatories = 'AU1'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'AU1',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU1',
    @level2type = N'COLUMN',
    @level2name = 'AuthorisedSignatories'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU1',
    @level2type = N'COLUMN',
    @level2name = 'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0203',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU1',
    @level2type = N'COLUMN',
    @level2name = 'SignatoryName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0162',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU1',
    @level2type = N'COLUMN',
    @level2name = N'Password'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0056',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU1',
    @level2type = N'COLUMN',
    @level2name = 'ContactPhoneNo'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0067',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'AU1',
    @level2type = N'COLUMN',
    @level2name = 'EMailAddress'