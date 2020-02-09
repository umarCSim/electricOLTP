CREATE TABLE [dbo].[ZZZ]
(
	[FileFooterId] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FK_FileHeaderId] INT NOT NULL FOREIGN KEY REFERENCES AAA(FileHeaderId),
	[RecordType] VARCHAR(3) NOT NULL,
	[RecordCount] INT NOT NULL,
	[Checksum] INT NOT NULL,
	CONSTRAINT CK_FileFooter_RecordType_CorrectValue CHECK (RecordType = 'ZZZ')
)
