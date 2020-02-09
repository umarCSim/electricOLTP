﻿CREATE VIEW [dbo].[FlowSummary_View]
AS
SELECT [Incoming_History].[HistoryId]
      ,[Incoming_History].[FileHeaderId]
	  ,[AAA].[SequenceNumber]
	  ,[AAA].[CreationTime]
      ,[Incoming_History].[ProcessEnded]     
	  ,[AAA].[FileType]
      ,[AAA].[MessageRole]     
      ,[AAA].[FromRoleCode]
	  ,[AAA].[FromParticipantId]
      ,[AAA].[ToRoleCode]
      ,[AAA].[ToParticipantId]
	  ,[Incoming_History].[ProcessSuccess]
	  ,[AAA].[TransitType]
FROM [dbo].[Incoming_History]
LEFT JOIN [AAA] ON [AAA].FileHeaderId = [Incoming_History].FileHeaderId
