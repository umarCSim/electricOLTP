CREATE TABLE [dbo].[Lkup_FlowTables]
(
	[FlowTableId] INT NOT NULL PRIMARY KEY, 
    [FK_FlowId] INT NOT NULL, 
    [TableName] VARCHAR(50) NOT NULL
)
