﻿/*
Deployment script for BalancingDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "BalancingDB"
:setvar DefaultFilePrefix "BalancingDB"
:setvar DefaultDataPath "C:\Users\Umar\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"
:setvar DefaultLogPath "C:\Users\Umar\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Dropping [dbo].[CK_ABP_V2Id_ImportExportIndicator_CorrectValue]...';


GO
ALTER TABLE [dbo].[ABP] DROP CONSTRAINT [CK_ABP_V2Id_ImportExportIndicator_CorrectValue];


GO
PRINT N'Dropping [dbo].[CK_ACE_V4_ProductionConsumptionFlag_CorrectValue]...';


GO
ALTER TABLE [dbo].[ACE] DROP CONSTRAINT [CK_ACE_V4_ProductionConsumptionFlag_CorrectValue];


GO
PRINT N'Dropping [dbo].[CK_APD_V8Id_ProductionConsumptionFlag_CorrectValue]...';


GO
ALTER TABLE [dbo].[APD_V8] DROP CONSTRAINT [CK_APD_V8Id_ProductionConsumptionFlag_CorrectValue];


GO
PRINT N'Altering [dbo].[Incoming_History]...';


GO
ALTER TABLE [dbo].[Incoming_History]
    ADD [ADTId] INT NULL;


GO
PRINT N'Creating unnamed constraint on [dbo].[Incoming_History]...';


GO
ALTER TABLE [dbo].[Incoming_History] WITH NOCHECK
    ADD FOREIGN KEY ([ADTId]) REFERENCES [dbo].[ADT] ([ADT_V1Id]);


GO
PRINT N'Creating [dbo].[CK_ABP_V2Id_ImportExportIndicator_CorrectValue]...';


GO
ALTER TABLE [dbo].[ABP] WITH NOCHECK
    ADD CONSTRAINT [CK_ABP_V2Id_ImportExportIndicator_CorrectValue] CHECK (ImportExportIndicator IN ('I', 'E'));


GO
PRINT N'Creating [dbo].[CK_ACE_V4_ProductionConsumptionFlag_CorrectValue]...';


GO
ALTER TABLE [dbo].[ACE] WITH NOCHECK
    ADD CONSTRAINT [CK_ACE_V4_ProductionConsumptionFlag_CorrectValue] CHECK (ProductionConsumptionFlag IN ('P', 'C'));


GO
PRINT N'Creating [dbo].[CK_APD_V8Id_ProductionConsumptionFlag_CorrectValue]...';


GO
ALTER TABLE [dbo].[APD_V8] WITH NOCHECK
    ADD CONSTRAINT [CK_APD_V8Id_ProductionConsumptionFlag_CorrectValue] CHECK (ProductionConsumptionFlag IN ('P', 'C'));


GO
PRINT N'Refreshing [dbo].[SP_Incoming_History]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[SP_Incoming_History]';


GO
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
VALUES (101, 'ACK', 'Duplicate file received', 'ensure files are not being resent
unnecessarily - a file has arrived with a
header identical to one already received')




-------------------------FLOW PACKAGES----------------------------

----------CRA's----------
IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0121' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0121', '001','CRA_R0121001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0141' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0141', '001','CRA_R0141001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0142' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0142', '001', 'CRA_R0142001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0143' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0143', '001', 'CRA_R0143001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0144' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0144', '001', 'CRA_R0144001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0145' AND FlowVersion = '005')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0145', '005', 'CRA_R0145005_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0146' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0146', '001', 'CRA_R0146001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0147' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0147', '001', 'CRA_R0147001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0148' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0148', '001', 'CRA_R0148001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0149' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0149', '001', 'CRA_R0149001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0211' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0211', '001', 'CRA_R0211001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R0241' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R0241', '001', 'CRA_R0241001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R014A' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R014A', '001', 'CRA_R014A001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R014B' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R014B', '001', 'CRA_R014B001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'R014C' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('R014C', '001', 'CRA_R014C001_Incoming.dtsx')

----------ECVAA's----------

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0071' AND FlowVersion = '003')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0071', '003', 'ECVAA_E0071003_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0081' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0081', '002', 'ECVAA_E0081002_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0091' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0091', '001', 'ECVAA_E0091001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0101' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0101', '001', 'ECVAA_E0101001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0131' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0131', '002', 'ECVAA_E0131002_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0132' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0132', '002', 'ECVAA_E0132002_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0141' AND FlowVersion = '004')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0141', '004', 'ECVAA_E0141004_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0221' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0221', '002', 'ECVAA_E0221002_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0281' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0281', '002', 'ECVAA_E0281002_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'E0291' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('E0291', '002', 'ECVAA_E0291002_Incoming.dtsx')

----------CDCA's----------
IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0101' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('C0101', '001', 'CDCA_C0101001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0121' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('C0121', '001', 'CDCA_C0121001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0141' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('C0141', '001', 'CDCA_C0141001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0291' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('C0291', '002', 'CDCA_C0291002_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0421' AND FlowVersion = '002')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('C0421', '002', 'CDCA_C0421002_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'C0541' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('C0541', '001', 'CDCA_C0541001_Incoming.dtsx')

----------SAA's----------
IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'S0141' AND FlowVersion = '008')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('S0141', '002', 'SAA_S0141008_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'S0161' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('S0161', '001', 'SAA_S0161001_Incoming.dtsx')

IF NOT EXISTS (SELECT FlowId FROM dbo.Lkup_Flow_Package WHERE FlowId = 'S0171' AND FlowVersion = '001')
INSERT INTO dbo.Lkup_Flow_Package (FlowId, FlowVersion, Package)
VALUES ('S0171', '001', 'SAA_S0171001_Incoming.dtsx')
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[ABP] WITH CHECK CHECK CONSTRAINT [CK_ABP_V2Id_ImportExportIndicator_CorrectValue];

ALTER TABLE [dbo].[ACE] WITH CHECK CHECK CONSTRAINT [CK_ACE_V4_ProductionConsumptionFlag_CorrectValue];

ALTER TABLE [dbo].[APD_V8] WITH CHECK CHECK CONSTRAINT [CK_APD_V8Id_ProductionConsumptionFlag_CorrectValue];


GO
CREATE TABLE [#__checkStatus] (
    id           INT            IDENTITY (1, 1) PRIMARY KEY CLUSTERED,
    [Schema]     NVARCHAR (256),
    [Table]      NVARCHAR (256),
    [Constraint] NVARCHAR (256)
);

SET NOCOUNT ON;

DECLARE tableconstraintnames CURSOR LOCAL FORWARD_ONLY
    FOR SELECT SCHEMA_NAME([schema_id]),
               OBJECT_NAME([parent_object_id]),
               [name],
               0
        FROM   [sys].[objects]
        WHERE  [parent_object_id] IN (OBJECT_ID(N'dbo.Incoming_History'))
               AND [type] IN (N'F', N'C')
                   AND [object_id] IN (SELECT [object_id]
                                       FROM   [sys].[check_constraints]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0
                                       UNION
                                       SELECT [object_id]
                                       FROM   [sys].[foreign_keys]
                                       WHERE  [is_not_trusted] <> 0
                                              AND [is_disabled] = 0);

DECLARE @schemaname AS NVARCHAR (256);

DECLARE @tablename AS NVARCHAR (256);

DECLARE @checkname AS NVARCHAR (256);

DECLARE @is_not_trusted AS INT;

DECLARE @statement AS NVARCHAR (1024);

BEGIN TRY
    OPEN tableconstraintnames;
    FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
    WHILE @@fetch_status = 0
        BEGIN
            PRINT N'Checking constraint: ' + @checkname + N' [' + @schemaname + N'].[' + @tablename + N']';
            SET @statement = N'ALTER TABLE [' + @schemaname + N'].[' + @tablename + N'] WITH ' + CASE @is_not_trusted WHEN 0 THEN N'CHECK' ELSE N'NOCHECK' END + N' CHECK CONSTRAINT [' + @checkname + N']';
            BEGIN TRY
                EXECUTE [sp_executesql] @statement;
            END TRY
            BEGIN CATCH
                INSERT  [#__checkStatus] ([Schema], [Table], [Constraint])
                VALUES                  (@schemaname, @tablename, @checkname);
            END CATCH
            FETCH tableconstraintnames INTO @schemaname, @tablename, @checkname, @is_not_trusted;
        END
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') >= 0
    CLOSE tableconstraintnames;

IF CURSOR_STATUS(N'LOCAL', N'tableconstraintnames') = -1
    DEALLOCATE tableconstraintnames;

SELECT N'Constraint verification failed:' + [Schema] + N'.' + [Table] + N',' + [Constraint]
FROM   [#__checkStatus];

IF @@ROWCOUNT > 0
    BEGIN
        DROP TABLE [#__checkStatus];
        RAISERROR (N'An error occurred while verifying constraints', 16, 127);
    END

SET NOCOUNT OFF;

DROP TABLE [#__checkStatus];


GO
PRINT N'Update complete.';


GO
