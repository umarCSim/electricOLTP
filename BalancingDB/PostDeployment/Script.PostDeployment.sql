/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

----------------------------FLOW SETTINGS-------------------------------
DECLARE @InitialDigitFormat VARCHAR(100) = '000000000000'
DECLARE @CurrentSequenceValue BIGINT
DECLARE @FileName VARCHAR(14)

----------HEADER----------
IF NOT EXISTS (SELECT SettingName FROM FlowSettings WHERE SettingName = 'ParticipantId')
INSERT INTO FlowSettings (SettingName, SettingValue)
VALUES ('ParticipantId', 'KIND')

EXECUTE [dbo].[SP_GetSequenceValue] 0, N'Sequence_Outgoing_Flow_Header', @CurrentSequenceValue OUT
IF NOT EXISTS (SELECT SettingName FROM FlowSettings WHERE SettingName = 'CurrentSequence_Header')
INSERT INTO FlowSettings (SettingName, SettingValue)
SELECT 'CurrentSequence_Header', CAST(@CurrentSequenceValue AS VARCHAR)

----------FILENAME---------
EXECUTE [dbo].[SP_GetSequenceValue] 0, N'Sequence_Outgoing_Flow_FileName', @CurrentSequenceValue OUT
IF NOT EXISTS (SELECT SettingName FROM FlowSettings WHERE SettingName = 'CurrentSequence_FileName')
INSERT INTO FlowSettings (SettingName, SettingValue)
SELECT 'CurrentSequence_FileName', CAST(@CurrentSequenceValue AS VARCHAR)

IF NOT EXISTS (SELECT SettingName FROM FlowSettings WHERE SettingName = 'DigitFormat')
INSERT INTO FlowSettings (SettingName, SettingValue)
VALUES ('DigitFormat', @InitialDigitFormat)

EXECUTE [dbo].[SP_GetFilename] 0, 'CR', @InitialDigitFormat, @FileName OUT
IF NOT EXISTS (SELECT SettingName FROM FlowSettings WHERE SettingName = 'FileNameFormat')
INSERT INTO FlowSettings (SettingName, SettingValue)
VALUES ('FileNameFormat', @FileName)


-------------------------RESPONSE CODES INFO----------------------------
----------NACK----------
IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 1)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (1, 'NACK', 'Syntax Error in Header Record', 'Correct and resend')

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 2)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (2, 'NACK', 'To Participant details in header record are
not correct for the actual recipient', 'Correct and resend')

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 3)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (3, 'NACK', 'Unexpected Sequence Number in Header
record', 'See section 2.2.8')

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 4)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (4, 'NACK', 'Syntax Error in Body. Error Data field
contains line number where error detected.', 'Correct and resend')

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 5)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (5, 'NACK', 'Syntax Error in Footer Record', 'Correct and resend')

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 6)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (6, 'NACK', 'Incorrect Line Count in Footer Record', 'Correct and resend')

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 7)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (7, 'NACK', 'Incorrect Checksum in Footer Record', 'Correct and resend')

----------ACK----------

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 100)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (100, 'ACK', 'File received', 'none - file has arrived and its contents
have passed the validation checks covered
by the NACK response codes')

IF NOT EXISTS (SELECT ResponseCode FROM ResponseCodeInfo WHERE ResponseCode = 101)
INSERT INTO ResponseCodeInfo (ResponseCode, CodeType, Meaning, AppropriateAction)
VALUES (101, 'DUP', 'Duplicate file received', 'ensure files are not being resent
unnecessarily - a file has arrived with a
header identical to one already received')




-------------------------FLOW PACKAGES----------------------------

----------CRA's----------
IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0121' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0121', '001','CRA_R0121001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0141' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0141', '001','CRA_R0141001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0142' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0142', '001', 'CRA_R0142001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0143' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0143', '001', 'CRA_R0143001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0144' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0144', '001', 'CRA_R0144001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0145' AND FlowVersion = '005')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0145', '005', 'CRA_R0145005_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0146' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0146', '001', 'CRA_R0146001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0147' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0147', '001', 'CRA_R0147001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0148' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0148', '001', 'CRA_R0148001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0149' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0149', '001', 'CRA_R0149001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0211' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0211', '001', 'CRA_R0211001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0241' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R0241', '001', 'CRA_R0241001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R014A' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R014A', '001', 'CRA_R014A001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R014B' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R014B', '001', 'CRA_R014B001_Incoming.dtsx','CR')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R014C' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('R014C', '001', 'CRA_R014C001_Incoming.dtsx','CR')

----------ECVAA's----------

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0071' AND FlowVersion = '003')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0071', '003', 'ECVAA_E0071003_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0081' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0081', '002', 'ECVAA_E0081002_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0091' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0091', '001', 'ECVAA_E0091001_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0101' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0101', '001', 'ECVAA_E0101001_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0131' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0131', '002', 'ECVAA_E0131002_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0132' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0132', '002', 'ECVAA_E0132002_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0141' AND FlowVersion = '004')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0141', '004', 'ECVAA_E0141004_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0221' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0221', '002', 'ECVAA_E0221002_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0281' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0281', '002', 'ECVAA_E0281002_Incoming.dtsx','EC')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0291' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('E0291', '002', 'ECVAA_E0291002_Incoming.dtsx','EC')

----------CDCA's----------
IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0101' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('C0101', '001', 'CDCA_C0101001_Incoming.dtsx','CD')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0121' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('C0121', '001', 'CDCA_C0121001_Incoming.dtsx','CD')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0141' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('C0141', '001', 'CDCA_C0141001_Incoming.dtsx','CD')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0291' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('C0291', '002', 'CDCA_C0291002_Incoming.dtsx','CD')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0411' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('C0411', '002', 'CDCA_C0411002_Incoming.dtsx','CD')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0421' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('C0421', '002', 'CDCA_C0421002_Incoming.dtsx','CD')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0541' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('C0541', '001', 'CDCA_C0541001_Incoming.dtsx','CD')

----------SAA's----------
IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'S0141' AND FlowVersion = '008')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('S0141', '002', 'SAA_S0141008_Incoming.dtsx','SA')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'S0161' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('S0161', '001', 'SAA_S0161001_Incoming.dtsx','SA')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'S0171' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package, SenderRole)
VALUES ('S0171', '001', 'SAA_S0171001_Incoming.dtsx','SA')
