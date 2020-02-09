CREATE TABLE [dbo].[RA4_V3]
(
	[RA4_V3Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [RoleAddressDetails] varchar (3) NOT NULL,
    [ActionCode] VARCHAR (9) NULL, 
    [AddressLine1] VARCHAR(40) NOT NULL, 
    [AddressLine2] VARCHAR(40) NULL, 
    [AddressLine3] VARCHAR(40) NULL, 
    [AddressLine4] VARCHAR(40) NULL, 
    [AddressLine5] VARCHAR(40) NULL, 
    [AddressLine6] VARCHAR(40) NULL, 
    [AddressLine7] VARCHAR(40) NULL, 
    [AddressLine8] VARCHAR(40) NULL, 
    [AddressLine9] VARCHAR(40) NULL, 
    [PostCode] VARCHAR(10) NULL, 
    [TelephoneNo] VARCHAR(15) NULL, 
    [FaxNo] VARCHAR(15) NULL, 
    [EmailAddress] VARCHAR(80) NULL,
	CONSTRAINT CK_RA4_V3Id_RoleAddressDetails_CorrectValue CHECK (RoleAddressDetails = 'RA4'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'RA4',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'RoleAddressDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0008',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine1'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0009',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine2'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0010',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine3'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0011',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine4'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0012',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine5'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0013',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine6'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0014',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine7'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0015',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine8'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0016',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'AddressLine9'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0176',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'PostCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0218',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = 'TelephoneNo'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0100',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = N'FaxNo'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0067',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RA4_V3',
    @level2type = N'COLUMN',
    @level2name = 'EmailAddress'