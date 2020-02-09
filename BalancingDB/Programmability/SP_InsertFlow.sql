/*
This SP is used by the Incoming.dtsx package
Example call: Where (?) is an input field to be mapped and (output) is an output field to be mapped.
EXECUTE [dbo].[SP_InsertFlowKey] ?,? OUTPUT
*/
CREATE PROCEDURE dbo.SP_InsertFlowKey 
	@FlowId VARCHAR(8)
	,@FK_FileHeaderId INT
	,@Return_FlowKeyId INT OUTPUT
AS
DECLARE @TempTable TABLE (Id INT)

INSERT INTO dbo.FlowKeys (
	[FlowId]
	,[FK_FileHeaderId]
	)
OUTPUT INSERTED.FlowKeyId
INTO @TempTable
VALUES (
	@FlowId
	,@FK_FileHeaderId
	)

SET @Return_FlowKeyId = (
		SELECT Id
		FROM @TempTable
		)

RETURN
GO


