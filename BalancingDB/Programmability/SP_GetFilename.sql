/*
The file name is made up of the sender role (2 characters) and 12 digits 
Example call:
DECLARE @MyReturnValue NVARCHAR (12)
EXECUTE [dbo].[SP_GetFilename] 0, 'AB', '000000000000', @MyReturnValue OUT
*/
CREATE PROCEDURE [dbo].[SP_GetFilename]
	@AllowIncrement bit
	,@SenderRole VARCHAR(2)
	,@DigitFormat VARCHAR(12)
	,@ReturnValue VARCHAR (14) OUTPUT
AS

DECLARE @TempOut BIGINT
EXECUTE [dbo].[SP_GetSequenceValue] @AllowIncrement, 'Sequence_Outgoing_Flow_Filename', @TempOut OUT
SET @ReturnValue = FORMAT(@TempOut, @SenderRole + @DigitFormat)

RETURN 0
