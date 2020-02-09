CREATE VIEW [dbo].[FileProcessingDetail_View]
AS
SELECT [Incoming_History].[HistoryId]
      ,[Incoming_History].[FileHeaderId]
      ,[Incoming_History].[Filename]
      ,[Incoming_History].[Package]
      ,[Incoming_History].[ProcessStarted]
      ,[Incoming_History].[ProcessEnded]
      ,[Incoming_History].[ProcessSuccess]
      ,[Incoming_History].[HeaderValidationBypassed]
      ,[Incoming_History].[FooterValidationBypassed]
	  ,ResponseCodeInfo.CodeType
	  ,ResponseCodeInfo.Meaning
	  ,ADT.ResponseData
	  ,ResponseCodeInfo.AppropriateAction
	  ,ADT.ResponseTime AS [ResponseSentDate]
FROM [dbo].[Incoming_History]
LEFT JOIN ADT ON ADT.FK_HistoryId = [Incoming_History].HistoryId
LEFT JOIN ResponseCodeInfo ON ResponseCodeInfo.ResponseCode = ADT.ResponseCode

