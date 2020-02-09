/*
This SP will reset the sequence value for the sequence specified in the @SequenceName parameter
Example call:
EXECUTE [dbo].[SP_ResetNextSequenceValue] N'Sequence_Outgoing_Flow_Header', 30
*/

CREATE PROCEDURE [dbo].[SP_ResetNextSequenceValue]
	@SequenceName NVARCHAR(50)
	,@NewValue BIGINT

AS

DECLARE @SQLQuery NVARCHAR(100)

SET @SQLQuery = 'ALTER SEQUENCE ' + @SequenceName + ' RESTART WITH ' + CAST(@NewValue AS NVARCHAR)

EXECUTE sp_executesql @SQLQuery

RETURN 0
