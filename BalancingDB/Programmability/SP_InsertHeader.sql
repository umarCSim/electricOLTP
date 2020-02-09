/*
This SP is used by the Incoming.dtsx package
Example call: Where (?) is an input field to be mapped and (output) is an output field to be mapped.
EXECUTE [dbo].[SP_InsertHeader] ?,?,?,?,?,?,?,?,?,?,? output
*/
CREATE PROCEDURE dbo.SP_InsertHeader
	@RecordType VARCHAR (3),
	@FileType VARCHAR(8),
	@MessageRole CHAR,
	@CreationTime DATETIME2(7),
	@FromRoleCode VARCHAR(2),
	@FromParticipantId VARCHAR(8),
	@ToRoleCode VARCHAR(2),
	@ToParticipantId VARCHAR(8),
	@SequenceNumber BIGINT,
	@TestDataFlag VARCHAR(4),
	@TransitType VARCHAR(3),
	@Return_FileHeaderId INT OUTPUT
AS
	DECLARE @TempTable TABLE (Id INT)
	INSERT INTO AAA 
	(
       [RecordType]
      ,[FileType]
      ,[MessageRole]
      ,[CreationTime]
      ,[FromRoleCode]
      ,[FromParticipantId]
      ,[ToRoleCode]
      ,[ToParticipantId]
      ,[SequenceNumber]
      ,[TestDataFlag]
	  ,[TransitType]
	)
	OUTPUT INSERTED.FileHeaderId INTO @TempTable
	VALUES
	(
		@RecordType,
		@FileType,
		@MessageRole,
		@CreationTime,
		@FromRoleCode,
		@FromParticipantId,
		@ToRoleCode,
		@ToParticipantId,
		@SequenceNumber,
		@TestDataFlag,
		@TransitType
	);

	SET @Return_FileHeaderId = (SELECT Id FROM @TempTable);

	IF(@MessageRole = 'D')
	EXECUTE [dbo].[SP_GetSequenceValue] 1, N'Sequence_Outgoing_Flow_Header', NULL
	WITH RESULT SETS NONE

RETURN
GO
