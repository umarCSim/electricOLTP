CREATE TABLE [dbo].[AAA]
(
	[FileHeaderId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[RecordType] VARCHAR(3) NOT NULL,
	[FileType] VARCHAR(8) NOT NULL,
	[MessageRole] CHAR NOT NULL,
	[CreationTime] DATETIME2 NOT NULL   ,
	[FromRoleCode] VARCHAR(2) NOT NULL,
	[FromParticipantId] VARCHAR(8) NOT NULL,
	[ToRoleCode] VARCHAR(2) NOT NULL,
	[ToParticipantId] VARCHAR(8) NOT NULL,
	[SequenceNumber] BIGINT NOT NULL, 
    [TestDataFlag] VARCHAR(4) NULL, 
    [FileSent] BIT NOT NULL DEFAULT 0, 
    [TransitType] VARCHAR(3) NOT NULL
)
