CREATE TABLE [dbo].[Queue_Outgoing_History]
(
	[QueueId] INT NOT NULL PRIMARY KEY, 
    [FileHeaderId] INT NULL, 
    [FlowKeyId] INT NULL,
	[SenderRole] VARCHAR(2) NOT NULL,
    [Package] VARCHAR(100) NOT NULL, 
    [InsertedIntoQueueDate] DATETIME2 NOT NULL, 
    [ProcessStarted] DATETIME2 NULL , 
    [ProcessEnded] DATETIME2 NULL, 
    [ProcessSuccess] BIT NOT NULL DEFAULT 1, 
    [SSISLog_ExecutionId_Parent] UNIQUEIDENTIFIER NULL, 
    [SSISLog_ExecutionId_Child] UNIQUEIDENTIFIER NULL 
)
