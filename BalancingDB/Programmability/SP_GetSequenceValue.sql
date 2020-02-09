/*
This SP will either get the current sequence number or increment to get the next number
Example call:
DECLARE @MyReturnValue BIGINT
EXECUTE [dbo].[SP_GetSequenceValue] 0, N'Sequence_Outgoing_Flow_Header', @MyReturnValue OUT
*/
CREATE PROCEDURE [dbo].[SP_GetSequenceValue]
	@AllowIncrement bit
	,@SequenceName VARCHAR(50)
	,@ReturnValue BIGINT OUTPUT
AS
IF(@AllowIncrement = 1)
BEGIN
	DECLARE @SQLQueryNextValue NVARCHAR(100)
	SET @SQLQueryNextValue = 'SET @NextSequenceValue = NEXT VALUE FOR ' + @SequenceName;

	EXECUTE sp_executesql @SQLQueryNextValue
		,N'@NextSequenceValue BIGINT OUT'
		,@ReturnValue OUT;
END
ELSE
	SET @ReturnValue = CAST((SELECT current_value FROM sys.sequences WHERE [name] = @SequenceName) AS BIGINT);
	                                                                                                                          
