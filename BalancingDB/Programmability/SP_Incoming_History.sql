CREATE PROCEDURE [dbo].[SP_Incoming_History] @FileHeaderId INT
	,@Filename VARCHAR(100)
	,@Package VARCHAR(100)
	,@ProcessStarted DATETIME2
	,@ProcessEnded DATETIME2
	,@ProcessSuccess BIT
	,@SSISLog_ExecutionId_Parent UNIQUEIDENTIFIER
	,@SSISLog_ExecutionId_Child UNIQUEIDENTIFIER
	,@HeaderValidationBypassed BIT
	,@FooterValidationBypassed BIT
	,@RETURN_TABLENAME_Id INT OUTPUT
	--,@RETURN_PROCESSSTARTTIME DATETIME2 OUTPUT
AS
--DECLARE @TempTable TABLE (Id INT, ProcessStarted DATETIME2)
DECLARE @TempTable TABLE (Id INT)

INSERT INTO [dbo].[Incoming_History] (
	[FileHeaderId]
	,[Filename]
	,[Package]
	,[ProcessStarted]
	,[ProcessEnded]
	,[ProcessSuccess]
	,[HeaderValidationBypassed]
	,[FooterValidationBypassed]
	,[SSISLog_ExecutionId_Parent]
	,[SSISLog_ExecutionId_Child]
	)
OUTPUT INSERTED.HistoryId--, INSERTED.ProcessStarted
INTO @TempTable
SELECT @FileHeaderId
	,@Filename
	,@Package
	,@ProcessStarted
	,@ProcessEnded
	,@ProcessSuccess
	,@HeaderValidationBypassed
	,@FooterValidationBypassed
	,@SSISLog_ExecutionId_Parent
	,@SSISLog_ExecutionId_Child

SET @RETURN_TABLENAME_Id = (
		SELECT Id
		FROM @TempTable
		)

--SET @RETURN_PROCESSSTARTTIME = (
--		SELECT ProcessStarted
--		FROM @TempTable
--		)

RETURN
GO