CREATE TABLE [dbo].[RRH_V5]
(
	[RRH_V5Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId),
    [RegistrationReportHeader] VARCHAR(3) NOT NULL, 
    [RequestingRegistrant] VARCHAR(8) NOT NULL, 
    [RegistrationType] VARCHAR(2) NOT NULL
	CONSTRAINT CK_RRH_V1Id_RegistrationReportHeader_CorrectValue CHECK (RegistrationReportHeader = 'RRH'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'RRH',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RRH_V5',
    @level2type = N'COLUMN',
    @level2name = N'RegistrationReportHeader'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0193',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RRH_V5',
    @level2type = N'COLUMN',
    @level2name = N'RequestingRegistrant'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0186',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'RRH_V5',
    @level2type = N'COLUMN',
    @level2name = N'RegistrationType'
GO