/*
This SP is used by outgoing packages
Example call: Where (@FileHeaderId) is an input field to be mapped, (output) is an output field to be mapped and ('10' or any number) is a placeholder.
EXECUTE [dbo].[SP_InsertTable_SSIS] '0141','SP9', ?,?,?,?,'5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20',? OUTPUT
*/
CREATE PROCEDURE [dbo].[SP_GetTable_SSIS] @Flow VARCHAR(5)
	,@Table VARCHAR(3)
	,@FileHeaderId INT
AS
--FLOW: R0011: 
IF (@Flow = 'R0011') --OK
BEGIN
	IF (@Table = 'SPT')
	BEGIN
		SELECT [Stage2ParticipantDetails]
			,[Stage2ParticipantId]
		FROM [dbo].[SPT_V1]
		WHERE FK_FileHeaderId = @FileHeaderId
	END

	IF (@Table = 'SR2')
	BEGIN
		SELECT [SettlementReportDetails]
			,[ReportType]
			,[DistributionMethod]
		FROM [dbo].[SR2_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'IE3')
	BEGIN
		SELECT [InterconnectorErrorAdministratorDetails]
			,[InterconnectorId]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[IE3_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'RA2')
	BEGIN
		SELECT [InterconnectorErrorAdministratorDetails]
			,[InterconnectorId]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[IE3_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'PD5')
	BEGIN
		SELECT [BSCPartyDetails]
			,[ActionDescription]
			,[PartyAuthenticationName]
			,[PartyAuthenticationPassword]
			,[BSCPartyName]
			,[BSCPartyId]
			,[PartyAuthenticationKeyDetails]
			--,[PRD_V1Id]
			--,[SPT_V1Id]
			--,[AUS_V1Id]
			--,[SR2_V1Id]
			--,[IE3_V1Id]
		FROM [dbo].[PD5_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'AUS')
	BEGIN
		SELECT [AuthorisedSignatories]
			,[SignatoryName]
			,[Password]
			,[ContactPhoneNo]
			,[EmailAddress]
		FROM [dbo].[AUS]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'PRD')
	BEGIN
		SELECT [PartyRoleDetails]
			,[PartyType]
			,CONCAT (
				FORMAT([RegistrationEffectiveFromDate], 'yyyy')
				,FORMAT([RegistrationEffectiveFromDate], 'MM')
				,FORMAT([RegistrationEffectiveFromDate], 'dd')
				,FORMAT([RegistrationEffectiveFromDate], 'hh')
				,FORMAT([RegistrationEffectiveFromDate], 'mm')
				,FORMAT([RegistrationEffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([RegistrationEffectiveToDate], 'yyyy')
				,FORMAT([RegistrationEffectiveToDate], 'MM')
				,FORMAT([RegistrationEffectiveToDate], 'dd')
				,FORMAT([RegistrationEffectiveToDate], 'hh')
				,FORMAT([RegistrationEffectiveToDate], 'mm')
				,FORMAT([RegistrationEffectiveToDate], 'ss')
				)
		FROM [dbo].[PRD_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'AUL')
	BEGIN
		SELECT [AuthorisationLevels]
			,[Activity]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[AUL]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END
END

--FLOW: R0021: 
IF (@Flow = 'R0021')
BEGIN
	IF (@Table = 'IA2')
	BEGIN
		SELECT FK_FileHeaderId
			,InterconnectorAdministratoDetails
			,ActionDescription
			,PartyAuthenticationName
			,PartyAuthenticationPassword
			,InterconnectorAdministratorId
		FROM [dbo].[IA2_V1]
		WHERE FK_FileHeaderId = @FileHeaderId
	END

	IF (@Table = 'EIC')
	BEGIN
		SELECT [InterconnectorDetails]
			,[InterconnectorId]
		FROM [dbo].[EIC_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'IE2')
	BEGIN
		SELECT [InterconnectorErrorAdministratorData]
			,[InterconnectorErrorAdministratorId]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[IE2_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END
END

--FLOW: R0031: 
IF (@Flow = 'R0031')
BEGIN
	IF (@Table = 'RA3')
	BEGIN
		SELECT [RoleAddressDetails]
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
			,[EmailAddress]
		FROM [dbo].[RA3_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'ACD')
	BEGIN
		SELECT [CertificationAccreditationDetails]
			,[CertificationAccreditationStatus]
		FROM [dbo].[ACD]
		WHERE FK_FileHeaderId = @FileHeaderId
	END

	IF (@Table = 'AUL')
	BEGIN
		SELECT [AuthorisationLevels]
			,[Activity]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[AUL]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'BA2')
	BEGIN
		SELECT [BSCPartyAgentDetails]
			,[ActionDescription]
			,[PartyAuthenticationName]
			,[PartyAuthenticationPassword]
			,[AgentName]
		FROM [dbo].[BA2]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'ARD')
	BEGIN
		SELECT [AgentRoleDetails]
			,[AgentType]
			,[RegistrationEffectiveFromDate]
			,CONCAT (
				FORMAT([RegistrationEffectiveFromDate], 'yyyy')
				,FORMAT([RegistrationEffectiveFromDate], 'MM')
				,FORMAT([RegistrationEffectiveFromDate], 'dd')
				,FORMAT([RegistrationEffectiveFromDate], 'hh')
				,FORMAT([RegistrationEffectiveFromDate], 'mm')
				,FORMAT([RegistrationEffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([RegistrationEffectiveToDate], 'yyyy')
				,FORMAT([RegistrationEffectiveToDate], 'MM')
				,FORMAT([RegistrationEffectiveToDate], 'dd')
				,FORMAT([RegistrationEffectiveToDate], 'hh')
				,FORMAT([RegistrationEffectiveToDate], 'mm')
				,FORMAT([RegistrationEffectiveToDate], 'ss')
				)
		FROM [dbo].[ARD]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'AUS')
	BEGIN
		SELECT [AuthorisedSignatories]
			,[SignatoryName]
			,[Password]
			,[ContactPhoneNo]
			,[EmailAddress]
		FROM [dbo].[AUS]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END
END

--FLOW: R0051: 
IF (@Flow = 'R0051')
BEGIN
	IF (@Table = 'JBB')
	BEGIN
		SELECT [BMUnitGroupMember]
			,[BMUnitId]
		FROM [dbo].[JBB_V2]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'BR2')
	BEGIN
		SELECT [BMUnitRegistrationHeader]
			,[ActionDescription]
			,[PartyAuthenticationName]
			,[PartyAuthenticationpassword]
		FROM [dbo].[BR2_V2]
		WHERE FK_FileHeaderId = @FileHeaderId
	END

	IF (@Table = 'ARD')
	BEGIN
		SELECT [BMUnitGroupDetails]
			,[JointBMUnitId]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[JB1_V2]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'BU1')
	BEGIN
		SELECT [BMUnitDetails]
			,[BMUnitName]
			,[BU1_V2].[BMUnitId]
			,[BMUnitType]
			,[NGCBMUnitName]
			,[Zone]
			,[NationalGridReference]
			,[GSPGroupId]
			,[GenerationCapacity]
			,[DemandCapacity]
			,[ProductionConsumptionFlag]
			,IIF(ISNULL([BaseTUFlag], 0) = 0, '', '') AS [BaseTUFlag]
			,[FPNFlag]
			,[InterconnectorId]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[BU1_V2]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END
END

--FLOW: R0061: 
IF (@Flow = 'R0061')
BEGIN
	IF (@Table = 'TR1')
	BEGIN
		SELECT [TradingUnitRegistrationHeader]
			,[ActionDescription]
			,[PartyAuthenticationName]
			,[PartyAuthenticationpassword]
		FROM [dbo].[TR1_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'BU2')
	BEGIN
		SELECT [BMUnitDetails]
			,[BMUnitId]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[BU2_V1]
		WHERE FK_FileHeaderId = @FileHeaderId
	END

	IF (@Table = 'TU1')
	BEGIN
		SELECT [TradingUnitDetails]
			,[TradingUnitName]
		FROM [dbo].[TU1_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END
END

--FLOW: R0071: 
IF (@Flow = 'R0071')
BEGIN
	IF (@Table = 'MSG')
	BEGIN
		SELECT [MessageDetails]
			,[ActionDescription]
			,[AuthorisedSignatory]
			,[Password]
		FROM [dbo].[MSG_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'BU2')
	BEGIN
		SELECT [PointDetails]
			,[PointId]
			,[PointType]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[BP2]
		WHERE FK_FileHeaderId = @FileHeaderId
	END
END

--FLOW: E0021: 
IF (@Flow = 'E0021')
BEGIN
	IF (@Table = 'CPD')
	BEGIN
		SELECT [CounterPartyDetails]
			,[ECVParty1Id]
			,[ECVParty1Name]
			,[ECVParty1ProductionConsumptionFlag]
			,[ECVParty2Id]
			,[ECVParty2Name]
			,[ECVParty2ProductionConsumptionFlag]
		FROM [dbo].[CPD_V4]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'EAR')
	BEGIN
		SELECT [ECVNAARequest]
			,[AuthorizationChange] --This is NOT NULL
			,[ECVNAId]
			,[ECVNAName]
			,[ECVNAId2]
			,[ECVNAName2]
			,[ECVNAAId]
			,IIF(ISNULL([AssociatedVNNRIndicator], 0) = 0, '', '') AS [AssociatedVNNRIndicator]
			,[ReportRequirement]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
			,[NotificationAmendmentType]
			,CONCAT (
				FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'yyyy')
				,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'MM')
				,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'dd')
				,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'hh')
				,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'mm')
				,FORMAT([NotificationAmendmentTypeEffectiveFromDate], 'ss')
				)
		FROM [dbo].[EAR_V4]
		WHERE FK_FileHeaderId = @FileHeaderId
	END
END

--FLOW: E0031: 
IF (@Flow = 'E0031')
BEGIN
	IF (@Table = 'LSD')
	BEGIN
		SELECT [LeadSubsidiaryPartyPairDetails]
			,[BMUnitId]
			,[LeadPartyId]
			,[LeadPartyName]
			,[LeadPartyProductionConsumptionFlag]
			,[SubsidiaryPartyId]
			,[SubsidiaryPartyName]
			,[SubsidiaryPartyProductionConsumptionFlag]
		FROM [dbo].[LSD_V3]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'MAR')
	BEGIN
		SELECT [MeterVolumeReallocations]
			,[MVRNAId]
			,[MVRNAName]
			,[MVRNAId2]
			,[MVRNAName2]
			,[MVRNAAId]
			,IIF(ISNULL([AssociatedVNNRIndicator], 0) = 0, '', '') AS [AssociatedVNNRIndicator]
			,[ReportRequirement]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[MAR_V3]
		WHERE FK_FileHeaderId = @FileHeaderId
	END
END

--FLOW: E0041: 
IF (@Flow = 'E0041')
BEGIN
	IF (@Table = 'OTD')
	BEGIN
		SELECT [OmittedDataNoChange]
			,[NoChangetoExistingData] --This is NOT NULL
		FROM [dbo].[OTD_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'CD9')
	BEGIN
		SELECT [EnergyContractVolumes]
			,[SettlementPeriod]
			,[energycontractvolume]
		FROM [dbo].[CD9]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'EDN')
	BEGIN
		SELECT [ECVNs]
			,[ECVNAAId]
			,[ECVNAAKey]
			,[ECVNECVNAAId]
			,[ECVNReferenceCode]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[EDN_V1]
		WHERE FK_FileHeaderId = @FileHeaderId
	END
END

--FLOW: E0051: 
IF (@Flow = 'E0051')
BEGIN
	IF (@Table = 'OTD')
	BEGIN
		SELECT [OmittedDataNoChange]
			,[NoChangetoExistingData]
		FROM [dbo].[OTD_V1]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'MV2')
	BEGIN
		SELECT [MVRreallocations]
			,[SettlementPeriod]
			,[MeteredVolumeFixedReallocation]
			,[MeteredVolumePercentageReallocation]
		FROM [dbo].[MV2_V2]
		WHERE [FK_FileHeaderId] = @FileHeaderId
	END

	IF (@Table = 'MVN')
	BEGIN
		SELECT [MVRNs]
			,[MVRNAAId]
			,[MVRNAAkey]
			,[MVRNMVRNAAId]
			,[MVRNReferenceCode]
			,CONCAT (
				FORMAT([EffectiveFromDate], 'yyyy')
				,FORMAT([EffectiveFromDate], 'MM')
				,FORMAT([EffectiveFromDate], 'dd')
				,FORMAT([EffectiveFromDate], 'hh')
				,FORMAT([EffectiveFromDate], 'mm')
				,FORMAT([EffectiveFromDate], 'ss')
				)
			,CONCAT (
				FORMAT([EffectiveToDate], 'yyyy')
				,FORMAT([EffectiveToDate], 'MM')
				,FORMAT([EffectiveToDate], 'dd')
				,FORMAT([EffectiveToDate], 'hh')
				,FORMAT([EffectiveToDate], 'mm')
				,FORMAT([EffectiveToDate], 'ss')
				)
		FROM [dbo].[MVN_V1]
		WHERE FK_FileHeaderId = @FileHeaderId
	END
END
