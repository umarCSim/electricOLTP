--WARNING! ERRORS ENCOUNTERED DURING SQL PARSING!
/*
This SP will perform validations 1, 2 and 3 on all incoming flows.
Validation 1 is handled by the initial insert of the header
*/
CREATE PROCEDURE [dbo].[SP_ValidateHeader] 
@FK_FileHeaderId INT,
@FK_HistoryId INT,
@ReceivedTime DATETIME2,
@FileName VARCHAR(14),
@RecordType VARCHAR(100),
@FileType VARCHAR(100),
@MessageRole VARCHAR(100),
@CreationTime VARCHAR(100),
@FromRoleCode VARCHAR(100),
@FromParticipantId VARCHAR(100),
@ToRoleCode VARCHAR(100),
@ToParticipantId VARCHAR(100),
@ToParticipantIdParam VARCHAR(100),
@SequenceNumber VARCHAR(100),
@TestDataFlag VARCHAR(100)
AS
--VALIDATE HEADER SYNTAX	  
DECLARE @HeaderSyntaxErrorOccured SMALLINT = 0
DECLARE @ResponseData VARCHAR(80)

IF NOT (@RecordType = 'AAA' AND DATALENGTH(@RecordType) = 3)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in RecordType'
END

IF NOT (DATALENGTH(@FileType) = 8)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in FileType'
END

IF NOT (DATALENGTH(@MessageRole) = 1 AND @MessageRole IN ('D', 'R'))
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in MessageRole'
END

IF NOT (DATALENGTH(@CreationTime) = 14 AND ISNUMERIC(@CreationTime) = 1)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in CreationTime'
END

IF NOT (DATALENGTH(@FromRoleCode) = 2)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in FromRoleCode'
END

IF NOT (DATALENGTH(@FromParticipantId) <= 8)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in FromParticipantId'
END

IF NOT (DATALENGTH(@ToRoleCode) = 2)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in ToRoleCode'
END

IF NOT (DATALENGTH(@ToParticipantId) <= 8)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in ToParticipantId'
END

IF NOT (DATALENGTH(@SequenceNumber) <= 9 AND ISNUMERIC(@SequenceNumber) = 1)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in SequenceNumber'
END

IF NOT (DATALENGTH(@TestDataFlag) <= 4)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1
	SET @ResponseData = 'Syntax error in TestDataFlag'
END

IF (@HeaderSyntaxErrorOccured = 1)
	INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode], [ResponseData])
	SELECT - 1, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 1, @ResponseData

--VALIDATE PARTICIPANT DETAILS
IF NOT (@ToParticipantId = @ToparticipantIdParam)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1

	INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode])
	SELECT @FK_FileHeaderId, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 2
END

--VALIDATE SEQUENCE
/*
If incoming file is a data file, sequence should match current sequence
if incoming file is a response, the sequence should match an earlier sequence sent out
*/
IF (@MessageRole = 'D')
BEGIN

	IF NOT (
			CAST(@SequenceNumber AS BIGINT) = (
				SELECT current_value
				FROM sys.sequences
				WHERE [name] = 'Sequence_Outgoing_Flow_Header'
				)
			)
			BEGIN
				SET @HeaderSyntaxErrorOccured = 1

				INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode])
				SELECT @FK_FileHeaderId, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 3
			END
END
IF (@MessageRole = 'R')
BEGIN
	IF NOT EXISTS
	(
		SELECT SequenceNumber
		FROM AAA
		WHERE SequenceNumber = CAST(@SequenceNumber AS BIGINT)
	)
	BEGIN

		INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode])
		SELECT @FK_FileHeaderId, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 3
	END
END

--DUPLICATE FILE RECEIVED
IF EXISTS
(
SELECT FileHeaderId
FROM AAA
WHERE RecordType = @RecordType
AND FileType = @FileType
AND MessageRole = @MessageRole
--AND CreationTime = @CreationTime --Removed as we'd have to convert param to datetime2 first. Not required to determine if duplicate
AND FromRoleCode = @FromRoleCode
AND FromParticipantId = @FromParticipantId
AND ToRoleCode = @ToRoleCode
AND SequenceNumber = CAST(@SequenceNumber AS BIGINT)
AND TestDataFlag = @TestDataFlag
)
BEGIN
	SET @HeaderSyntaxErrorOccured = 1

	INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode])
	SELECT @FK_FileHeaderId, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 101
END


IF @HeaderSyntaxErrorOccured = 1 THROW 51000, 'Header failed validation', 1
