CREATE TABLE [dbo].[Lkup_Flows]
(
	[SystemCode] VARCHAR(1) NOT NULL , 
    [FlowId] VARCHAR(4) NOT NULL, 
    [FlowName] VARCHAR(100) NOT NULL,
	[FlowHeaderRecordType] VARCHAR(3) NOT NULL,
    PRIMARY KEY ([SystemCode], [FlowId])
)
