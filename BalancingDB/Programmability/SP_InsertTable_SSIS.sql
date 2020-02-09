/*
This SP is used by the Incoming.dtsx package
Example call: Where (?) is an input field to be mapped, (output) is an output field to be mapped and ('10' or any number) is a placeholder.
EXECUTE [dbo].[SP_InsertTable_SSIS] '0141','SP9', ?,?,?,?,'5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',? OUTPUT
*/
CREATE PROCEDURE [dbo].[SP_InsertTable_SSIS] @Flow_InsertFor VARCHAR(5)
	,@Table_InsertFor VARCHAR(3)
	,@PARAM1 VARCHAR(255) = NULL
	,@PARAM2 VARCHAR(255) = NULL
	,@PARAM3 VARCHAR(255) = NULL
	,@PARAM4 VARCHAR(255) = NULL
	,@PARAM5 VARCHAR(255) = NULL
	,@PARAM6 VARCHAR(255) = NULL
	,@PARAM7 VARCHAR(255) = NULL
	,@PARAM8 VARCHAR(255) = NULL
	,@PARAM9 VARCHAR(255) = NULL
	,@PARAM10 VARCHAR(255) = NULL
	,@PARAM11 VARCHAR(255) = NULL
	,@PARAM12 VARCHAR(255) = NULL
	,@PARAM13 VARCHAR(255) = NULL
	,@PARAM14 VARCHAR(255) = NULL
	,@PARAM15 VARCHAR(255) = NULL
	,@PARAM16 VARCHAR(255) = NULL
	,@PARAM17 VARCHAR(255) = NULL
	,@PARAM18 VARCHAR(255) = NULL
	,@PARAM19 VARCHAR(255) = NULL
	,@PARAM20 VARCHAR(255) = NULL
	,@RETURN_TABLENAME_Id INT OUTPUT
AS
BEGIN
	DECLARE @TempTable TABLE (Id INT)

	/*
------------------------
 #####     ######        #    
#     #    #     #      # #   
#          #     #     #   #  
#          ######     #     # 
#          #   #      ####### 
#     #    #    #     #     # 
 #####     #     #    #     # 
------------------------
*/
	--FLOW: R0141: Registration Report Sub-flow 1 (BSC Party Registration)
	IF (@Flow_InsertFor = 'R0141')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'PD6')
		BEGIN
			INSERT INTO [dbo].[PD6_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BSCPartyDetails]
				,[ActionCode]
				,[BSCPartyName]
				,[BSCPartyId]
				--,[RRHId]
				)
			OUTPUT INSERTED.PD6_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				--,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'PR9')
		BEGIN
			INSERT INTO [dbo].[PR9_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[PartyRoleDetails]
				,[ActionCode]
				,[PartyType]
				,[RegistrationStatus]
				,[RegistrationEffectiveFromDate]
				,[RegistrationEffectiveToDate]
				--,[PD6Id]
				)
			OUTPUT INSERTED.PR9_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				--,@PARAM9
				)
		END

		IF (@Table_InsertFor = 'AU1')
		BEGIN
			INSERT INTO [dbo].[AU1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AuthorisedSignatories]
				,[ActionCode]
				,[SignatoryName]
				,[Password]
				,[ContactPhoneNo]
				,[EMailAddress]
				--,[PD6Id]
				)
			OUTPUT INSERTED.AU1_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				--,@PARAM9
				)
		END
	END

	--FLOW: R0142: Registration Report Sub-flow 2 (Interconnector Administor Registration)
	IF (@Flow_InsertFor = 'R0142')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		--IF (@Table_InsertFor = 'IAD')
		--BEGIN
		--	INSERT INTO [dbo].[IAD_V1] (
		--	  [FK_FileHeaderId]
		--	  ,[FK_FlowKeyId]
		--	  ,[InterconnectorAdministratorDetails]
		--	  ,[ActionCode]
		--	  ,[RegistrationStatus]
		--	  ,[InterconnectorAdministratorId]
		--		)
		--	OUTPUT INSERTED.IAD_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		)
		--END

		--IF (@Table_InsertFor = 'EI9')
		--BEGIN
		--	INSERT INTO [dbo].[EI9_V1] (
		--	  [FK_FileHeaderId]
		--	  ,[FK_FlowKeyId]
		--	  ,[InterconnectorDetails]
		--	  ,[ActionCode]
		--	  ,[InterconnectorId]
		--	  --,[IADId]
		--		)
		--	OUTPUT INSERTED.EI9_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		)
		--END
	END

	--FLOW: R0143: Registration Report Sub-flow 3 (BSC Party Registration)
	IF (@Flow_InsertFor = 'R0143')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
		--IF (@Table_InsertFor = 'AR3')
		--BEGIN
		--	INSERT INTO [dbo].[AR3] (
		--		[FK_FileHeaderId]
		--		,[AgentRoleDetails]
		--		,[ActionCode]
		--		,[AgentType]
		--		,[RegistrationStatus]
		--		,[RegistrationEffectiveFromDate]
		--		,[RegistrationEffectiveToDate]
		--		--,[RA4_V3Id]
		--		--,[AC1_V1Id]
		--		,[FK_FlowKeyId]
		--		)
		--	OUTPUT INSERTED.AR3_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		,@PARAM7
		--		,@PARAM8
		--		,@PARAM9
		--		,@PARAM10
		--		)
		--END

		--IF (@Table_InsertFor = 'RA4')
		--BEGIN
		--	INSERT INTO [dbo].[RA4_V3] (
		--		[FK_FileHeaderId]
		--		,[FK_FlowKeyId]
		--		,[RoleAddressDetails]
		--		,[ActionCode]
		--		,[AddressLine1]
		--		,[AddressLine2]
		--		,[AddressLine3]
		--		,[AddressLine4]
		--		,[AddressLine5]
		--		,[AddressLine6]
		--		,[AddressLine7]
		--		,[AddressLine8]
		--		,[AddressLine9]
		--		,[PostCode]
		--		,[TelephoneNo]
		--		,[FaxNo]
		--		,[EmailAddress]
		--		)
		--	OUTPUT INSERTED.RA4_V3Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		,@PARAM7
		--		,@PARAM8
		--		,@PARAM9
		--		,@PARAM10
		--		,@PARAM11
		--		,@PARAM12
		--		,@PARAM13
		--		,@PARAM14
		--		,@PARAM15
		--		,@PARAM16
		--		,@PARAM17
		--		)
		--END

		--IF (@Table_InsertFor = 'AC1')
		--BEGIN
		--	INSERT INTO [dbo].[AC1] (
		--		[FK_FileHeaderId]
		--		,[CertificationAccreditationDetails]
		--		,[ActionCode]
		--		,[CertificationAccreditationStatus]
		--		,[FK_FlowKeyId]
		--		)
		--	OUTPUT INSERTED.AC1_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		)
		--END

		--IF (@Table_InsertFor = 'AU1')
		--BEGIN
		--	INSERT INTO [dbo].[AU1] (
		--		[FK_FileHeaderId]
		--		,[AuthorisedSignatories]
		--		,[ActionCode]
		--		,[SignatoryName]
		--		,[Password]
		--		,[ContactPhoneNo]
		--		,[EmailAddress]
		--		--,[AU2_V1Id]
		--		,[FK_FlowKeyId]
		--		)
		--	OUTPUT INSERTED.AU1_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		,@PARAM7
		--		,@PARAM8
		--		,@PARAM9
		--		)
		--END

		--IF (@Table_InsertFor = 'AU2')
		--BEGIN
		--	INSERT INTO [dbo].[AU2] (
		--		[FK_FileHeaderId]
		--		,[AuthorisationLevels]
		--		,[ActionCode]
		--		,[Activity]
		--		,[EffectiveFromDate]
		--		,[EffectiveToDate]
		--		,[FK_FlowKeyId]
		--		)
		--	OUTPUT INSERTED.AU2_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		,@PARAM7
		--		)
		--END
	END

	--FLOW: R0144: Registration Report Sub-flow 4 (BSC Service Agent Registration)
	IF (@Flow_InsertFor = 'R0144')
	BEGIN
			IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
		--IF (@Table_InsertFor = 'SR4')
		--BEGIN
		--	INSERT INTO [dbo].[SR4_V1] (
		--		[FK_FileHeaderId]
		--		,[ServiceAgentRoleDetails]
		--		,[ActionCode]
		--		,[AgentType]
		--		,[RegistrationStatus]
		--		,[RegistrationEffectiveFromDate]
		--		,[RegistrationEffectiveToDate]
		--		--,[SA1_V1Id]
		--		,[FK_FlowKeyId]
		--		)
		--	OUTPUT INSERTED.SR4_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		,@PARAM7
		--		,@PARAM8
		--		,@PARAM9
		--		)
		--END

		--IF (@Table_InsertFor = 'SA1')
		--BEGIN
		--	INSERT INTO [dbo].[SA1_V1] (
		--		[FK_FileHeaderId]
		--		,[RoleAddressDetails]
		--		,[ActionCode]
		--		,[AddressLine1]
		--		,[AddressLine2]
		--		,[AddressLine3]
		--		,[AddressLine4]
		--		,[AddressLine5]
		--		,[AddressLine6]
		--		,[AddressLine7]
		--		,[AddressLine8]
		--		,[AddressLine9]
		--		,[PostCode]
		--		,[TelephoneNo]
		--		,[FaxNo]
		--		,[EmailAddress]
		--		,[FK_FlowKeyId]
		--		)
		--	OUTPUT INSERTED.SA1_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		,@PARAM7
		--		,@PARAM8
		--		,@PARAM9
		--		,@PARAM10
		--		,@PARAM11
		--		,@PARAM12
		--		,@PARAM13
		--		,@PARAM14
		--		,@PARAM15
		--		,@PARAM16
		--		,@PARAM17
		--		)
		--END
	END

	--FLOW: R0145_V5: Registration Report Sub-flow 5 (BM Unit Registration)
	IF (@Flow_InsertFor = 'R0145')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
		--IF (@Table_InsertFor = 'JB3')
		--BEGIN
		--	INSERT INTO [dbo].[JB3_V5] (
		--		[FK_FileHeaderId]
		--		,[BMUnitGroupMember]
		--		,[ActionCode]
		--		,[BMUnitId]
		--		,[FK_FlowKeyId]
		--		)
		--	OUTPUT INSERTED.JB3_V5Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		)
		--END
	END

	--FLOW: R0146_V1: Registration Report Sub-flow 6 (Trading Unit Registration)
	IF (@Flow_InsertFor = 'R0146')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		--IF (@Table_InsertFor = 'BU5')
		--BEGIN
		--	INSERT INTO [dbo].[BU5_V1] (
		--		[FK_FileHeaderId]
		--		,[FK_FlowKeyId]
		--		,[BMUnitDetails]
		--		,[ActionCode]
		--		,[BMUnitId]
		--		,[EffectiveFromDate]
		--		,[EffectiveToDate]
		--		)
		--	OUTPUT INSERTED.BU5_V1Id
		--	INTO @TempTable
		--	VALUES (
		--		@PARAM1
		--		,@PARAM2
		--		,@PARAM3
		--		,@PARAM4
		--		,@PARAM5
		--		,@PARAM6
		--		,@PARAM7
		--		)
		--END
	END

	--FLOW: R0147_V1: Registration Report Sub-flow 7 (Boundary Point Registration)
	IF (@Flow_InsertFor = 'R0147')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: R0148_V1: Registration Report Sub-flow 8 (Interconnector Registration)
	IF (@Flow_InsertFor = 'R0148')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: R0148_V1: Registration Report Sub-flow 9 (GSP Group Registration)
	IF (@Flow_InsertFor = 'R0149')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: R014A_V1: Registration Report Sub-flow 10 (GSP Registration)
	IF (@Flow_InsertFor = 'R014A')
	BEGIN
		IF (@Table_InsertFor = 'RR2')
		BEGIN
			INSERT INTO [dbo].[RR2_V1] (
			   [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RR2_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: R014B_V1: Registration Report Sub-flow 11 (Inter-GSP-Group Connection Registration)
	IF (@Flow_InsertFor = 'R014B')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: R014C_V1: Registration Report Sub-flow 12 (Metering System Registration)
	IF (@Flow_InsertFor = 'R014C')
	BEGIN
		IF (@Table_InsertFor = 'RRH')
		BEGIN
			INSERT INTO [dbo].[RRH_V5] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[RegistrationReportHeader]
			  ,[RequestingRegistrant]
			  ,[RegistrationType]
				)
			OUTPUT INSERTED.RRH_V5Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END


/*


	--FLOW: R0211: CRA-I021: Registered Sevice List
	IF (@Flow_InsertFor = 'R0211')
	BEGIN
		IF (@Table_InsertFor = 'SAD')
		BEGIN
			INSERT INTO [dbo].[SAD_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[RoleAddressDetails]
				,[AddressLine1]
				,[AddressLine2]
				,[AddressLine3]
				,[AddressLine4]
				,[AddressLine5]
				,[AddressLine6]
				,[AddressLine7]
				,[AddressLine8]
				,[AddressLine9]
				,[PostCode]
				,[Telephone No]
				,[FaxNo]
				,[EMail Address]
				)
			OUTPUT INSERTED.SAD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				,@PARAM13
				,@PARAM14
				,@PARAM15
				,@PARAM16
				)
		END

		IF (@Table_InsertFor = 'ACD')
		BEGIN
			INSERT INTO [dbo].[ACD] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[CertificationAccreditationDetails]
				,[CertificationAccreditationStatus]
				)
			OUTPUT INSERTED.ACD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				)
		END

		IF (@Table_InsertFor = 'RAD')
		BEGIN
			INSERT INTO [dbo].[RAD_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[RoleAddressDetails]
				,[AddressLine1]
				,[AddressLine2]
				,[AddressLine3]
				,[AddressLine4]
				,[AddressLine5]
				,[AddressLine6]
				,[AddressLine7]
				,[AddressLine8]
				,[AddressLine9]
				,[PostCode]
				,[Telephone No]
				,[FaxNo]
				,[EMail Address]
				)
			OUTPUT INSERTED.RAD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				,@PARAM13
				,@PARAM14
				,@PARAM15
				,@PARAM16
				)
		END

		IF (@Table_InsertFor = 'SRD')
		BEGIN
			INSERT INTO [dbo].[SRD_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ServiceAgentRoleDetails]
				,[AgentType]
				,[EffectiveFromDate]
				,[EffectiveToDate]
				,[SAD_V1Id]
				)
			OUTPUT INSERTED.SRD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'AR1')
		BEGIN
			INSERT INTO [dbo].[AR1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AgentRoleDetails]
				,[AgentType]
				,[EffectiveFromDate]
				,[EffectiveToDate]
				,[RAD_V1Id]
				,[ACD_V1Id]
				)
			OUTPUT INSERTED.AR1_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				)
		END
	END

	--FLOW: R0241: CRA-I024: Certification & Accreditation Report
	IF (@Flow_InsertFor = 'R0241')
	BEGIN
		IF (@Table_InsertFor = 'RA5')
		BEGIN
			INSERT INTO [dbo].[RA5_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[RoleAddressDetails]
				,[AddressLine1]
				,[AddressLine2]
				,[AddressLine3]
				,[AddressLine4]
				,[AddressLine5]
				,[AddressLine6]
				,[AddressLine7]
				,[AddressLine8]
				,[AddressLine9]
				,[PostCode]
				,[Telephone No]
				,[FaxNo]
				,[EMail Address]
				)
			OUTPUT INSERTED.RA5_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				,@PARAM13
				,@PARAM14
				,@PARAM15
				,@PARAM16
				)
		END

		IF (@Table_InsertFor = 'RD1')
		BEGIN
			INSERT INTO [dbo].[RD1_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ServiceAgentRoleDetails]
				,[ActionCode]
				,[AgentType]
				,[EffectiveFromDate]
				,[EffectiveToDate]
				,[RA5_V1Id]
				)
			OUTPUT INSERTED.RD1_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				)
		END

		IF (@Table_InsertFor = 'BS3')
		BEGIN
			INSERT INTO [dbo].[BS3_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BSCServiceAgentDetails]
				,[ActionCode]
				,[AgentName]
				,[AgentId]
				,[RD1_V1Id]
				)
			OUTPUT INSERTED.BS3_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'AC1')
		BEGIN
			INSERT INTO [dbo].[AC1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[CertificationAccreditationDetails]
				,[ActionCode]
				,[CertificationAccreditationStatus]
				)
			OUTPUT INSERTED.AC1_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'RA4')
		BEGIN
			INSERT INTO [dbo].[RA4_V3] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[RoleAddressDetails]
				,[AddressLine1]
				,[AddressLine2]
				,[AddressLine3]
				,[AddressLine4]
				,[AddressLine5]
				,[AddressLine6]
				,[AddressLine7]
				,[AddressLine8]
				,[AddressLine9]
				,[PostCode]
				,[TelephoneNo]
				,[FaxNo]
				,[EMailAddress]
				)
			OUTPUT INSERTED.RA4_V3Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				,@PARAM13
				,@PARAM14
				,@PARAM15
				,@PARAM16
				)
		END

		IF (@Table_InsertFor = 'AR4')
		BEGIN
			INSERT INTO [dbo].[AR4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AgentRoleDetails]
				,[ActionCode]
				,[AgentType]
				,[EffectiveFromDate]
				,[EffectiveToDate]
				,[RA4_V3Id]
				,[AC1_V1Id]
				)
			OUTPUT INSERTED.AR4_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				)
		END
	END

	----------------------------------------------------
	/*
#######     #####     #     #       #          #    
#          #     #    #     #      # #        # #   
#          #          #     #     #   #      #   #  
#####      #          #     #    #     #    #     # 
#          #           #   #     #######    ####### 
#          #     #      # #      #     #    #     # 
#######     #####        #       #     #    #     # 
                                                    
*/
	----------------------------------------------------
	--FLOW: E0291 ECVAA-I029: MVRN Acceptance Feedback
	IF (@Flow_InsertFor = 'E0291')
	BEGIN
		IF (@Table_InsertFor = 'MMV')
		BEGIN
			INSERT INTO [dbo].[MMV_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MatchedReallocations]
				,[SettlementPeriod]
				,[RecipientMVFixedReallocation]
				,[RecipientMVPercentageReallocation]
				,[CounterpartyMVFixedReallocation]
				,[CounterpartyMVPercentageReallocation]
				,[MatchedMVFixedReallocation]
				,[MatchedMVPercentageReallocation]
				)
			OUTPUT INSERTED.MMV_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				)
		END

		IF (@Table_InsertFor = 'MMR')
		BEGIN
			INSERT INTO [dbo].[MMR_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MatchedReallocationDates]
				,[SettlementDate]
				,[MMV_V2Id]
				)
			OUTPUT INSERTED.MMR_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'MV2')
		BEGIN
			INSERT INTO [dbo].[MV2_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRreallocations]
				,[SettlementPeriod]
				,[MeteredVolumeFixedReallocation]
				,[MeteredVolumePercentageReallocation]
				)
			OUTPUT INSERTED.MV2_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END
	END

	--FLOW: E0281: ECVN Acceptance Feedback
	IF (@Flow_InsertFor = 'E0281')
	BEGIN
		IF (@Table_InsertFor = 'CD9')
		BEGIN
			INSERT INTO [dbo].[CD9] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[EnergyContractVolumes]
				,[SettlementPeriod]
				,[energycontractvolume]
				)
			OUTPUT INSERTED.CD9_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'MEC')
		BEGIN
			INSERT INTO [dbo].[MEC_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MatchedContractVolumes]
				,[SettlementPeriod]
				,[RecipientContractVolume]
				,[CounterpartyContractVolume]
				,[MatchedContractVolume]
				)
			OUTPUT INSERTED.MEC_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'MER')
		BEGIN
			INSERT INTO [dbo].[MER_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MatchedContractDates]
				,[SettlementDate]
				,[MEC_V2Id]
				)
			OUTPUT INSERTED.MER_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: E0221: Forward Contract Report: Sub-flow 1
	IF (@Flow_InsertFor = 'E0221')
	BEGIN
		IF (@Table_InsertFor = 'MVP')
		BEGIN
			INSERT INTO [dbo].[MVP_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRNPeriodData]
				,[FromSettlementPeriod]
				,[ToSettlementPeriod]
				,[MeteredVolumeFixedReallocation]
				,[MeteredVolumePercentageReallocation]
				)
			OUTPUT INSERTED.MVP_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'MDD')
		BEGIN
			INSERT INTO [dbo].[MDD_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRNdetaildata]
				,[MVRNEffectiveFromDate]
				,[MVRNEffectiveToDate]
				,[MVRNAId]
				,[MVRNAAId]
				,[MVRNAAEffectiveFromDate]
				,[MVRNAA EffectiveToDate]
				,[MVP_V2Id]
				)
			OUTPUT INSERTED.MDD_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				)
		END

		IF (@Table_InsertFor = 'MVD')
		BEGIN
			INSERT INTO [dbo].[MVD_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRNdata]
				,[MVRNMVRNAAId]
				,[MVRNReferenceCode]
				,[MDD_V2Id]
				)
			OUTPUT INSERTED.MVD_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END

		IF (@Table_InsertFor = 'OMD')
		BEGIN
			INSERT INTO [dbo].[OMD_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[OriginatorMVRNAAdata]
				,[MVRNAAId]
				,[MVRNAId]
				,[BMUnitId]
				,[LeadorSubsidiaryIndicator]
				,[OtherBSCPartyId]
				,[OtherBSCPartyPCFlag]
				,[MVRNAAEffectiveFromDate]
				,[MVRNAAEffectiveToDate]
				,[MVD_V2Id]
				)
			OUTPUT INSERTED.OMD_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				)
		END

		IF (@Table_InsertFor = 'ECP')
		BEGIN
			INSERT INTO [dbo].[ECP_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ECVNPeriodData]
				,[FromSettlementPeriod]
				,[ToSettlementPeriod]
				,[EnergyContractVolume]
				)
			OUTPUT INSERTED.ECP_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END

		IF (@Table_InsertFor = 'ECD')
		BEGIN
			INSERT INTO [dbo].[ECD_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ECVNData]
				,[ECVNECVNAAId]
				,[ECVNReferenceCode]
				,[EDD_V2Id]
				)
			OUTPUT INSERTED.ECD_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END

		IF (@Table_InsertFor = 'EDD')
		BEGIN
			INSERT INTO [dbo].[EDD_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ECVNDetailData]
				,[ECVNEffectiveFromDate]
				,[ECVNEffectiveToDate]
				,[ECVNAId]
				,[ECVNAAId]
				,[ECVNAAEffectiveFromDate]
				,[ECVNAAEffectiveToDate]
				,[ECP_V2Id]
				)
			OUTPUT INSERTED.EDD_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				)
		END

		IF (@Table_InsertFor = 'OED')
		BEGIN
			INSERT INTO [dbo].[OED_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[OriginatorECVNAAData]
				,[ECVNAAId]
				,[ECVNAId]
				,[ECVNAABSCPartySequence]
				,[OtherBSCPartyId]
				,[OtherBSCPartyPCFlag]
				,[ECVNAAEffectiveFromDate]
				,[ECVNAAEffectiveToDate]
				,[ECD_V2Id]
				)
			OUTPUT INSERTED.OED_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				)
		END

		IF (@Table_InsertFor = 'EAC')
		BEGIN
			INSERT INTO [dbo].[EAC_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[EnergyAccountData]
				,[ProductionConsumptionFlag]
				,[OED_V2Id]
				,[OMD_V2Id]
				)
			OUTPUT INSERTED.EAC_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END
	END

	--FLOW: E0141: Notification Report
	IF (@Flow_InsertFor = 'E0141')
	BEGIN
		IF (@Table_InsertFor = 'CL9')
		BEGIN
			INSERT INTO [dbo].[CL9_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[CreditLimitWarningData]
				,[BSCPartyId]
				,[BSCPartyName]
				)
			OUTPUT INSERTED.CL9_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'ACT')
		BEGIN
			INSERT INTO [dbo].[Act_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AccountEnergyDatabyBMUType]
				,[FPNDerivedAccountPeriodCACreditedEnergyVolume]
				,[FPNDerivedAccountCumulativeCACreditedEnergyVolume]
				,[NonFPNDerivedAccountPeriodCACreditedEnergyVolume]
				,[NonFPNDerivedAccountCumulativeCACreditedEnergyVolume]
				)
			OUTPUT INSERTED.ACT_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'ACE')
		BEGIN
			INSERT INTO [dbo].[ACE] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AccountEnergyData]
				,[ProductionConsumptionFlag]
				,[AccountPeriodCACreditedEnergyVolume]
				,[AccountPeriodEnergyContractVolume]
				,[AccountCumulativeCACreditedEnergyVolume]
				,[AccountCumulativeEnergyContractVolume]
				,[ACT_V4Id]
				)
			OUTPUT INSERTED.ACE_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				)
		END

		IF (@Table_InsertFor = 'CAT')
		BEGIN
			INSERT INTO [dbo].[CAT_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[CACreditedEnergyVolumebyBMUType]
				,[FPNDerivedCreditAssessmentCreditedEnergyVolume]
				,[NonFPNDerivedCreditAssessmentCreditedEnergyVolume]
				)
			OUTPUT INSERTED.CAT_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'IDD')
		BEGIN
			INSERT INTO [dbo].[IDD_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[IndebtednessData]
				,[CreditedEnergyVolume]
				,[AggregatedEnergyContractVolume]
				,[CumulativeCAEnergyIndebtedness]
				,[EnergIndebtedness]
				,[CreditCoverPercentage]
				,[CreditLimit]
				,[CAT_V4Id]
				,[ACE_V4Id]
				)
			OUTPUT INSERTED.IDD_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				)
		END

		IF (@Table_InsertFor = 'MV9')
		BEGIN
			INSERT INTO [dbo].[MV9_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRNData]
				,[MVRNMVRNAAId]
				,[MVRNReferenceCode]
				,[MeteredVolumeFixedReallocation]
				,[MeteredVolumePercentageReallocation]
				,[MVRNAId]
				,[MVRNAAId]
				,[BMUnitId]
				,[LeadPartyId]
				,[LeadPartyName]
				,[LeadPartyProductionConsumptionFlag]
				,[SubsidiaryPartyId]
				,[SubsidiaryPartyName]
				,[SubsidiaryPartyProductionConsumptionFlag]
				)
			OUTPUT INSERTED.MV9_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				,@PARAM13
				,@PARAM14
				,@PARAM15
				,@PARAM16
				)
		END

		IF (@Table_InsertFor = 'ECN')
		BEGIN
			INSERT INTO [dbo].[ECN_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ECVNData]
				,[ECVNECVNAAId]
				,[ECVNReferenceCode]
				,[EnergyContractVolume]
				,[ECVNAId]
				,[ECVNAAId]
				,[ECVParty1Id]
				,[ECVParty1Name]
				,[ECVParty1PCFlag]
				,[ECVParty2Id]
				,[ECVParty2Name]
				,[ECVParty2PCFlag]
				)
			OUTPUT INSERTED.ECN_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				,@PARAM13
				,@PARAM14
				)
		END

		IF (@Table_InsertFor = 'SP8')
		BEGIN
			INSERT INTO [dbo].[SP8_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[SettlementPeriodData]
				,[SettlementPeriod]
				,[ECN_V4Id]
				,[MV9_V4Id]
				,[IDD_V4Id]
				)
			OUTPUT INSERTED.SP8_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'MEI')
		BEGIN
			INSERT INTO [dbo].[MEI_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MeteredEnergyIndebtednesDates]
				,[FromSettlementDate]
				,[ToSettlementDate]
				)
			OUTPUT INSERTED.MEI_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'AED')
		BEGIN
			INSERT INTO [dbo].[AED] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ActualEnergyIndebtednessDates]
				,[FromSettlementDate]
				,[ToSettlementDate]
				)
			OUTPUT INSERTED.AED_V3Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'DSI')
		BEGIN
			INSERT INTO [dbo].[DSI_V4] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[DayStartIndebtednessData]
				,[ActualEnergyIndebtedness]
				,[MeteredEnergyIndebtedness]
				,[CumulativeCAEnergyIndebtedness]
				,[AED_V3Id]
				,[MEI_V4Id]
				)
			OUTPUT INSERTED.DSI_V4Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				)
		END
	END

	--FLOW: E0132: Authorisation Report: Sub-flow 2
	IF (@Flow_InsertFor = 'E0132')
	BEGIN
		IF (@Table_InsertFor = 'MOD')
		BEGIN
			INSERT INTO [dbo].[MOD_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRNAAOptionalDetails]
				,[MVRNAId2]
				,[MVRNAName2]
				,[ReportRequirement]
				)
			OUTPUT INSERTED.MOD_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END

		IF (@Table_InsertFor = 'MAA')
		BEGIN
			INSERT INTO [dbo].[MAA_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRNAA]
				,[MVRNAId]
				,[MVRNAName]
				,[EffectiveFromDate]
				,[EffectiveToDate]
				,[MVRNAAId]
				,[MOD_V2Id]
				)
			OUTPUT INSERTED.MAA_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				)
		END

		IF (@Table_InsertFor = 'MAH')
		BEGIN
			INSERT INTO [dbo].[MAH_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRNAHeader]
				,[ReportStartDate]
				,[ReportEndDate]
				)
			OUTPUT INSERTED.MAH_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: E0131: Authorisation Report: Sub-flow 1
	IF (@Flow_InsertFor = 'E0131')
	BEGIN
		IF (@Table_InsertFor = 'EOD')
		BEGIN
			INSERT INTO [dbo].[EOD_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ECVNAAOptionalDetails]
				,[ECVNAId2]
				,[ECVNAName2]
				,[ReportRequirement]
				)
			OUTPUT INSERTED.EOD_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END

		IF (@Table_InsertFor = 'EAA')
		BEGIN
			INSERT INTO [dbo].[EAA_V2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ECVNAA]
				,[ECVNAId]
				,[ECVNAName]
				,[EffectiveFromDate]
				,[EffectiveToDate]
				,[ECVNAAId]
				,[EOD_V2Id]
				)
			OUTPUT INSERTED.EAA_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				)
		END
	END

	--FLOW: E0101: MVRN Feedback
	IF (@Flow_InsertFor = 'E0101')
	BEGIN
		IF (@Table_InsertFor = 'MV8')
		BEGIN
			INSERT INTO [dbo].[MV8_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MVRreallocations]
				,[SettlementPeriod]
				,[MeteredVolumeFixedReallocation]
				,[MeteredVolumePercentageReallocation]
				)
			OUTPUT INSERTED.MV8_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END
	END

	--FLOW: E0091: ECVN Feedback
	IF (@Flow_InsertFor = 'E0091')
	BEGIN
		IF (@Table_InsertFor = 'CD2')
		BEGIN
			INSERT INTO [dbo].[CD2] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[EnergyContractDayvolumes]
				,[SettlementPeriod]
				,[EnergyContractVolume]
				)
			OUTPUT INSERTED.CD2_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	-----------------------------------------
	/*
 #####     ######      #####        #    
#     #    #     #    #     #      # #   
#          #     #    #           #   #  
#          #     #    #          #     # 
#          #     #    #          ####### 
#     #    #     #    #     #    #     # 
 #####     ######      #####     #     # 
*/
	-----------------------------------------
	--FLOW: C0101 CDCA-I010: Exception Report for Missing and Invalid Meter Period Data
	IF (@Flow_InsertFor = 'C0101')
	BEGIN
		IF (@Table_InsertFor = 'SPE')
		BEGIN
			INSERT INTO [dbo].[SPE_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[SettlementPeriodExceptions]
				,[SettlementPeriod]
				,[MeterReadingVolume]
				,[MeterReadingStatus]
				,[ExceptionDescription]
				)
			OUTPUT INSERTED.SPE_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'CND')
		BEGIN
			INSERT INTO [dbo].[CND_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ChannelData]
				,[ChannelNumber]
				,[MeasurementQuantity]
				,[MainCheckIndicator]
				,[SPE_V1]
				)
			OUTPUT INSERTED.CND_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'OSD')
		BEGIN
			INSERT INTO [dbo].[OSD_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[OutstationData]
				,[OutstationId]
				,[CND_V1Id]
				)
			OUTPUT INSERTED.OSD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'SDE')
		BEGIN
			INSERT INTO [dbo].[SDE_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[SettlementDateExceptions]
				,[SettlementDate]
				,[OSD_V1Id]
				)
			OUTPUT INSERTED.SDE_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'MSE')
		BEGIN
			INSERT INTO [dbo].[MSE_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MeteringSystemExceptions]
				,[MeteringSystemId]
				,[SDE_V1Id]
				)
			OUTPUT INSERTED.MSE_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: C0121 CDCA-I012: Report Raw Meter Data
	IF (@Flow_InsertFor = 'C0121')
	BEGIN
		IF (@Table_InsertFor = 'RMP')
		BEGIN
			INSERT INTO [dbo].[RMP_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[RawMeterPeriodData]
				,[SettlementPeriod]
				,[MeterReadingVolume]
				,[MeterReadingStatus]
				)
			OUTPUT INSERTED.RMP_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END

		IF (@Table_InsertFor = 'CN9')
		BEGIN
			INSERT INTO [dbo].[CN9_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ChannelData]
				,[ChannelNumber]
				,[MeasurementQuantity]
				,[MainCheckIndicator]
				,[RMP_V1Id]
				)
			OUTPUT INSERTED.CN9_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'OS9')
		BEGIN
			INSERT INTO [dbo].[OS9_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[OutstationData]
				,[OutstationId]
				,[CN9_V1Id]
				)
			OUTPUT INSERTED.OS9_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'MS9')
		BEGIN
			INSERT INTO [dbo].[MS9_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MeteringSystemData]
				,[SettlementDate]
				,[OS9_V1Id]
				)
			OUTPUT INSERTED.MS9_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'RMD')
		BEGIN
			INSERT INTO [dbo].[RMD_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ReportRawMeterData]
				,[MeteringSystemId]
				,[MS9_V4Id]
				)
			OUTPUT INSERTED.RMD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: C0141 CDCA-I014: Estimated Data Report
	IF (@Flow_InsertFor = 'C0141')
	BEGIN
		IF (@Table_InsertFor = 'RM9')
		BEGIN
			INSERT INTO [dbo].[RM9_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[EstimatedMeterData]
				,[SettlementPeriod]
				,[OriginalMeterReading]
				,[EstimatedMeterVolume]
				,[EstimationMethod]
				,[EstimateAgreedIndicator]
				)
			OUTPUT INSERTED.RM9_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				)
		END

		IF (@Table_InsertFor = 'CN1')
		BEGIN
			INSERT INTO [dbo].[CN1_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ChannelData]
				,[ChannelNumber]
				,[MeterSerialNumber]
				,[MeasurementQuantity]
				,[RM9_V1Id]
				)
			OUTPUT INSERTED.CN1_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END

		IF (@Table_InsertFor = 'OS1')
		BEGIN
			INSERT INTO [dbo].[OS1_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[OutstationData]
				,[OutstationId]
				,[CN1_V1Id]
				)
			OUTPUT INSERTED.OS1_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'RMY')
		BEGIN
			INSERT INTO [dbo].[RMY_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[RawMeterDayData]
				,[SettlementDate]
				,[OS1_V1Id]
				)
			OUTPUT INSERTED.RMY_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'RM8')
		BEGIN
			INSERT INTO [dbo].[RM8_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[ReportRawMeterData]
				,[MeteringSystemId]
				,[RMY_V1Id]
				)
			OUTPUT INSERTED.RM8_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END

	--FLOW: C0291 CDCA-I029: Aggregated GSP Group Take Volumes
	IF (@Flow_InsertFor = 'C0291')
	BEGIN
		IF (@Table_InsertFor = 'AGP')
		BEGIN
			INSERT INTO [dbo].[AGP] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AggregatedGSPGroupTakePeriod]
				,[SettlementPeriod]
				,[EstimateIndicator]
				,[ImportExportIndicator]
				,[GSPGroupTakeVolume]
				)
			OUTPUT INSERTED.AGP_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END
	END

	--FLOW: C0411 CDCA-I041: Interconnector Aggregation Report
	IF (@Flow_InsertFor = 'C0411')
	BEGIN
		IF (@Table_InsertFor = 'AIV')
		BEGIN
			INSERT INTO [dbo].[AIV_V2] (
			  [FK_FileHeaderId]
			  ,[FK_FlowKeyId]
			  ,[InterconnectorAggregationReport]
			  ,[InterconnectorId]
			  ,[SettlementDate]
			  ,[SettlementRunType]
			  ,[CDCARunNumber]
			  ,[DateofAggregation]
				)
			OUTPUT INSERTED.AIV_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				)
		END
	END

	--FLOW: C0421 CDCA-I042: BM Unit Aggregation Report
	IF (@Flow_InsertFor = 'C0421')
	BEGIN
		IF (@Table_InsertFor = 'ABP')
		BEGIN
			INSERT INTO [dbo].[ABP] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUnitVolumePeriod]
				,[BMUnitId]
				,[EstimateIndicator]
				,[MeterVolume]
				,[ImportExportIndicator]
				)
			OUTPUT INSERTED.ABP_V2Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				)
		END
	END

	--FLOW: C0541 CDCA-I054: Meter Status Report
	IF (@Flow_InsertFor = 'C0541')
	BEGIN
		IF (@Table_InsertFor = 'DOP')
		BEGIN
			INSERT INTO [dbo].[DOP_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[DataOutsideLimitsPeriodData]
				,[SettlementPeriod]
				,[MeterVolume]
				)
			OUTPUT INSERTED.DOP_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'DOL')
		BEGIN
			INSERT INTO [dbo].[DOL_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[DataOutsideLimits]
				,[OutstationId]
				,[MeterSerialNumber]
				,[MeterRegisterID]
				,[ChannelNumber]
				,[MeteringSubsystemID]
				,[MeasurementQuantity]
				,[MinimumOutstationChannelLimit]
				,[MaximumOutstationChannelLimit]
				,[DOP_V1Id]
				)
			OUTPUT INSERTED.DOL_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				)
		END

		IF (@Table_InsertFor = 'PSP')
		BEGIN
			INSERT INTO [dbo].[PSP_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[PrimarySecondaryPeriodData]
				,[SettlementPeriod]
				,[MeterReadingDifference]
				,[PercentageofPrimaryReading]
				)
			OUTPUT INSERTED.PSP_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				)
		END

		IF (@Table_InsertFor = 'PSD')
		BEGIN
			INSERT INTO [dbo].[PSD_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[PrimarySecondaryDiscrepancies]
				,[OutstationId]
				,[ChannelNumber]
				,[SecondaryOutstationId]
				,[SecondaryChannelNumber]
				,[MeterSerialNumber]
				,[MeterRegisterID]
				,[MeteringSubsystemID]
				,[MeasurementQuantity]
				,[PSP_V1Id]
				)
			OUTPUT INSERTED.PSD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				)
		END

		IF (@Table_InsertFor = 'MCD')
		BEGIN
			INSERT INTO [dbo].[MCD_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MainCheckDiscrepancies]
				,[OutstationId]
				,[Meter Serial Number]
				,[MeterRegisterID]
				,[ChannelNumber]
				,[CheckOutstationId]
				,[CheckMeterSerialNumber]
				,[CheckMeterRegisterID]
				,[CheckChannelNumber]
				,[MeteringSubsystemID]
				,[MeasurementQuantity]
				,[MeterReadingDifference]
				,[PercentageofMainReading]
				)
			OUTPUT INSERTED.MCD_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				,@PARAM11
				,@PARAM12
				,@PARAM13
				,@PARAM14
				,@PARAM15
				)
		END

		IF (@Table_InsertFor = 'OSA')
		BEGIN
			INSERT INTO [dbo].[OSA_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[OutstationAlarms]
				,[OutstationId]
				,[ChannelNumber]
				,[OutstationAlarmCode]
				,[FromSettlementPeriod]
				,[ToSettlementPeriod]
				)
			OUTPUT INSERTED.OSA_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				)
		END

		IF (@Table_InsertFor = 'ODF')
		BEGIN
			INSERT INTO [dbo].[ODF_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[OutstationDownloadFailures]
				,[OutstationId]
				,[Dayssincelastsuccessfuloutstationdownload]
				)
			OUTPUT INSERTED.ODF_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END

		IF (@Table_InsertFor = 'MSX')
		BEGIN
			INSERT INTO [dbo].[MSX_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MeteringSystemExceptions]
				,[MeteringSystemId]
				,[MeteringEquipmentLocation]
				,[ODF_V1Id]
				,[OSA_V1Id]
				,[MCD_V1Id]
				,[PSD_V1Id]
				,[DOL_V1Id]
				)
			OUTPUT INSERTED.MSX_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				,@PARAM6
				,@PARAM7
				,@PARAM8
				,@PARAM9
				,@PARAM10
				)
		END

		IF (@Table_InsertFor = 'PD8')
		BEGIN
			INSERT INTO [dbo].[PD8_V1] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BSCPartyDetails]
				,[BSCPartyId]
				,[MSX_V1Id]
				)
			OUTPUT INSERTED.PD8_V1Id
			INTO @TempTable
			VALUES (
				@PARAM1
				,@PARAM2
				,@PARAM3
				,@PARAM4
				,@PARAM5
				)
		END
	END
	*/
	SET @RETURN_TABLENAME_Id = (
			SELECT Id
			FROM @TempTable
			)
END

RETURN
GO


