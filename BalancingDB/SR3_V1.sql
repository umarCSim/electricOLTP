CREATE TABLE [dbo].[SR3_V1]
(
	[SR3_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_FlowKeyId] INT NOT NULL FOREIGN KEY REFERENCES FlowKeys(FlowKeyId) DEFAULT -1,
    [SettlementReportDetails] VARCHAR(3) NOT NULL, 
    [ActionCode] VARCHAR(9) NULL,
    [ReportType] VARCHAR(30) NOT NULL, 
    [DistributionMethod] VARCHAR(20) NULL,
	CONSTRAINT CK_SR3_V1Id_SettlementReportDetails_CorrectValue CHECK (SettlementReportDetails = 'SR3'),
)

GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'SR3',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'SR3_V1',
    @level2type = N'COLUMN',
    @level2name = N'SettlementReportDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0339',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'SR3_V1',
    @level2type = N'COLUMN',
    @level2name = N'ActionCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0192',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'SR3_V1',
    @level2type = N'COLUMN',
    @level2name = N'ReportType'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0065',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'SR3_V1',
    @level2type = N'COLUMN',
    @level2name = N'DistributionMethod'