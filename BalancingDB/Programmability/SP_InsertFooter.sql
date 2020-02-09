/*
This SP is used by the Master_ETL_Incoming package
Example call: Where (?) is an input field to be mapped and (output) is an output field to be mapped.
EXECUTE [dbo].[SP_InsertFooter] ?,?,?,?,? OUTPUT
*/
CREATE PROCEDURE [dbo].[SP_InsertFooter]
@FK_FileHeaderId INT,
@RecordType VARCHAR(3),
@RecordCount INT,
@Checksum INT,
@Return_FileFooterId INT OUTPUT
AS

DECLARE @TempTable TABLE (Id INT)

INSERT INTO ZZZ 
(
[FK_FileHeaderId],
[RecordType],
[RecordCount],
[Checksum]
)
OUTPUT INSERTED.FileFooterId
INTO @TempTable

SELECT @FK_FileHeaderId,
@RecordType,
@RecordCount,
@Checksum

SET @Return_FileFooterId = (
		SELECT Id
		FROM @TempTable
		)
