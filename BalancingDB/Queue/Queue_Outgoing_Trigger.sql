CREATE TRIGGER [Queue_Outgoing_Trigger_Insert]
ON dbo.Queue_Outgoing
AFTER INSERT
AS
BEGIN
	SET NOCOUNT ON
	INSERT INTO dbo.Queue_Outgoing_History
	(
		QueueId,
		FileHeaderId,
		FlowKeyId,
		SenderRole,
		Package,
		InsertedIntoQueueDate
	)
	SELECT 
	QueueId,
	[FileHeaderId],
	[FlowKeyId],
	SenderRole,
	Package,
	InsertedIntoQueue
	FROM inserted
END
GO

