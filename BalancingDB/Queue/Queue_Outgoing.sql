CREATE TABLE [dbo].[Queue_Outgoing]
(
	[QueueId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FileHeaderId] INT NULL, 
    [FlowKeyId] INT NULL,
	[SenderRole] VARCHAR(2) NOT NULL,
    [Package] VARCHAR(255) NOT NULL,
    [InsertedIntoQueue] DATETIME2 NOT NULL , 
    [Process] BIT NOT NULL DEFAULT 1
)
