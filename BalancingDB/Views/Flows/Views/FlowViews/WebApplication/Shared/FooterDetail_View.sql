CREATE VIEW [dbo].[FooterDetail_View]
AS
SELECT [FileFooterId]
      ,[FK_FileHeaderId]
      ,[RecordType]
      ,[RecordCount]
      ,[Checksum]
FROM [dbo].[ZZZ]
