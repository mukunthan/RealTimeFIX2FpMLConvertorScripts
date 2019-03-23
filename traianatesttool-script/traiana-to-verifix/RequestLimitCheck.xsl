<xsl:stylesheet version="1.0"
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 ><!-- Start stylesheet -->

 <xsl:strip-space elements="*"/>
 <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template name="temp1" match="header"><!-- This is Header template -->

      <xsl:if test = "header/messageId"><!-- check header/messageId xparth is correct -->
        <FpHdMsgID><!-- Print <FPHdMsgID> new tag for <messageId> -->
          <xsl:apply-templates select="header/messageId"/> 
        </FpHdMsgID><!-- end <FPHdMsgID> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/messageId">
        <FpHdMsgIDScheme>        
           <xsl:value-of select = "header/messageId/@messageIdScheme" /><!-- messageId attribute value -->
        </FpHdMsgIDScheme>
      </xsl:if>

      <xsl:if test = "header/sentBy"><!-- check header/sentBy xparth is correct -->
        <FpHdSentBy><!-- Print <FPHdSentBy> new tag for <sentBy> -->
          <xsl:apply-templates select="header/sentBy"/><!-- <sentBy> element value -->
        </FpHdSentBy><!-- end <FPHdSentBy> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/sendTo"><!-- check header/sendTo xparth is correct -->
        <FpHdSentTo><!-- Print <FPHdSentTo> new tag for <sentTo> -->
          <xsl:apply-templates select="header/sendTo"/><!-- <sendTo> element value --> 
        </FpHdSentTo><!-- end <FPHdSentTo> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/creationTimestamp"><!-- check header/creationTimestamp xparth is correct -->
        <FpHdCreateTime><!-- Print <FPHdCreateTime> new tag for <creationTimeStamp> -->
          <xsl:apply-templates select="header/creationTimestamp"/><!-- <creationTimestamp> element value --> 
        </FpHdCreateTime><!-- end <FPHdCreateTime> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/expiryTimestamp"><!-- check header/expiryTimeStamp xparth is correct -->
        <FpHdExpTime><!-- Print <FPHdExpTime> new tag for <expiryTimeStamp> -->
          <xsl:apply-templates select="header/expiryTimestamp"/><!-- <expiryTimeStamp> element value -->
        </FpHdExpTime><!-- end <FPHdExpTime> tag -->
      </xsl:if><!-- end if -->

  </xsl:template><!-- End Header template -->

 <xsl:template name="temp2" match="isCorrection"><!-- template for match */isCorrection Xparth -->
  <xsl:if test = "isCorrection"> 
    <FpIsCorrect><!-- Print <FpIsCorrect> new tag for <isCorrection> -->
        <xsl:value-of select="isCorrection" /><!-- <isCorrection> element value -->
    </FpIsCorrect>
  </xsl:if>
 </xsl:template><!-- End template -->

 <xsl:template name="temp3" match="correlationId"><!-- template for match */correlationId Xparth -->

   <xsl:if test = "correlationId">

     <FpCorID><!-- Print <FpHdMsgID> new tag for <correlationId> -->
        <xsl:value-of select="correlationId" /><!-- <correlationId> element value -->     
     </FpCorID>

     <FpCorIDSch><!-- Print <FpHdMsgID> new tag for <correlationId> -->
         <xsl:value-of select="correlationId/@correlationIdScheme" />     
     </FpCorIDSch>

   </xsl:if>

 </xsl:template><!-- End template -->

 <xsl:template name="temp4" match="requestingPartyReference"><!-- template for match */requestingPartyReference Xparth -->
  <xsl:if test = "requestingPartyReference"> 
    <FpReqPartyhref><!-- Print <FpReqPartyhref> new tag for <requestingPartyReference> -->
        <xsl:value-of select="requestingPartyReference/@href" /><!-- <requestingPartyReference> attribute value -->
    </FpReqPartyhref>
  </xsl:if>
 </xsl:template><!-- End template -->

 <xsl:template name="temp5" match="creditApprovalRequestType"><!-- template for match */creditApprovalRequestType Xparth -->
  <xsl:if test = "creditApprovalRequestType"> 
    <FpCreAppReqType><!-- Print <FpReqPartyhref> new tag for <FpCreAppReqType> -->
        <xsl:value-of select="creditApprovalRequestType" /><!-- <creditApprovalRequestType> element value --> 
    </FpCreAppReqType>
  </xsl:if>
 </xsl:template><!-- End template -->

 <xsl:template name="temp6" match="creditApprovalModel"><!-- template for match */creditApprovalModel Xparth -->
  <xsl:if test = "creditApprovalModel"> 
    <FpCreAppModel><!-- Print <FpReqPartyhref> new tag for <creditApprovalModel> -->
        <xsl:value-of select="creditApprovalModel" /><!-- <creditApprovalModel> element value --> 
    </FpCreAppModel>
  </xsl:if>
 </xsl:template><!-- End template -->

 
 <xsl:template name="temp7" match="trade/tradeHeader"><!-- template for match */trade/tradeHeader Xparth -->
       
       <xsl:variable name="cur1">
         <xsl:copy-of select="trade/tradeHeader/partyTradeIdentifier/tradeId"/><!-- <tradeId> element value -->
       </xsl:variable>

       <xsl:variable name="cur2">
         <xsl:copy-of select="trade/tradeHeader/partyTradeIdentifier/issuer"/><!-- <issuer> element value -->
       </xsl:variable>
      

      <xsl:if test = "trade/tradeHeader/partyTradeIdentifier/tradeId">
           <FpTrdTrdHdrPtyTrdIdfTrdID>
              <xsl:value-of select="$cur1" />
           </FpTrdTrdHdrPtyTrdIdfTrdID>

           <FpTrdTrdHdrPtyTrdIdfTrdIDSch>
              <xsl:value-of select="trade/tradeHeader/partyTradeIdentifier/tradeId/@tradeIdScheme" />
           </FpTrdTrdHdrPtyTrdIdfTrdIDSch>

      </xsl:if>


      <xsl:if test = "trade/tradeHeader/partyTradeIdentifier/partyReference">
          <FpTrdTrdHdrPtyTrdIdfPtyhref>
             <xsl:value-of select="trade/tradeHeader/partyTradeIdentifier/partyReference/@href" />
          </FpTrdTrdHdrPtyTrdIdfPtyhref>
      </xsl:if>
    
    <xsl:if test="trade/tradeHeader/tradeDate">
      <FpTrdDate>
        <xsl:value-of select="trade/tradeHeader/tradeDate" />      
      </FpTrdDate>
    </xsl:if>

</xsl:template>


<xsl:variable name="FpNoOfSwpStrms" select="count(requestLimitCheck/trade/swap/swapStream)" />

<xsl:template name="temp8" match="trade/swap">

  <xsl:if test="trade/swap/productType">
    <FpSwpProdType>
        <xsl:value-of select="trade/swap/productType" /> 
    </FpSwpProdType>
  </xsl:if>

  <xsl:if test="trade/swap/swapStream">
    <FpNoOfSwpStrms><xsl:value-of select="$FpNoOfSwpStrms"/></FpNoOfSwpStrms>

      <FpNoOfSwpStrm>
           <xsl:for-each select="trade/swap/swapStream">
			
				
				<xsl:if test="current()|@id">
				<FpSwpStrmsID>
				   <xsl:value-of select="@id" />
				</FpSwpStrmsID>
				</xsl:if>
				

				<xsl:if test="paymentDates/calculationPeriodDatesReference">
					<FpSwpPayCalPrdRef>
					<xsl:value-of select="paymentDates/calculationPeriodDatesReference/@href" />
					</FpSwpPayCalPrdRef>		 
				</xsl:if>
						
				
               <xsl:if test="payerPartyReference">
                 <FpSwpPayPtyhref>
                   <xsl:value-of select="payerPartyReference/@href" />
                 </FpSwpPayPtyhref>
               </xsl:if>

               <xsl:if test="receiverPartyReference">
                 <FpSwpRcvPtyhref>
                   <xsl:value-of select="receiverPartyReference/@href" />
                 </FpSwpRcvPtyhref>
               </xsl:if>

               <xsl:if test="calculationPeriodDates">
                 <FpSwpCalcPrdDatesID>
                   <xsl:value-of select="calculationPeriodDates/@id" />
                 </FpSwpCalcPrdDatesID>
               </xsl:if>

               <xsl:if test="calculationPeriodDates/effectiveDate/unadjustedDate">
                 <FpSwpEffUnAdjDate>
                   <xsl:value-of select="calculationPeriodDates/effectiveDate/unadjustedDate" />
                 </FpSwpEffUnAdjDate>
               </xsl:if>

               <xsl:if test="calculationPeriodDates/effectiveDate/dateAdjustments/businessDayConvention">
                 <FpSwpEffBusDayConv>
                   <xsl:value-of select="calculationPeriodDates/effectiveDate/dateAdjustments/businessDayConvention" />
                 </FpSwpEffBusDayConv>
               </xsl:if>
            <xsl:variable name="FpSwpNoOfEffBusCntrs" select="count(calculationPeriodDates/effectiveDate/dateAdjustments/businessCenters/businessCenter)" />
            
               
                 <xsl:if test="calculationPeriodDates/effectiveDate/dateAdjustments/businessCenters">
				 <FpSwpNoOfEffBusCntrs><xsl:value-of select="$FpSwpNoOfEffBusCntrs"/></FpSwpNoOfEffBusCntrs> 
                  <FpSwpNoOfEffBusCntr>
                      <xsl:for-each select="calculationPeriodDates/effectiveDate/dateAdjustments/businessCenters/businessCenter">
                         <FpSwpEffBusCntr>
                           <xsl:value-of select="current()" />
                         </FpSwpEffBusCntr>
                       </xsl:for-each>
                     </FpSwpNoOfEffBusCntr>
                 </xsl:if>



            <xsl:if test="calculationPeriodDates/terminationDate/unadjustedDate">
                 <FpSwpEndUnAdjDate>
                   <xsl:value-of select="calculationPeriodDates/terminationDate/unadjustedDate" />
                 </FpSwpEndUnAdjDate>
               </xsl:if>

               <xsl:if test="calculationPeriodDates/terminationDate/dateAdjustments/businessDayConvention">
                 <FpSwpEndBusDayConv>
                   <xsl:value-of select="calculationPeriodDates/terminationDate/dateAdjustments/businessDayConvention" />
                 </FpSwpEndBusDayConv>
               </xsl:if>
            <xsl:variable name="FpSwpNoOfEndBusCntrs" select="count(calculationPeriodDates/terminationDate/dateAdjustments/businessCenters/businessCenter)" />
   
               
                 <xsl:if test="calculationPeriodDates/terminationDate/dateAdjustments/businessCenters">
				 <FpSwpNoOfEndBusCntrs><xsl:value-of select="$FpSwpNoOfEndBusCntrs"/></FpSwpNoOfEndBusCntrs> 
                  <FpSwpNoOfEndBusCntr>
                      <xsl:for-each select="calculationPeriodDates/terminationDate/dateAdjustments/businessCenters/businessCenter">
                         <FpSwpEndBusCntr>
                           <xsl:value-of select="current()" />
                         </FpSwpEndBusCntr>
                       </xsl:for-each>
                     </FpSwpNoOfEndBusCntr>
                 </xsl:if>

            

             <xsl:if test="calculationPeriodDates/calculationPeriodDatesAdjustments/businessDayConvention">
                 <FpSwpCalcPrdDtAdjBusDayConv>
                   <xsl:value-of select="calculationPeriodDates/calculationPeriodDatesAdjustments/businessDayConvention" />
                 </FpSwpCalcPrdDtAdjBusDayConv>
               </xsl:if>

            <xsl:variable name="FpSwpNoOfCalcPrdDtAdjBusCntrs" select="count(calculationPeriodDates/calculationPeriodDatesAdjustments/businessCenters/businessCenter)" />
             
                 <xsl:if test="calculationPeriodDates/calculationPeriodDatesAdjustments/businessCenters">
				 <FpSwpNoOfCalcPrdDtAdjBusCntrs><xsl:value-of select="$FpSwpNoOfCalcPrdDtAdjBusCntrs"/></FpSwpNoOfCalcPrdDtAdjBusCntrs>             
                  <FpSwpNoOfCalcPrdDtAdjBusCntr>
                      <xsl:for-each select="calculationPeriodDates/calculationPeriodDatesAdjustments/businessCenters/businessCenter">
                         <FpSwpCalcPrdDtAdjBusCntr>
                           <xsl:value-of select="current()" />
                         </FpSwpCalcPrdDtAdjBusCntr>
                       </xsl:for-each>
                     </FpSwpNoOfCalcPrdDtAdjBusCntr>
                 </xsl:if>



            
            <xsl:if test="calculationPeriodDates/firstRegularPeriodStartDate">
                 <FpSwpCalcPrdFrstRegPrdStartDate>
                   <xsl:value-of select="calculationPeriodDates/firstRegularPeriodStartDate" />
                 </FpSwpCalcPrdFrstRegPrdStartDate>
            </xsl:if>

            <xsl:if test="calculationPeriodDates/lastRegularPeriodEndDate">
                 <FpSwpCalcPrdLastRegPrdStartDate>
                   <xsl:value-of select="calculationPeriodDates/lastRegularPeriodEndDate" />
                 </FpSwpCalcPrdLastRegPrdStartDate>
            </xsl:if>

            <xsl:if test="calculationPeriodDates/calculationPeriodFrequency/periodMultiplier">
                 <FpSwpPrdMult>
                   <xsl:value-of select="calculationPeriodDates/calculationPeriodFrequency/periodMultiplier" />
                 </FpSwpPrdMult>
            </xsl:if>

            <xsl:if test="calculationPeriodDates/calculationPeriodFrequency/period">
                 <FpSwpPrd>
                   <xsl:value-of select="calculationPeriodDates/calculationPeriodFrequency/period" />
                 </FpSwpPrd>
            </xsl:if>

            <xsl:if test="calculationPeriodDates/calculationPeriodFrequency/rollConvention">
                 <FpSwpRollConv>
                   <xsl:value-of select="calculationPeriodDates/calculationPeriodFrequency/rollConvention" />
                 </FpSwpRollConv>
            </xsl:if>
<!-- End calculationPeriodDates -->

<!-- paymentDates -->

           <xsl:if test="paymentDates/paymentFrequency/periodMultiplier">
                 <FpSwpPayFrqMult>
                   <xsl:value-of select="paymentDates/paymentFrequency/periodMultiplier" />
                 </FpSwpPayFrqMult>
            </xsl:if>


            <xsl:if test="paymentDates/paymentFrequency/period">
                 <FpSwpPayFrqPrd>
                   <xsl:value-of select="paymentDates/paymentFrequency/period" />
                 </FpSwpPayFrqPrd>
            </xsl:if>

            <xsl:if test="paymentDates/firstPaymentDate">
                 <FpSwpPayFrstPayDate>
                   <xsl:value-of select="paymentDates/firstPaymentDate" />
                 </FpSwpPayFrstPayDate>
            </xsl:if>

            <xsl:if test="paymentDates/lastRegularPaymentDate">
                 <FpSwpPayLastRegPayDate>
                   <xsl:value-of select="paymentDates/lastRegularPaymentDate" />
                 </FpSwpPayLastRegPayDate>
            </xsl:if>

            <xsl:if test="paymentDates/payRelativeTo">
                 <FpSwpPayRltTo>
                   <xsl:value-of select="paymentDates/payRelativeTo" />
                 </FpSwpPayRltTo>
            </xsl:if>
            <!-- paymentDaysOffset -->

            <xsl:if test="paymentDates/paymentDaysOffset/periodMultiplier">
                 <FpSwpPayDtOffSetPrdMult>
                   <xsl:value-of select="paymentDates/paymentDaysOffset/periodMultiplier" />
                 </FpSwpPayDtOffSetPrdMult>
            </xsl:if>

            <xsl:if test="paymentDates/paymentDaysOffset/period">
                 <FpSwpPayDtOffSetPrd>
                   <xsl:value-of select="paymentDates/paymentDaysOffset/period" />
                 </FpSwpPayDtOffSetPrd>
            </xsl:if>

            <xsl:if test="paymentDates/paymentDaysOffset/dayType">
                 <FpSwpPayDtOffSetPrdDayType>
                   <xsl:value-of select="paymentDates/paymentDaysOffset/dayType" />
                 </FpSwpPayDtOffSetPrdDayType>
            </xsl:if>

            <!-- paymentDatesAdjustments -->

            <xsl:if test="paymentDates/paymentDatesAdjustments/businessDayConvention">
                 <FpSwpPayDayAdjBusDayConv>
                   <xsl:value-of select="paymentDates/paymentDatesAdjustments/businessDayConvention" />
                 </FpSwpPayDayAdjBusDayConv>
            </xsl:if>


            <xsl:variable name="FpSwpNoOfPayDayAdjBusCntrs" select="count(paymentDates/paymentDatesAdjustments/businessCenters/businessCenter)" />
              
                 <xsl:if test="paymentDates/paymentDatesAdjustments/businessCenters">
				 <FpSwpNoOfPayDayAdjBusCntrs><xsl:value-of select="$FpSwpNoOfPayDayAdjBusCntrs"/></FpSwpNoOfPayDayAdjBusCntrs> 
             
                    <FpSwpNoOfPayDayAdjBusCntr>
                      <xsl:for-each select="paymentDates/paymentDatesAdjustments/businessCenters/businessCenter">
                         <FpSwpPayDayAdjBusCntr>
                           <xsl:value-of select="current()" />
                         </FpSwpPayDayAdjBusCntr>
                       </xsl:for-each>
                     </FpSwpNoOfPayDayAdjBusCntr>
                 </xsl:if>

            <!-- resetDates -->

            <xsl:if test="resetDates">
                 <FpSwpRsetDtsID>
                   <xsl:value-of select="resetDates/@id" />
                 </FpSwpRsetDtsID>
            </xsl:if>

            <xsl:if test="resetDates/calculationPeriodDatesReference">
                 <FpSwpRsetDtsCalcPrdDateRef>
                   <xsl:value-of select="resetDates/calculationPeriodDatesReference/@href" />
                 </FpSwpRsetDtsCalcPrdDateRef>
            </xsl:if>

            <xsl:if test="resetDates/resetRelativeTo">
                 <FpSwpRsetDtRltTo>
                   <xsl:value-of select="resetDates/resetRelativeTo" />
                 </FpSwpRsetDtRltTo>
            </xsl:if>

            <xsl:if test="resetDates/fixingDates/periodMultiplier">
                 <FpSwpRsetDtFxDatePrdMult>
                   <xsl:value-of select="resetDates/fixingDates/periodMultiplier" />
                 </FpSwpRsetDtFxDatePrdMult>
            </xsl:if>

            <xsl:if test="resetDates/fixingDates/period">
                 <FpSwpRsetDtFxDatePrd>
                   <xsl:value-of select="resetDates/fixingDates/period" />
                 </FpSwpRsetDtFxDatePrd>
            </xsl:if>

            <xsl:if test="resetDates/fixingDates/dayType">
                 <FpSwpRsetDtFxDateDayType>
                   <xsl:value-of select="resetDates/fixingDates/dayType" />
                 </FpSwpRsetDtFxDateDayType>
            </xsl:if>

            <xsl:if test="resetDates/fixingDates/businessDayConvention">
                 <FpSwpRsetDtFxDateBusDayConv>
                   <xsl:value-of select="resetDates/fixingDates/businessDayConvention" />
                 </FpSwpRsetDtFxDateBusDayConv>
            </xsl:if>


            <xsl:variable name="FpSwpNoOfsetDtFxDateBusCntrs" select="count(resetDates/fixingDates/businessCenters/businessCenter)" />
              
                 <xsl:if test="resetDates/fixingDates/businessCenters">
				 <FpSwpNoOfsetDtFxDateBusCntrs><xsl:value-of select="$FpSwpNoOfsetDtFxDateBusCntrs"/></FpSwpNoOfsetDtFxDateBusCntrs> 
           
                   <FpSwpNoOfsetDtFxDateBusCntr>
                      <xsl:for-each select="resetDates/fixingDates/businessCenters/businessCenter">
                         <FpSwpsetDtFxDateBusCntr>
                           <xsl:value-of select="current()" />
                         </FpSwpsetDtFxDateBusCntr>
                       </xsl:for-each>
                   </FpSwpNoOfsetDtFxDateBusCntr>
                 </xsl:if>

            <xsl:if test="resetDates/fixingDates/dateRelativeTo">
                 <FpSwpRsetDtFxDateRltTohref>
                   <xsl:value-of select="resetDates/fixingDates/dateRelativeTo/@href" />
                 </FpSwpRsetDtFxDateRltTohref>
            </xsl:if>

            <xsl:if test="resetDates/resetFrequency/periodMultiplier">
                 <FpSwpRsetDtFrqPrdMult>
                   <xsl:value-of select="resetDates/resetFrequency/periodMultiplier" />
                 </FpSwpRsetDtFrqPrdMult>
            </xsl:if>

            <xsl:if test="resetDates/resetFrequency/period">
                 <FpSwpRsetDtFrqPrd>
                   <xsl:value-of select="resetDates/resetFrequency/period" />
                 </FpSwpRsetDtFrqPrd>
            </xsl:if>

            <xsl:if test="resetDates/resetDatesAdjustments/businessDayConvention">
                 <FpSwpRsetDtAdjBusDayConv>
                   <xsl:value-of select="resetDates/resetDatesAdjustments/businessDayConvention" />
                 </FpSwpRsetDtAdjBusDayConv>
            </xsl:if>

            <xsl:variable name="FpSwpRsetDtAdjBusCntrs" select="count(resetDates/resetDatesAdjustments/businessCenters/businessCenter)" />
               
                 <xsl:if test="resetDates/resetDatesAdjustments/businessCenters">
				 <FpSwpNoOfsetDtAdjBusCntrs><xsl:value-of select="$FpSwpRsetDtAdjBusCntrs"/></FpSwpNoOfsetDtAdjBusCntrs> 
            
                  <FpSwpNoOfsetDtAdjBusCntr>
                      <xsl:for-each select="resetDates/resetDatesAdjustments/businessCenters/businessCenter">
                         <FpSwpRsetDtAdjBusCntr>
                           <xsl:value-of select="current()" />
                         </FpSwpRsetDtAdjBusCntr>
                       </xsl:for-each>
                     </FpSwpNoOfsetDtAdjBusCntr>
                 </xsl:if>

           <!-- calculationPeriodAmount -->

           <xsl:if test="calculationPeriodAmount/calculation/notionalSchedule/notionalStepSchedule/initialValue">
                 <FpSwpCalcPrdAmtNotSchInitValue>
                   <xsl:value-of select="calculationPeriodAmount/calculation/notionalSchedule/notionalStepSchedule/initialValue" />
                 </FpSwpCalcPrdAmtNotSchInitValue>
            </xsl:if>

            <xsl:if test="calculationPeriodAmount/calculation/notionalSchedule/notionalStepSchedule/currency">
                 <FpSwpCalcPrdAmtNotSchCurrency>
                   <xsl:value-of select="calculationPeriodAmount/calculation/notionalSchedule/notionalStepSchedule/currency" />
                 </FpSwpCalcPrdAmtNotSchCurrency>
            </xsl:if>

             <xsl:if test="calculationPeriodAmount/calculation/floatingRateCalculation/floatingRateIndex">
                 <FpSwpCalcPrdAmtFltRateIndex>
                   <xsl:value-of select="calculationPeriodAmount/calculation/floatingRateCalculation/floatingRateIndex" />
                 </FpSwpCalcPrdAmtFltRateIndex>
            </xsl:if>

            <xsl:if test="calculationPeriodAmount/calculation/floatingRateCalculation/indexTenor/periodMultiplier">
                 <FpSwpCalcPrdAmtInTnrPrdMult>
                   <xsl:value-of select="calculationPeriodAmount/calculation/floatingRateCalculation/indexTenor/periodMultiplier" />
                 </FpSwpCalcPrdAmtInTnrPrdMult>
            </xsl:if>

            <xsl:if test="calculationPeriodAmount/calculation/floatingRateCalculation/indexTenor/period">
                 <FpSwpCalcPrdAmtInTnrPrd>
                   <xsl:value-of select="calculationPeriodAmount/calculation/floatingRateCalculation/indexTenor/period" />
                 </FpSwpCalcPrdAmtInTnrPrd>
            </xsl:if>

            <xsl:if test="calculationPeriodAmount/calculation/fixedRateSchedule/initialValue">
                 <FpSwpCalcPrdAmtFxdSchInitValue>
                   <xsl:value-of select="calculationPeriodAmount/calculation/fixedRateSchedule/initialValue" />
                 </FpSwpCalcPrdAmtFxdSchInitValue>
            </xsl:if>

            <xsl:if test="calculationPeriodAmount/calculation/dayCountFraction">
                 <FpSwpCalcPrdAmtDayCountFraction>
                   <xsl:value-of select="calculationPeriodAmount/calculation/dayCountFraction" />
                 </FpSwpCalcPrdAmtDayCountFraction>
            </xsl:if>

            <xsl:if test="calculationPeriodAmount/calculation/compoundingMethod">
                 <FpSwpCalcPrdAmtCompMthd>
                   <xsl:value-of select="calculationPeriodAmount/calculation/compoundingMethod" />
                 </FpSwpCalcPrdAmtCompMthd>
            </xsl:if>


            



          </xsl:for-each>

     </FpNoOfSwpStrm>

    

   </xsl:if>
 </xsl:template>

 <xsl:variable name="noOfbusinessCenter" select="count(requestLimitCheck/trade/swap/paymentDate/dateAdjustments/businessCenters/businessCenter)" />
 <xsl:variable name="noOfbusinessCenter2" select="count(requestLimitCheck/trade/swap/fixingDateOffset/businessCenters/businessCenter)" />

 
 
 <xsl:template name="temp9" match="trade/swap">   

  <xsl:if test="trade/swap/buyerPartyReference">
     <FpFraPayPtyhref>
       <xsl:value-of select="trade/swap/buyerPartyReference/@href" />
     </FpFraPayPtyhref>
  </xsl:if>

  <xsl:if test="trade/swap/sellerPartyReference">
     <FpFraRcvPtyhref>
       <xsl:value-of select="trade/swap/sellerPartyReference/@href" />
     </FpFraRcvPtyhref>
  </xsl:if>

  <xsl:if test="trade/swap/adjustedEffectiveDate">
    <FpFraAdjEffDate>
       <xsl:value-of select="trade/swap/adjustedEffectiveDate" />
    </FpFraAdjEffDate>

    <FpFraAdjEffDtID>
          <xsl:value-of select="trade/swap/adjustedEffectiveDate/@id" />
    </FpFraAdjEffDtID>
  </xsl:if>

  <xsl:if test="trade/swap/adjustedTerminationDate">
    <FpFraAdjTrmDate>
       <xsl:value-of select="trade/swap/adjustedTerminationDate" />
    </FpFraAdjTrmDate>
  </xsl:if>

  <xsl:if test="trade/swap/paymentDate/unadjustedDate">
    <FpFraUnAdjDate>
       <xsl:value-of select="trade/swap/paymentDate/unadjustedDate" />
    </FpFraUnAdjDate>
  </xsl:if>

  <xsl:if test="trade/swap/paymentDate/dateAdjustments/businessDayConvention">
    <FpFraPayDayBusDayConv>
       <xsl:value-of select="trade/swap/paymentDate/dateAdjustments/businessDayConvention" />
    </FpFraPayDayBusDayConv>
  </xsl:if>


  <xsl:if test="trade/swap/paymentDate/dateAdjustments/businessCenters">
    <FpFraNoOfBusCntrs><xsl:value-of select="$noOfbusinessCenter"/></FpFraNoOfBusCntrs>
   <FpFraNoOfBusCntr>
    <xsl:for-each select="trade/swap/paymentDate/dateAdjustments/businessCenters/businessCenter">

       <xsl:variable name="businessCenterValue">
          <xsl:copy-of select="current()"/>
       </xsl:variable>

        <FpFraEffBusCntr>
          <xsl:value-of select="$businessCenterValue" />
        </FpFraEffBusCntr>

    </xsl:for-each>
  </FpFraNoOfBusCntr>
  </xsl:if>

  <xsl:if test="trade/swap/fixingDateOffset/periodMultiplier">
    <FpFraFxDatePrdMult>
       <xsl:value-of select="trade/swap/fixingDateOffset/periodMultiplier" />
    </FpFraFxDatePrdMult>
  </xsl:if>

  <xsl:if test="trade/swap/fixingDateOffset/period">
    <FpFraFxDatePrd>
       <xsl:value-of select="trade/swap/fixingDateOffset/period" />
    </FpFraFxDatePrd>
  </xsl:if>

  <xsl:if test="trade/swap/fixingDateOffset/dayType">
    <FpFratDtFxDateDayType>
       <xsl:value-of select="trade/swap/fixingDateOffset/dayType" />
    </FpFratDtFxDateDayType>
  </xsl:if>

  <xsl:if test="trade/swap/fixingDateOffset/businessDayConvention">
    <FpFraFxDateBusDayConv>
       <xsl:value-of select="trade/swap/fixingDateOffset/businessDayConvention" />
    </FpFraFxDateBusDayConv>
  </xsl:if>

  <xsl:if test="trade/swap/fixingDateOffset/businessCenters">
    <FpFraNoOfFxDateBusCntrs><xsl:value-of select="$noOfbusinessCenter2"/></FpFraNoOfFxDateBusCntrs>

    <FpFraNoOfFxDateBusCntr>
    <xsl:for-each select="trade/swap/fixingDateOffset/businessCenters/businessCenter">

       <xsl:variable name="businessCenterValue2">
          <xsl:copy-of select="current()"/>
       </xsl:variable>

        <FpFraFxDateBusCntr>
          <xsl:value-of select="$businessCenterValue2" />
        </FpFraFxDateBusCntr>

    </xsl:for-each>
    </FpFraNoOfFxDateBusCntr>

  </xsl:if>
  
  <xsl:if test="trade/swap/fixingDateOffset/dateRelativeTo">
    <FpFraFxDateRltTohref>
       <xsl:value-of select="trade/swap/fixingDateOffset/dateRelativeTo/@href" />
    </FpFraFxDateRltTohref>
  </xsl:if>

  <xsl:if test="trade/swap/dayCountFraction">
    <FpFraDayCountFraction>
       <xsl:value-of select="trade/swap/dayCountFraction" />
    </FpFraDayCountFraction>
  </xsl:if>

  <xsl:if test="trade/swap/calculationPeriodNumberOfDays">
    <FpFraCalcPrdNoOfDays>
       <xsl:value-of select="trade/swap/calculationPeriodNumberOfDays" />
    </FpFraCalcPrdNoOfDays>
  </xsl:if>

  <xsl:if test="trade/swap/notional/currency">
    <FpFraNotCurrency>
       <xsl:value-of select="trade/swap/notional/currency" />
    </FpFraNotCurrency>
  </xsl:if>

  <xsl:if test="trade/swap/notional/amount">
    <FpFraNotAmount>
       <xsl:value-of select="trade/swap/notional/amount" />
    </FpFraNotAmount>
  </xsl:if>

  <xsl:if test="trade/swap/fixedRate">
    <FpFraFxdRate>
       <xsl:value-of select="trade/swap/fixedRate" />
    </FpFraFxdRate>
  </xsl:if>

  <xsl:if test="trade/swap/floatingRateIndex">
    <FpFraFltRateIndex>
       <xsl:value-of select="trade/swap/floatingRateIndex" />
    </FpFraFltRateIndex>
  </xsl:if>

  <xsl:if test="trade/swap/indexTenor/periodMultiplier">
    <FpFraIdxTenrPrdMult>
       <xsl:value-of select="trade/swap/indexTenor/periodMultiplier" />
    </FpFraIdxTenrPrdMult>
  </xsl:if>

  <xsl:if test="trade/swap/indexTenor/period">
    <FpFraIdxTenrPrd>
       <xsl:value-of select="trade/swap/indexTenor/period" />
    </FpFraIdxTenrPrd>
  </xsl:if>

  <xsl:if test="trade/swap/fraDiscounting">
    <FpFraDiscounting>
       <xsl:value-of select="trade/swap/fraDiscounting" />
    </FpFraDiscounting>
  </xsl:if>

 </xsl:template>

<xsl:template name="temp10" match="trade/fxSingleLeg"><!-- template for match */trade/fxSingleLeg Xparth -->

  <xsl:if test="trade/fxSingleLeg/productType">
    <FpFxlProdType>
        <xsl:value-of select="trade/fxSingleLeg/productType" /> 
    </FpFxlProdType>
  </xsl:if>


  <xsl:if test="trade/fxSingleLeg/exchangedCurrency1/payerPartyReference">
    <FpFxlExchCur1PayPtyhref>
        <xsl:value-of select="trade/fxSingleLeg/exchangedCurrency1/payerPartyReference/@href" /> 
    </FpFxlExchCur1PayPtyhref>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangedCurrency1/receiverPartyReference">
    <FpFxlExchCur1RcvPtyhref>
        <xsl:value-of select="trade/fxSingleLeg/exchangedCurrency1/receiverPartyReference/@href" /> 
    </FpFxlExchCur1RcvPtyhref>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangedCurrency1/paymentAmount/currency">
    <FpFxlExchCur1PayAmtCurrency>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangedCurrency1/paymentAmount/currency"/> 
    </FpFxlExchCur1PayAmtCurrency>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangedCurrency1/paymentAmount/amount">
    <FpFxlExchCur1PayAmtAmount>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangedCurrency1/paymentAmount/amount"/> 
    </FpFxlExchCur1PayAmtAmount>
  </xsl:if>


  <xsl:if test="trade/fxSingleLeg/exchangedCurrency2/payerPartyReference">
    <FpFxlExchCur2PayPtyhref>
        <xsl:value-of select="trade/fxSingleLeg/exchangedCurrency2/payerPartyReference/@href" /> 
    </FpFxlExchCur2PayPtyhref>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangedCurrency2/receiverPartyReference">
    <FpFxlExchCur2RcvPtyhref>
        <xsl:value-of select="trade/fxSingleLeg/exchangedCurrency2/receiverPartyReference/@href" /> 
    </FpFxlExchCur2RcvPtyhref>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangedCurrency2/paymentAmount/currency">
    <FpFxlExchCur2PayAmtCurrency>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangedCurrency2/paymentAmount/currency"/> 
    </FpFxlExchCur2PayAmtCurrency>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangedCurrency2/paymentAmount/amount">
    <FpFxlExchCur2PayAmtAmount>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangedCurrency2/paymentAmount/amount"/> 
    </FpFxlExchCur2PayAmtAmount>
  </xsl:if>


  <xsl:if test="trade/fxSingleLeg/valueDate">
    <FpFxlValDate>
        <xsl:apply-templates select="trade/fxSingleLeg/valueDate"/> 
    </FpFxlValDate>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangeRate/quotedCurrencyPair/currency1">
    <FpFxlExchRtCurrency1>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangeRate/quotedCurrencyPair/currency1"/> 
    </FpFxlExchRtCurrency1>
  </xsl:if>


  <xsl:if test="trade/fxSingleLeg/exchangeRate/quotedCurrencyPair/currency2">
    <FpFxlExchRtCurrency2>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangeRate/quotedCurrencyPair/currency2"/> 
    </FpFxlExchRtCurrency2>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/exchangeRate/quotedCurrencyPair/quoteBasis">
    <FpFxlExchRtQotBasis>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangeRate/quotedCurrencyPair/quoteBasis"/> 
    </FpFxlExchRtQotBasis>
  </xsl:if>


  <xsl:if test="trade/fxSingleLeg/exchangeRate/rate">
    <FpFxlExchRtRate>
        <xsl:apply-templates select="trade/fxSingleLeg/exchangeRate/rate"/> 
    </FpFxlExchRtRate>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/nonDeliverableSettlement/settlementCurrency">
    <FpFxlNonDevStlCurrency>
        <xsl:apply-templates select="trade/fxSingleLeg/nonDeliverableSettlement/settlementCurrency"/> 
    </FpFxlNonDevStlCurrency>
  </xsl:if>
  

  <xsl:if test="trade/fxSingleLeg/nonDeliverableSettlement/fixing/quotedCurrencyPair/currency1">
    <FpFxlNonDevCurrency1>
        <xsl:apply-templates select="trade/fxSingleLeg/nonDeliverableSettlement/fixing/quotedCurrencyPair/currency1"/> 
    </FpFxlNonDevCurrency1>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/nonDeliverableSettlement/fixing/quotedCurrencyPair/currency2">
    <FpFxlNonDevCurrency2>
        <xsl:apply-templates select="trade/fxSingleLeg/nonDeliverableSettlement/fixing/quotedCurrencyPair/currency2"/> 
    </FpFxlNonDevCurrency2>
  </xsl:if>

  <xsl:if test="trade/fxSingleLeg/nonDeliverableSettlement/fixing/quotedCurrencyPair/quoteBasis">
    <FpFxlNonDevQotBasis>
        <xsl:apply-templates select="trade/fxSingleLeg/nonDeliverableSettlement/fixing/quotedCurrencyPair/quoteBasis"/> 
    </FpFxlNonDevQotBasis>
  </xsl:if>
  
  <!-- TULLETT-16752 -->
  <xsl:if test="trade/fxSingleLeg/nonDeliverableSettlement/fixing/fixingDate">
    <FpFxlNonDevFxDate>
        <xsl:apply-templates select="trade/fxSingleLeg/nonDeliverableSettlement/fixing/fixingDate"/> 
    </FpFxlNonDevFxDate>
  </xsl:if>


 </xsl:template>


 <xsl:template name="temp11" match="trade/allocations/allocation"><!-- template for match */trade/allocations/allocation Xparth -->

  <xsl:if test="trade/allocations/allocation/allocationTradeId/tradeId">
    <FpTrdAllcTradeID>
        <xsl:apply-templates select="trade/allocations/allocation/allocationTradeId/tradeId"/> 
    </FpTrdAllcTradeID>
	
	<!--TULLETT-16765 -->
	<xsl:variable name="AllocationTradeID" select="trade/allocations/allocation/allocationTradeId/tradeId" />
	
	<FpOrdID>
        <xsl:value-of select="substring-before($AllocationTradeID,'_')" /> 
    </FpOrdID> 
	
  </xsl:if>

  <xsl:if test="trade/allocations/allocation/accountReference">
    <FpTrdAllcRefhref>
        <xsl:value-of select="trade/allocations/allocation/accountReference/@href" /> 
    </FpTrdAllcRefhref>
  </xsl:if>

  <xsl:if test="trade/allocations/allocation/allocatedNotional/currency">
    <FpTrdAllcCurrency>
        <xsl:apply-templates select="trade/allocations/allocation/allocatedNotional/currency"/> 
    </FpTrdAllcCurrency>
  </xsl:if>

  <xsl:if test="trade/allocations/allocation/allocatedNotional/amount">
    <FpTrdAllcAmount>
        <xsl:apply-templates select="trade/allocations/allocation/allocatedNotional/amount"/> 
    </FpTrdAllcAmount>
  </xsl:if>

  <xsl:if test="trade/allocations/allocation/approvals/approval/type">
    <FpTrdAllcAppType>
        <xsl:apply-templates select="trade/allocations/allocation/approvals/approval/type"/> 
    </FpTrdAllcAppType>
  </xsl:if>

  <xsl:if test="trade/allocations/allocation/approvals/approval/status">
    <FpTrdAllcAppStatus>
        <xsl:apply-templates select="trade/allocations/allocation/approvals/approval/status"/> 
    </FpTrdAllcAppStatus>
  </xsl:if>

 </xsl:template>

 <xsl:variable name="NoOfParty" select="count(requestLimitCheck/party)" />

 <xsl:template name="temp12" match="requestLimitCheck">
  <RequestLimitCheck>

   <xsl:call-template name="temp1"/><!-- Add header template to the root template -->
   <xsl:call-template name="temp2"/><!-- Add isCorrection template to the root template -->
   <xsl:call-template name="temp3"/><!-- Add correlationId template to the root template -->
   <xsl:call-template name="temp4"/><!-- Add requestingPartyReference template to the root template -->
   <xsl:call-template name="temp5"/><!-- Add creditApprovalRequestType template to the root template -->
   <xsl:call-template name="temp6"/><!-- Add creditApprovalModel template to the root template -->
   <xsl:call-template name="temp7"/><!-- Add trade template to the root template -->
   <xsl:call-template name="temp8"/><!-- Add swap template to the root template -->
   <!--<xsl:call-template name="temp9"/-->
   <!-- Add fra template to the root template -->
   
   <xsl:call-template name="temp10"/><!-- Add fxSingleLeg template to the root template -->
   <xsl:call-template name="temp11"/><!-- Add allocations template to the root template -->

 <xsl:if test="party">
  <FpNoOfPartyIDs><xsl:value-of select="$NoOfParty"/></FpNoOfPartyIDs>

   <FpNoOfPartyID>
     <xsl:for-each select="party">

       <xsl:variable name="value">
          <xsl:copy-of select="partyId"/>
       </xsl:variable>
          
          <xsl:if test="partyId">
          <FpPartyID>
            <xsl:value-of select="@id" />
          </FpPartyID>
          </xsl:if>

          <FpPartyIDValue>
            <xsl:value-of select="$value" />
          </FpPartyIDValue>
          

      </xsl:for-each>
    </FpNoOfPartyID>
  </xsl:if>

<xsl:if test="account">

          
          <FpAccountId>
            <xsl:value-of select="account/@id" />
          </FpAccountId>
         
          
          <xsl:if test="account/accountBeneficiary">
          <FpAccountBenhref>
            <xsl:value-of select="account/accountBeneficiary/@href" />
          </FpAccountBenhref>
          </xsl:if>

          <xsl:if test="account/servicingParty">
          <FpAccountSurvPartyhref>
            <xsl:value-of select="account/servicingParty/@href" />
          </FpAccountSurvPartyhref>
          </xsl:if>

</xsl:if>

</RequestLimitCheck>
 </xsl:template>


</xsl:stylesheet>



