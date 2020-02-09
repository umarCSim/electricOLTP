CREATE PROCEDURE [dbo].[SP_SetNextQueuedItem_Outgoing]
AS
DECLARE @QueueId INT

	IF EXISTS (SELECT * FROM [dbo].[Queue_Outgoing])
	BEGIN	
		UPDATE FirstItem SET Process = 1
		FROM
		(
		SELECT TOP 1 Process
		FROM [dbo].[Queue_Outgoing]
		ORDER BY QueueId ASC
		) AS [FirstItem]	
	END
	ELSE	
		THROW 51000, 'No items queued at this time', 1	
	GO