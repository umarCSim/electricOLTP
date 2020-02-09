/*
This SP is used by the Incoming.dtsx package
Example call: Where (?) is an input field to be mapped, (output) is an output field to be mapped and ('10' or any number) is a placeholder.
EXECUTE [dbo].[SP_InsertTable_SSIS_Large] '0141','SP9', ?,?,?,?,'5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20'..., '100',? OUTPUT
*/
CREATE PROCEDURE [dbo].[SP_InsertTable_SSIS_Large] @Flow_InsertFor VARCHAR(5)
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
	,@PARAM21 VARCHAR(255) = NULL
	,@PARAM22 VARCHAR(255) = NULL
	,@PARAM23 VARCHAR(255) = NULL
	,@PARAM24 VARCHAR(255) = NULL
	,@PARAM25 VARCHAR(255) = NULL
	,@PARAM26 VARCHAR(255) = NULL
	,@PARAM27 VARCHAR(255) = NULL
	,@PARAM28 VARCHAR(255) = NULL
	,@PARAM29 VARCHAR(255) = NULL
	,@PARAM30 VARCHAR(255) = NULL
	,@PARAM31 VARCHAR(255) = NULL
	,@PARAM32 VARCHAR(255) = NULL
	,@PARAM33 VARCHAR(255) = NULL
	,@PARAM34 VARCHAR(255) = NULL
	,@PARAM35 VARCHAR(255) = NULL
	,@PARAM36 VARCHAR(255) = NULL
	,@PARAM37 VARCHAR(255) = NULL
	,@PARAM38 VARCHAR(255) = NULL
	,@PARAM39 VARCHAR(255) = NULL
	,@PARAM40 VARCHAR(255) = NULL
	,@PARAM41 VARCHAR(255) = NULL
	,@PARAM42 VARCHAR(255) = NULL
	,@PARAM43 VARCHAR(255) = NULL
	,@PARAM44 VARCHAR(255) = NULL
	,@PARAM45 VARCHAR(255) = NULL
	,@PARAM46 VARCHAR(255) = NULL
	,@PARAM47 VARCHAR(255) = NULL
	,@PARAM48 VARCHAR(255) = NULL
	,@PARAM49 VARCHAR(255) = NULL
	,@PARAM50 VARCHAR(255) = NULL
	,@PARAM51 VARCHAR(255) = NULL
	,@PARAM52 VARCHAR(255) = NULL
	,@PARAM53 VARCHAR(255) = NULL
	,@PARAM54 VARCHAR(255) = NULL
	,@PARAM55 VARCHAR(255) = NULL
	,@PARAM56 VARCHAR(255) = NULL
	,@PARAM57 VARCHAR(255) = NULL
	,@PARAM58 VARCHAR(255) = NULL
	,@PARAM59 VARCHAR(255) = NULL
	,@PARAM60 VARCHAR(255) = NULL
	,@PARAM61 VARCHAR(255) = NULL
	,@PARAM62 VARCHAR(255) = NULL
	,@PARAM63 VARCHAR(255) = NULL
	,@PARAM64 VARCHAR(255) = NULL
	,@PARAM65 VARCHAR(255) = NULL
	,@PARAM66 VARCHAR(255) = NULL
	,@PARAM67 VARCHAR(255) = NULL
	,@PARAM68 VARCHAR(255) = NULL
	,@PARAM69 VARCHAR(255) = NULL
	,@PARAM70 VARCHAR(255) = NULL
	,@PARAM71 VARCHAR(255) = NULL
	,@PARAM72 VARCHAR(255) = NULL
	,@PARAM73 VARCHAR(255) = NULL
	,@PARAM74 VARCHAR(255) = NULL
	,@PARAM75 VARCHAR(255) = NULL
	,@PARAM76 VARCHAR(255) = NULL
	,@PARAM77 VARCHAR(255) = NULL
	,@PARAM78 VARCHAR(255) = NULL
	,@PARAM79 VARCHAR(255) = NULL
	,@PARAM80 VARCHAR(255) = NULL
	,@PARAM81 VARCHAR(255) = NULL
	,@PARAM82 VARCHAR(255) = NULL
	,@PARAM83 VARCHAR(255) = NULL
	,@PARAM84 VARCHAR(255) = NULL
	,@PARAM85 VARCHAR(255) = NULL
	,@PARAM86 VARCHAR(255) = NULL
	,@PARAM87 VARCHAR(255) = NULL
	,@PARAM88 VARCHAR(255) = NULL
	,@PARAM89 VARCHAR(255) = NULL
	,@PARAM90 VARCHAR(255) = NULL
	,@PARAM91 VARCHAR(255) = NULL
	,@PARAM92 VARCHAR(255) = NULL
	,@PARAM93 VARCHAR(255) = NULL
	,@PARAM94 VARCHAR(255) = NULL
	,@PARAM95 VARCHAR(255) = NULL
	,@PARAM96 VARCHAR(255) = NULL
	,@PARAM97 VARCHAR(255) = NULL
	,@PARAM98 VARCHAR(255) = NULL
	,@PARAM99 VARCHAR(255) = NULL
	,@PARAM100 VARCHAR(255) = NULL
	,@RETURN_TABLENAME_Id INT OUTPUT
AS
BEGIN
	DECLARE @TempTable TABLE (Id INT)

	------------------------------
	/*
 #####        #          #    
#     #      # #        # #   
#           #   #      #   #  
 #####     #     #    #     # 
      #    #######    ####### 
#     #    #     #    #     # 
 #####     #     #    #     # 
*/
	------------------------------
	--FLOW: SO141 SAA-I014: Settlement Report: sub-flow 1
	/*
	IF (@Flow_InsertFor = 'S0141')
	BEGIN
		IF (@Table_InsertFor = 'PPC')
		BEGIN
			INSERT INTO [dbo].[PPC_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AggregatePartyPeriodCharges]
				,[BSSCLimitedCostAllocation]
				,[BMUnitCashflow]
				,[EnergyImbalanceCashflow]
				,[InformationImbalanceCashflow]
				,[NonDeliveryCharge]
				,[ResidualCashflowReallocationCharge]
				)
			OUTPUT INSERTED.PPC_V8Id
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

		IF (@Table_InsertFor = 'SSD')
		BEGIN
			INSERT INTO [dbo].[SSD_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[SystemPeriodData] --0
				,[PeriodBSSCLimitedCosts] --1
				,[SystemOperatorBMCashflow] --2
				,[InformationImbalancePrice1] --3
				,[InformationImbalancePrice2] --4
				,[SystemBuyPrice] --5
				,[SystemSellPrice] --6
				,[PriceDerivationCode] --7
				,[TotalSystemBMCashflow] --8
				,[TotalSystemEnergyImbalanceCashflow] --9
				,[TotalSystemNonDeliveryCharge] --10
				,[SystemTotalAcceptedBidVolume] --11
				,[SystemTotalUnpricedAcceptedBidVolume] --12
				,[SystemTotalPricedAcceptedBidVolume] --13
				,[TotalSystemEnergyContractVolume] --14
				,[NIVTaggedSystemTotalUnpricedBidVolume] --15
				,[TotalSystemAcceptedOfferVolume] --16
				,[NIVTaggedSystemTotalUnpricedOfferVolume] --17
				,[NetImbalanceVolume] --18
				,[TotalNIVTaggedVolume] --19
				,[NIVTaggedSBVA] --20
				,[NIVTaggedSSVA] --21
				,[SystemTotalUnpricedAcceptedOfferVolume] --22
				,[SystemTotalPricedAcceptedOfferVolume] --23
				,[TotalSystemEnergyImbalanceVolume] --24
				,[ResidualCashflowReallocationDenominator] --25
				,[TotalSystemResidualCashflow] --26
				,[TotalSystemInformationImbalanceCharge] --27
				,[NetEnergySellPriceCostAdjustment] --28
				,[NetEnergyBuyPriceCostAdjustment] --29
				,[NetEnergySellPriceVolumeAdjustment] --30
				,[NetEnergyBuyPriceVolumeAdjustment] --31
				,[NetSystemSellPriceVolumeAdjustment] --32
				,[NetSystemBuyPriceVolumeAdjustment] --33
				,[SellPricePriceAdjust] --34
				,[BuyPricePriceAdjust] --35
				,[TotalPeriodApplicableBalancingServicesVolume] --36
				,[SystemOperatorProductionImbalance] --37
				,[SystemOperatorConsumptionImbalance] --38
				,[NIVTaggedEnergyBuyVolumeAdjustment] --39
				,[NIVTaggedEnergySellVolumeAdjustment] --40
				,[PARTaggedEnergyBuyVolumeAdjustment] --41
				,[PARTaggedEnergySellVolumeAdjustment] --42
				,[UntaggedEBCA] --43
				,[UntaggedEBVA] --44
				,[UntaggedESCA] --45
				,[UntaggedESVA] --46
				,[TotalSystemTaggedAcceptedBidVolume] --47
				,[TotalSystemTaggedAcceptedOfferVolume] --48
				,[TotalSystemRepricedAcceptedBidVolume] --49
				,[TotalSystemRepricedAcceptedOfferVolume] --50
				,[TotalSystemOriginallypricedAcceptedBidVolume] --51
				,[TotalSystemOriginallypricedAcceptedOfferVolume] --52
				,[TotalSystemAdjustmentSellVolume] --53
				,[TotalSystemAdjustmentBuyVolume] --54
				,[TotalSystemTaggedAdjustmentSellVolume] --55
				,[TotalSystemTaggedAdjustmentBuyVolume] --56
				,[TotalSystemRepricedAdjustmentSellVolume] --57
				,[TotalSystemRepricedAdjustmentBuyVolume] --58
				,[TotalSystemOriginallypricedAdjustmentSellVolume] --59
				,[TotalSystemOriginallypricedAdjustmentBuyVolume] --60
				,[ReplacementPrice] --61
				,[ReplacementPriceCalculationVolume] --62
				,[StorAvailabilityWindowFlag] --63
				,[LossOfLoadProbability] --64
				,[DeratedMargin] --65
				,[ValueOfLostLoad] --66
				,[ReserveScarcityPrice] --67
				--,[MD2_V7Id]
				)
			OUTPUT INSERTED.SSD_V8Id
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
				,@PARAM17
				,@PARAM18
				,@PARAM19
				,@PARAM20
				,@PARAM21
				,@PARAM22
				,@PARAM23
				,@PARAM24
				,@PARAM25
				,@PARAM26
				,@PARAM27
				,@PARAM28
				,@PARAM29
				,@PARAM30
				,@PARAM31
				,@PARAM32
				,@PARAM33
				,@PARAM34
				,@PARAM35
				,@PARAM36
				,@PARAM37
				,@PARAM38
				,@PARAM39
				,@PARAM40
				,@PARAM41
				,@PARAM42
				,@PARAM43
				,@PARAM44
				,@PARAM45
				,@PARAM46
				,@PARAM47
				,@PARAM48
				,@PARAM49
				,@PARAM50
				,@PARAM51
				,@PARAM52
				,@PARAM53
				,@PARAM54
				,@PARAM55
				,@PARAM56
				,@PARAM57
				,@PARAM58
				,@PARAM59
				,@PARAM60
				,@PARAM61
				,@PARAM62
				,@PARAM63
				,@PARAM64
				,@PARAM65
				,@PARAM66
				,@PARAM67
				,@PARAM68
				,@PARAM69
				,@PARAM70
				,@PARAM71
				)
		END

		IF (@Table_InsertFor = 'MD2')
		BEGIN
			INSERT INTO [dbo].[MD2_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[MarketIndexDataPeriodInformation]
				,[MarketIndexDataProviderID]
				,[IndividualLiquidityThreshold]
				,[MarketIndexPrice]
				,[MarketIndexVolume]
				)
			OUTPUT INSERTED.MD2_V8Id
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

		IF (@Table_InsertFor = 'DB2')
		BEGIN
			INSERT INTO [dbo].[DB2_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BalancingServicesAdjustmentActionData]
				,[BalancingServicesAdjustmentActionId]
				,[BalancingServicesAdjustmentActionCost]
				,[BalancingServicesAdjustmentActionVolume]
				,[TaggedBalancingServicesAdjustmentActionVolume]
				,[RepricedBalancingServicesAdjustmentActionVolume]
				,[OriginallyPricedBalancingServicesAdjustmentActionVolume]
				,[BalancingServicesAdjustmentActionSOFlag]
				,[BalancingServicesAdjustmentActionStorProviderFlag]
				,[ReserveScarcityPriceFlag]
				)
			OUTPUT INSERTED.DB2_V8Id
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

		IF (@Table_InsertFor = 'APD')
		BEGIN
			INSERT INTO [dbo].[APD_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AccountPeriodData]
				,[ProductionConsumptionFlag]
				,[BSSCLimitedCostAllocation]
				,[EnergyImbalanceCharge]
				,[InformationImbalanceCharge]
				,[ResidualCashflowReallocationCharge]
				,[AccountBilateralContractVolume]
				,[AccountPeriodBalancingServicesVolume]
				,[AccountEnergyImbalanceVolume]
				,[AccountCreditedEnergyVolume]
				,[ResidualCashflowReallocationProportion]
				--,[APB_V8Id]
				)
			OUTPUT INSERTED.APD_V8Id
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

		IF (@Table_InsertFor = 'APB')
		BEGIN
			INSERT INTO [dbo].[APB_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[AccountPeriodBMUData]
				,[BMUnitId]
				,[CreditedEnergyVolume]
				,[FixedMeteredVolumeReallocation]
				,[PercentageMeteredVolumeReallocation]
				)
			OUTPUT INSERTED.APB_V8Id
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

		IF (@Table_InsertFor = 'BPD')
		BEGIN
			INSERT INTO [dbo].[BPD_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUnitPeriodData]
				,[BMUnitId]
				,[InformationImbalanceCashflow]
				,[BMUnitPeriodNonDeliveryCharge]
				,[PeriodFPN]
				,[PeriodBMUnitBalancingServicesVolume]
				,[PeriodInformationImbalanceVolume]
				,[PeriodExpectedMeteredVolume]
				,[BMUnitMeteredVolume]
				,[PeriodBMUnitNonDeliveredBidVolume]
				,[PeriodBMUnitNonDeliveredOfferVolume]
				,[TransmissionLossFactor]
				,[TransmissionLossMultiplier]
				--,[FPN_V8Id]
				--,[BOD_V8Id]
				--,[BOA_V8Id]
				--,[MVR_V8Id]
				)
			OUTPUT INSERTED.BPD_V8Id
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
				,@PARAM17
				,@PARAM18
				,@PARAM19
				)
		END

		IF (@Table_InsertFor = 'FPN')
		BEGIN
			INSERT INTO [dbo].[FPN_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[FPNValuePair]
				,[Timefrom]
				,[FPNValueFrom]
				,[TimeTo]
				,[FPNValueTo]
				)
			OUTPUT INSERTED.FPN_V8Id
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

		IF (@Table_InsertFor = 'BOD')
		BEGIN
			INSERT INTO [dbo].[BOD_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUPeriodBidOfferData]
				,[BidOfferPairNumber]
				,[BidPrice]
				,[OfferPrice]
				,[PeriodBMUnitTotalAcceptedBidVolume]
				,[PeriodBMUnitTotalAcceptedOfferVolume]
				,[PeriodBMUnitTotalPricedAcceptedBidVolume]
				,[PeriodBMUnitTotalPricedAcceptedOfferVolume]
				,[PeriodBMUnitTaggedBidVolume]
				,[PeriodBMUnitTaggedOfferVolume]
				,[PeriodBMUnitRepricedBidVolume]
				,[PeriodBMUnitRepricedOfferVolume]
				,[PeriodBMUnitOriginallyPricedBidVolume]
				,[PeriodBMUnitOriginallyPricedOfferVolume]
				,[PeriodBMUnitBidCashflow]
				,[PeriodBMUnitOfferCashflow]
				--,[BOS_V8Id]
				)
			OUTPUT INSERTED.BOD_V8Id
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
				,@PARAM17
				,@PARAM18
				,@PARAM19
				)
		END

		IF (@Table_InsertFor = 'BOS')
		BEGIN
			INSERT INTO [dbo].[BOS_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUPeriodBidOfferValuePair]
				,[Timefrom]
				,[BidOfferVolumeValueFrom]
				,[TimeTo]
				,[BidOfferVolumeValueTo]
				)
			OUTPUT INSERTED.BOS_V8Id
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

		IF (@Table_InsertFor = 'BOA')
		BEGIN
			INSERT INTO [dbo].[BOA_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUPeriodBidOfferAcceptance]
				,[BOAcceptanceNumber]
				,[CADLFlag]
				,[AcceptanceSOFlag]
				,[AcceptanceStorProviderFlag]
				,[ReserveScarcityPriceFlag]
				--,[BO5_V8Id]
				--,[BO8_V8Id]
				)
			OUTPUT INSERTED.BOA_VAId
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

		IF (@Table_InsertFor = 'BO5')
		BEGIN
			INSERT INTO [dbo].[BO5_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUPeriodBidOfferAcceptanceSpotPoint]
				,[AcceptanceFromTime]
				,[BidOfferAcceptanceVolumeValueFrom]
				,[AcceptanceToTime]
				,[BidOfferAcceptanceVolumeValueTo]
				)
			OUTPUT INSERTED.BO5_V8Id
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

		IF (@Table_InsertFor = 'BO8')
		BEGIN
			INSERT INTO [dbo].[BO8_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUnitBidOfferPairAcceptanceVolumeData]
				,[BidOfferPairNumber]
				,[BidOfferPairAcceptanceBidVolume]
				,[BidOfferPairAcceptanceOfferVolume]
				)
			OUTPUT INSERTED.BO8_V8Id
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

		IF (@Table_InsertFor = 'MVR')
		BEGIN
			INSERT INTO [dbo].[MVR_V8] (
				[FK_FileHeaderId]
				,[FK_FlowKeyId]
				,[BMUnitMVRInformation]
				,[BSCPartyId]
				,[ProductionConsumptionFlag]
				,[CreditedEnergyVolume]
				,[FixedMeteredVolumeReallocation]
				,[PercentageMeteredVolumeReallocation]
				)
			OUTPUT INSERTED.MVR_V8Id
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
	*/

	SET @RETURN_TABLENAME_Id = (
			SELECT Id
			FROM @TempTable
			)
END

RETURN
GO


