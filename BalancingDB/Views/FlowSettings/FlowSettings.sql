CREATE TABLE [dbo].[FlowSettings]
(
	[SettingId] TINYINT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [SettingName] VARCHAR(100) NOT NULL, 
    [SettingValue] VARCHAR(100) NULL
)
