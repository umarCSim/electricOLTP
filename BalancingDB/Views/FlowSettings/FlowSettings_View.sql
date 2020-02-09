CREATE VIEW [dbo].[FlowSettings_View]
AS
SELECT [SettingId]
      ,[SettingName]
      ,CASE
		WHEN [SettingName] = 'CurrentSequence_Header' THEN (SELECT current_value FROM sys.sequences WHERE [name] = 'Sequence_Outgoing_Flow_Header')
		WHEN [SettingName] = 'CurrentSequence_FileName' THEN (SELECT current_value FROM sys.sequences WHERE [name] = 'Sequence_Outgoing_Flow_FileName')
		ELSE [SettingValue]
	  END AS [SettingValue]

FROM [dbo].[FlowSettings]	
