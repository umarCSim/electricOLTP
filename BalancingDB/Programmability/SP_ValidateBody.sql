CREATE PROCEDURE [dbo].[SP_ValidateBody]
@FK_FileHeaderId INT, 
@FK_HistoryId INT,
@ReceivedTime DATETIME2,
@FileName VARCHAR(14),
@LineNumber INT
AS
	INSERT INTO ADT ([FK_FileHeaderId], [FK_HistoryId], [AcknowledgementDetails], [ReceivedTime], [ResponseTime], [FileName], [ResponseCode], ResponseData)
	SELECT @FK_FileHeaderId, @FK_HistoryId, 'ADT', @ReceivedTime, SYSDATETIME(), @FileName, 4, CONCAT('Line ', @LineNumber)


