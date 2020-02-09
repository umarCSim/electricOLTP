CREATE TABLE [dbo].[ResponseCodeInfo]
(
	[ResponseCode] SMALLINT NOT NULL PRIMARY KEY,
	[CodeType] VARCHAR(4) NOT NULL,
    [Meaning] VARCHAR(100) NOT NULL, 
    [AppropriateAction] VARCHAR(200) NOT NULL
)
