CREATE TRIGGER [FlowSettings_Trigger]
	ON [dbo].[FlowSettings_View]
	INSTEAD OF UPDATE
	AS
	BEGIN
		SET NOCOUNT ON

		--If the sequence has been changed, we want to reset the sequence to the new value
		DECLARE @SettingName VARCHAR(100)
		,@SettingValue VARCHAR(100)
		SET @SettingName = (SELECT CAST(SettingName AS VARCHAR) FROM inserted)
		SET @SettingValue = (SELECT CAST(SettingValue AS VARCHAR) FROM inserted)

		IF(@SettingName = 'CurrentSequence_Header')
		EXECUTE [dbo].[SP_ResetNextSequenceValue] N'Sequence_Outgoing_Flow_Header', @SettingValue

		IF(@SettingName = 'CurrentSequence_FileName')
		EXECUTE [dbo].[SP_ResetNextSequenceValue] N'Sequence_Outgoing_Flow_FileName', @SettingValue


		--Update the FlowSettings table with new values
		UPDATE [FlowSettings]
		SET FlowSettings.SettingValue = CAST(inserted.[SettingValue] AS VARCHAR)
		FROM inserted
		WHERE FlowSettings.SettingId = inserted.SettingId

		--This one is only to view the result of the file name changes
		DECLARE @DigitFormat VARCHAR(12)
		SET @DigitFormat = (SELECT SettingValue FROM FlowSettings WHERE SettingName = 'DigitFormat')
		DECLARE @MyReturnValue NVARCHAR (14)
		EXECUTE [dbo].[SP_GetFilename] 0, 'CR', @DigitFormat, @MyReturnValue OUT

		UPDATE [FlowSettings]
		SET SettingValue = @MyReturnValue
		FROM FlowSettings
		WHERE SettingName = 'FileNameFormat'



	END
