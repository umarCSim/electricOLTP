CREATE TABLE [dbo].[ADT]
(
	[ADT_V1Id] INT NOT NULL PRIMARY KEY IDENTITY,
	[FK_FileHeaderId] INT NOT NULL,-- FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[FK_HistoryId] INT NOT NULL FOREIGN KEY REFERENCES Incoming_History(HistoryId),
    [AcknowledgementDetails] VARCHAR(3) NOT NULL, 
    [ReceivedTime] DATETIME2 NOT NULL, 
    [ResponseTime] DATETIME2 NOT NULL DEFAULT SYSDATETIME(), 
    [FileName] VARCHAR(14) NOT NULL, 
    [ResponseCode] SMALLINT NOT NULL FOREIGN KEY REFERENCES ResponseCodeInfo(ResponseCode), 
    [ResponseData] VARCHAR(80) NULL
    CONSTRAINT CK_ADT_V1Id_AcknowledgementDetails_CorrectValue CHECK (AcknowledgementDetails = 'ADT'), 
)


GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'ADT',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ADT',
    @level2type = N'COLUMN',
    @level2name = N'AcknowledgementDetails'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0299 - Time that the message being acknowledged was received',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ADT',
    @level2type = N'COLUMN',
    @level2name = N'ReceivedTime'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0300 - Time that the response message was',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ADT',
    @level2type = N'COLUMN',
    @level2name = N'ResponseTime'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0301 - Name of file this response relates to',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ADT',
    @level2type = N'COLUMN',
    @level2name = N'FileName'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0302 - A code indicating the nature of the acceptance/rejection',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ADT',
    @level2type = N'COLUMN',
    @level2name = N'ResponseCode'
GO
EXEC sp_addextendedproperty @name = N'MS_Description',
    @value = N'N0303 - Any data that gives additional information in fixing the problem',
    @level0type = N'SCHEMA',
    @level0name = N'dbo',
    @level1type = N'TABLE',
    @level1name = N'ADT',
    @level2type = N'COLUMN',
    @level2name = N'ResponseData'