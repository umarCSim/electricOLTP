CREATE TABLE [dbo].[Incoming_History]
(
	[HistoryId] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [FileHeaderId] INT NULL, 
	[Filename] VARCHAR(100) NOT NULL,
    [Package] VARCHAR(100) NULL, 
    [ProcessStarted] DATETIME2 NOT NULL DEFAULT SYSDATETIME() , 
    [ProcessEnded] DATETIME2 NULL, 
    [ProcessSuccess] BIT NOT NULL DEFAULT 0  , 
    [SSISLog_ExecutionId_Parent] UNIQUEIDENTIFIER NULL, 
    [SSISLog_ExecutionId_Child] UNIQUEIDENTIFIER NULL, 
    [HeaderValidationBypassed] BIT NULL, 
    [FooterValidationBypassed] BIT NULL 
)
