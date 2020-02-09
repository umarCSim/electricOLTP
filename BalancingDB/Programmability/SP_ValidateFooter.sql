/*
This SP will perform validations 5, 6 and 7 on all incoming flows.
*/
CREATE PROCEDURE [dbo].[SP_ValidateFooter] 
@FK_FileHeaderId INT, 
@FK_HistoryId INT,
@ReceivedTime DATETIME2,
@FileName VARCHAR(14),
@RecordType VARCHAR(100),
@RecordCountCol VARCHAR(100),
@RowCount INT,
@ChecksumCol VARCHAR(100),
@Checksum INT

AS
--VALIDATE FOOTER SYNTAX	  
DECLARE @HeaderSyntaxErrorOccured SMALLINT = 0
DECLARE @ResponseData VARCHAR(80)

IF NOT (@RecordType = 'ZZZ' AND DATALENGTH(@RecordType) = 3)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in RecordType'
END

IF NOT (ISNUMERIC(@RecordCountCol) = 1)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in RowCount'
END

IF NOT (ISNUMERIC(@Checksum) = 1)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in Checksum'
END

IF (@HeaderSyntaxErrorOccured = 1)
	INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode], [ResponseData])
	SELECT - 1, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 5, @ResponseData

--VALIDATE ROW COUNT
IF NOT (CAST(@RecordCountCol AS INT) = @RowCount)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode], ResponseData)
	SELECT @FK_FileHeaderId, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 6, CONCAT('RecordCount(file) ', CAST(@RecordCountCol AS INT), ' RecordCount(calc) ', @RowCount)
END

--VALIDATE CHECKSUM
IF NOT ( CAST(@ChecksumCol AS INT) = @Checksum)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode], ResponseData)
	SELECT @FK_FileHeaderId, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 7, CONCAT('CS(F) ', CAST(@ChecksumCol AS INT), ' CS(Clc) ', @Checksum)
END

--IF @HeaderSyntaxErrorOccured = 1 THROW 51000, 'Footer failed validation', 1
