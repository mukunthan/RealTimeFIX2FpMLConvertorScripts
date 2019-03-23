<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="1.0"
 ><!-- Start stylesheet -->

  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

<xsl:template name="temp1" match="FpHdMsgID|FpHdSentBy|FpHdSentTo|FpHdCreateTime|FpHdExpTime">

	<xsl:if test = "FpHdMsgID|FpHdSentBy|FpHdSentTo|FpHdCreateTime|FpHdExpTime">
    <header>

      <xsl:if test = "FpHdMsgID">
        <messageId>
              <xsl:attribute name="messageIdScheme">
                <xsl:value-of select="FpHdMsgIDScheme" />
              </xsl:attribute>
          <xsl:value-of select="FpHdMsgID" />
        </messageId>
      </xsl:if>

      <xsl:if test = "FpHdSentBy">
        <sentBy>
          <xsl:value-of select="FpHdSentBy" />
        </sentBy>
      </xsl:if>

      <xsl:if test = "FpHdSentTo">
        <sendTo>
          <xsl:value-of select="FpHdSentTo" />
        </sendTo>
      </xsl:if>

      <xsl:if test = "FpHdCreateTime">
        <creationTimestamp>
          <xsl:value-of select="FpHdCreateTime" />
        </creationTimestamp>
      </xsl:if>

      <xsl:if test = "FpHdExpTime">
        <expiryTimestamp>
          <xsl:value-of select="FpHdExpTime" />
        </expiryTimestamp>
      </xsl:if>

    </header>
	</xsl:if>
  </xsl:template>

 <xsl:template name="temp2" match="FpIsCorrect">
  <xsl:if test = "FpIsCorrect"> 
    <isCorrection>
        <xsl:value-of select="FpIsCorrect" />
    </isCorrection>
  </xsl:if>
 </xsl:template>

  <xsl:template name="temp3" match="FpCorID">

    <xsl:if test="FpCorID">

      <correlationId>
              <xsl:attribute name="correlationIdScheme">
                 <xsl:value-of select="FpCorIDSch" />
              </xsl:attribute>
        <xsl:value-of select="FpCorID" />
      </correlationId>
      
    </xsl:if>

  </xsl:template>


 <xsl:template name="temp3_1" match="FpSeqNum">

    <xsl:if test="FpSeqNum">

      <sequenceNumber>
                <xsl:value-of select="FpSeqNum" />
      </sequenceNumber>
      
    </xsl:if>

  </xsl:template>


<xsl:template name="temp4" match="FpReqPartyhref">


      <requestingPartyReference>
              <xsl:attribute name="href">
                <xsl:value-of select="FpReqPartyhref" />
              </xsl:attribute>
      </requestingPartyReference>
      

  </xsl:template>

<xsl:template name="temp5" match="FpCreAppReqType">
  <xsl:if test = "FpCreAppReqType"> 
    <creditApprovalRequestType>
        <xsl:value-of select="FpCreAppReqType" />
    </creditApprovalRequestType>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp6" match="FpCreAppModel">
  <xsl:if test = "FpCreAppModel"> 
    <creditApprovalModel>
        <xsl:value-of select="FpCreAppModel" />
    </creditApprovalModel>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp7" match="FpNoOfPtyTradeIdentifier">
 <xsl:if test="FpNoOfPtyTradeIdentifier">
      
   <trade><tradeHeader>
      
	<xsl:if test="FpNoOfPtyTradeIdentifier">
       <xsl:for-each select="FpNoOfPtyTradeIdentifier/group">
       <partyTradeIdentifier>

     

        <xsl:if test="FpTrdTrdHdrPtyTrdIdfTrdID">
          <xsl:variable name="value">
            <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfTrdID"/>
         </xsl:variable>
            
            <tradeId>
                  <xsl:attribute name="tradeIdScheme">
                    <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfTrdIDSch" />
                  </xsl:attribute>
              <xsl:value-of select="$value" />
            </tradeId>
         </xsl:if>

         <xsl:if test="FpTrdTrdHdrPtyTrdIdfIssuer">
          <xsl:variable name="value2">
            <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfIssuer"/>
         </xsl:variable>
            
            <issuer>
                  <xsl:attribute name="issuerIdScheme">
                    <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfIssuerIDSch" />
                  </xsl:attribute>
              <xsl:value-of select="$value2" />
            </issuer>
         </xsl:if>

          <xsl:variable name="value2">
            <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfPtyhref"/>
         </xsl:variable>
            
            <partyReference>
                  <xsl:attribute name="href">
                    <xsl:value-of select="$value2" />
                  </xsl:attribute>
            </partyReference>

<!-- ########### -->       

		</partyTradeIdentifier>
        </xsl:for-each>
	</xsl:if>

            <partyTradeInformation>

                  <partyReference>
                        <xsl:attribute name="href">
                          <xsl:value-of select="FpPtyTrdInfoPtyRefhref" />
                        </xsl:attribute>
                  </partyReference>

            </partyTradeInformation>

          <xsl:if test = "FpTrdDate"> 

            <tradeDate>
                          <xsl:value-of select="FpTrdDate" />
            </tradeDate>

          </xsl:if>



         </tradeHeader>

      <!-- swap -->

      <xsl:if test = "FpSwpProdType|FpNoOfSwpStrm"> 
        <xsl:call-template name="temp8"/>
      </xsl:if>

      <!-- End swap -->

      <!-- fra -->

      <xsl:if test = "FpFraPayPtyhref|FpFraRcvPtyhref|FpFraAdjEffDate|FpFraAdjEffDtID|FpFraAdjTrmDate|FpFraUnAdjDate|FpFraPayDayBusDayConv|FpFraNoOfBusCntr|FpFraFxDatePrdMult|FpFraFxDatePrd|FpFratDtFxDateDayType|FpFraFxDateBusDayConv|FpFraNoOfFxDateBusCntr|FpFraFxDateRltTohref|FpFraDayCountFraction|FpFraCalcPrdNoOfDays|FpFraNotCurrency|FpFraNotAmount|FpFraFxdRate|FpFraFltRateIndex|FpFraIdxTenrPrdMult|FpFraIdxTenrPrd|FpFraDiscounting"> 
        <xsl:call-template name="temp32"/>
      </xsl:if>

      <!-- End fra -->

      <!-- fxSingleLeg -->
	   <!-- TULLETT-16752 -->
      <xsl:if test = "FpFxlProdType|FpFxlExchCur1PayPtyhref|FpFxlExchCur1RcvPtyhref|FpFxlExchCur1PayAmtCurrency|FpFxlExchCur1PayAmtAmount|FpFxlExchCur2PayPtyhref|FpFxlExchCur2RcvPtyhref|FpFxlExchCur2PayAmtCurrency|FpFxlExchCur2PayAmtAmount|FpFxlValDate|FpFxlExchRtCurrency1|FpFxlExchRtCurrency2|FpFxlExchRtQotBasis|FpFxlExchRtRate|FpFxlNonDevStlCurrency|FpFxlNonDevCurrency1|FpFxlNonDevCurrency2|FpFxlNonDevQotBasis|FpFxlNonDevFxDate"> 
        <xsl:call-template name="temp31"/>
      </xsl:if>

      <!--End  fxSingleLeg -->

       </trade>
  </xsl:if>
 </xsl:template>



  <!--###########################################-->
  <!--  swap -->

<xsl:template name="temp8" match="FpSwpProdType|FpNoOfSwpStrm">
 <swap>
<xsl:call-template name="temp8_1"/>
<xsl:call-template name="temp8_2"/>

 </swap>
</xsl:template>

 <xsl:template name="temp8_1" match="FpSwpProdType">
  <xsl:if test = "FpSwpProdType"> 
    <productType>
        <xsl:value-of select="FpSwpProdType" />
    </productType>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp8_2" match="FpNoOfSwpStrm">
  <xsl:if test = "FpNoOfSwpStrm"> 

  <xsl:for-each select="FpNoOfSwpStrm/group">


    <swapStream>

      <xsl:attribute name="id">
            <xsl:value-of select="FpSwpStrmsID"/> 
      </xsl:attribute>


		  <calculationPeriodDatesReference>
              <xsl:attribute name="href">
                 <xsl:value-of select="FpSwpPayCalPrdRef"/> 
              </xsl:attribute>
          </calculationPeriodDatesReference>

	  
          <payerPartyReference>
              <xsl:attribute name="href">
                 <xsl:value-of select="FpSwpPayPtyhref"/> 
              </xsl:attribute>
          </payerPartyReference>

          <receiverPartyReference>
              <xsl:attribute name="href">
                 <xsl:value-of select="FpSwpRcvPtyhref"/> 
              </xsl:attribute>
          </receiverPartyReference>

        <xsl:if test="FpSwpCalcPrdDatesID">
          <calculationPeriodDates>
              <xsl:attribute name="id">
                 <xsl:value-of select="FpSwpCalcPrdDatesID"/> 
              </xsl:attribute>

              <xsl:call-template name="temp9"/>
              <xsl:call-template name="temp10"/>
              <xsl:call-template name="temp11"/>
               <xsl:call-template name="temp12"/>
              <xsl:call-template name="temp13"/>
              <xsl:call-template name="temp14"/>

          </calculationPeriodDates>
        </xsl:if>      

        <xsl:if test="FpSwpPayFrqMult|FpSwpPayFrqPrd|FpSwpPayFrstPayDate|FpSwpPayLastRegPayDate|FpSwpPayRltTo|FpSwpPayDtOffSetPrdMult|FpSwpPayDtOffSetPrd|FpSwpPayDtOffSetPrdDayType|FpSwpPayDayAdjBusDayConv|FpSwpNoOfPayDayAdjBusCntr">
          <paymentDates>
             
              <xsl:call-template name="temp15"/>
              <xsl:call-template name="temp16"/>
              <xsl:call-template name="temp17"/>
              <xsl:call-template name="temp18"/>
              <xsl:call-template name="temp19"/>
              <xsl:call-template name="temp20"/>


          </paymentDates>
        </xsl:if>  

        <xsl:if test="FpSwpRsetDtsID">
          <resetDates>
              <xsl:attribute name="id">
                 <xsl:value-of select="FpSwpRsetDtsID"/> 
              </xsl:attribute>

              <xsl:call-template name="temp21"/>
              <xsl:call-template name="temp22"/>
              <xsl:call-template name="temp23"/>
              <xsl:call-template name="temp24"/>
              <xsl:call-template name="temp25"/>

          </resetDates>
        </xsl:if> 

        <xsl:if test="FpSwpCalcPrdAmtNotSchInitValue|FpSwpCalcPrdAmtNotSchCurrency|FpSwpCalcPrdAmtFltRateIndex|FpSwpCalcPrdAmtNotSchCurrency|FpSwpCalcPrdAmtInTnrPrdMult|FpSwpCalcPrdAmtInTnrPrd|FpSwpCalcPrdAmtFxdSchInitValue|FpSwpCalcPrdAmtDayCountFraction|FpSwpCalcPrdAmtCompMthd">
          <calculationPeriodAmount><calculation>
              
              <xsl:call-template name="temp26"/>
              <xsl:call-template name="temp27"/>
              <xsl:call-template name="temp28"/>
              <xsl:call-template name="temp29"/>
              <xsl:call-template name="temp30"/>
             
          </calculation></calculationPeriodAmount>
        </xsl:if> 


    </swapStream>

  </xsl:for-each>


  </xsl:if>
 </xsl:template>

<xsl:template name="temp9" match="FpSwpEffUnAdjDate|FpSwpEffBusDayConv|FpSwpNoOfEffBusCntr">
  <xsl:if test = "FpSwpEffUnAdjDate|FpSwpEffBusDayConv|FpSwpNoOfEffBusCntr"> 
  <effectiveDate>
    <xsl:call-template name="temp9_1"/>
    <xsl:call-template name="temp9_2"/>
    
  </effectiveDate>
  </xsl:if>
</xsl:template>

<xsl:template name="temp9_1" match="FpSwpEffUnAdjDate">
  <xsl:if test = "FpSwpEffUnAdjDate"> 
    <unadjustedDate>
        <xsl:value-of select="FpSwpEffUnAdjDate" />
    </unadjustedDate>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp9_2" match="FpSwpEffBusDayConv|FpSwpNoOfEffBusCntr">
  <xsl:if test = "FpSwpEffBusDayConv|FpSwpNoOfEffBusCntr">
  <dateAdjustments>
    <xsl:call-template name="temp9_2_1"/>
    <xsl:call-template name="temp9_2_2"/>
  </dateAdjustments>
  </xsl:if>
</xsl:template>

<xsl:template name="temp9_2_1" match="FpSwpEffBusDayConv">
  <xsl:if test = "FpSwpEffBusDayConv"> 
    <businessDayConvention>
        <xsl:value-of select="FpSwpEffBusDayConv" />
    </businessDayConvention>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp9_2_2" match="FpSwpNoOfEffBusCntr">
  <businessCenters>
     <xsl:for-each select="FpSwpNoOfEffBusCntr/group">

         <xsl:call-template name="temp9_2_2_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp9_2_2_1" match="FpSwpEffBusCntr">
  <xsl:if test = "FpSwpEffBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpSwpEffBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <!--terminationDate-->

<xsl:template name="temp10" match="FpSwpEndUnAdjDate|FpSwpEndBusDayConv|FpSwpNoOfEndBusCntr">
  <xsl:if test = "FpSwpEndUnAdjDate|FpSwpEndBusDayConv|FpSwpNoOfEndBusCntr">
  <terminationDate>
    <xsl:call-template name="temp10_1"/>
    <xsl:call-template name="temp10_2"/>
    
  </terminationDate>
  </xsl:if>
</xsl:template>

<xsl:template name="temp10_1" match="FpSwpEndUnAdjDate">
  <xsl:if test = "FpSwpEndUnAdjDate"> 
    <unadjustedDate>
        <xsl:value-of select="FpSwpEndUnAdjDate" />
    </unadjustedDate>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp10_2" match="FpSwpEndBusDayConv|FpSwpNoOfEndBusCntr">
  <xsl:if test = "FpSwpEndBusDayConv|FpSwpNoOfEndBusCntr">
  <dateAdjustments>
    <xsl:call-template name="temp10_2_1"/>
    <xsl:call-template name="temp10_2_2"/>
  </dateAdjustments>
  </xsl:if>
</xsl:template>

<xsl:template name="temp10_2_1" match="FpSwpEndBusDayConv">
  <xsl:if test = "FpSwpEndBusDayConv"> 
    <businessDayConvention>
        <xsl:value-of select="FpSwpEndBusDayConv" />
    </businessDayConvention>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp10_2_2" match="FpSwpNoOfEndBusCntr">
  <businessCenters>
     <xsl:for-each select="FpSwpNoOfEndBusCntr/group">

         <xsl:call-template name="temp10_2_2_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp10_2_2_1" match="FpSwpEndBusCntr">
  <xsl:if test = "FpSwpEndBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpSwpEndBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <!--calculationPeriodDatesAdjustments-->

<xsl:template name="temp11" match="FpSwpCalcPrdDtAdjBusDayConv|FpSwpNoOfCalcPrdDtAdjBusCntr">
  <xsl:if test = "FpSwpCalcPrdDtAdjBusDayConv|FpSwpNoOfCalcPrdDtAdjBusCntr">
  <calculationPeriodDatesAdjustments>
    <xsl:call-template name="temp11_1"/>
    <xsl:call-template name="temp11_2"/>
    
  </calculationPeriodDatesAdjustments>
  </xsl:if>
</xsl:template>

<xsl:template name="temp11_1" match="FpSwpCalcPrdDtAdjBusDayConv">
  <xsl:if test = "FpSwpCalcPrdDtAdjBusDayConv"> 
    <businessDayConvention>
        <xsl:value-of select="FpSwpCalcPrdDtAdjBusDayConv" />
    </businessDayConvention>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp11_2" match="FpSwpNoOfCalcPrdDtAdjBusCntr">
  <businessCenters>
     <xsl:for-each select="FpSwpNoOfCalcPrdDtAdjBusCntr/group">

         <xsl:call-template name="temp11_2_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp11_2_1" match="FpSwpCalcPrdDtAdjBusCntr">
  <xsl:if test = "FpSwpCalcPrdDtAdjBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpSwpCalcPrdDtAdjBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <!--firstRegularPeriodStartDate-->


<xsl:template name="temp12" match="FpSwpCalcPrdFrstRegPrdStartDate">
  <xsl:if test = "FpSwpCalcPrdFrstRegPrdStartDate"> 
    <firstRegularPeriodStartDate>
        <xsl:value-of select="FpSwpCalcPrdFrstRegPrdStartDate" />
    </firstRegularPeriodStartDate>
  </xsl:if>
</xsl:template>

<xsl:template name="temp13" match="FpSwpCalcPrdLastRegPrdStartDate">
  <xsl:if test = "FpSwpCalcPrdLastRegPrdStartDate"> 
    <lastRegularPeriodEndDate>
        <xsl:value-of select="FpSwpCalcPrdLastRegPrdStartDate" />
    </lastRegularPeriodEndDate>
  </xsl:if>
</xsl:template>

<!--calculationPeriodFrequency-->

<xsl:template name="temp14" match="FpSwpPrdMult|FpSwpPrd|FpSwpRollConv">
  <xsl:if test = "FpSwpPrdMult|FpSwpPrd|FpSwpRollConv">
  <calculationPeriodFrequency>
    <xsl:call-template name="temp14_1"/>
    <xsl:call-template name="temp14_2"/>
    <xsl:call-template name="temp14_3"/>
  </calculationPeriodFrequency>
  </xsl:if>
</xsl:template>

<xsl:template name="temp14_1" match="FpSwpPrdMult">
  <xsl:if test = "FpSwpPrdMult"> 
    <periodMultiplier>
        <xsl:value-of select="FpSwpPrdMult" />
    </periodMultiplier>
  </xsl:if>
</xsl:template>

<xsl:template name="temp14_2" match="FpSwpPrd">
  <xsl:if test = "FpSwpPrd"> 
    <period>
        <xsl:value-of select="FpSwpPrd" />
    </period>
  </xsl:if>
</xsl:template>

<xsl:template name="temp14_3" match="FpSwpRollConv">
  <xsl:if test = "FpSwpRollConv"> 
    <rollConvention>
        <xsl:value-of select="FpSwpRollConv" />
    </rollConvention>
  </xsl:if>
</xsl:template>

<!--paymentFrequency-->

<xsl:template name="temp15" match="FpSwpPayFrqMult|FpSwpPayFrqPrd">
  <xsl:if test = "FpSwpPayFrqMult|FpSwpPayFrqPrd">
  <paymentFrequency>
    <xsl:call-template name="temp15_1"/>
    <xsl:call-template name="temp15_2"/>
  </paymentFrequency>
  </xsl:if>
</xsl:template>

<xsl:template name="temp15_1" match="FpSwpPayFrqMult">
  <xsl:if test = "FpSwpPayFrqMult"> 
    <periodMultiplier>
        <xsl:value-of select="FpSwpPayFrqMult" />
    </periodMultiplier>
  </xsl:if>
</xsl:template>

<xsl:template name="temp15_2" match="FpSwpPayFrqPrd">
  <xsl:if test = "FpSwpPayFrqPrd"> 
    <period>
        <xsl:value-of select="FpSwpPayFrqPrd" />
    </period>
  </xsl:if>
</xsl:template>

<xsl:template name="temp16" match="FpSwpPayFrstPayDate">
  <xsl:if test = "FpSwpPayFrstPayDate"> 
    <firstPaymentDate>
        <xsl:value-of select="FpSwpPayFrstPayDate" />
    </firstPaymentDate>
  </xsl:if>
</xsl:template>

<xsl:template name="temp17" match="FpSwpPayLastRegPayDate">
  <xsl:if test = "FpSwpPayLastRegPayDate"> 
    <lastRegularPaymentDate>
        <xsl:value-of select="FpSwpPayLastRegPayDate" />
    </lastRegularPaymentDate>
  </xsl:if>
</xsl:template>

<xsl:template name="temp18" match="FpSwpPayRltTo">
  <xsl:if test = "FpSwpPayRltTo"> 
    <payRelativeTo>
        <xsl:value-of select="FpSwpPayRltTo" />
    </payRelativeTo>
  </xsl:if>
</xsl:template>

<!--paymentDaysOffset-->

<xsl:template name="temp19" match="FpSwpPayDtOffSetPrdMult|FpSwpPayDtOffSetPrd|FpSwpPayDtOffSetPrdDayType">
  <xsl:if test = "FpSwpPayDtOffSetPrdMult|FpSwpPayDtOffSetPrd|FpSwpPayDtOffSetPrdDayType"> 
  <paymentDaysOffset>
    <xsl:call-template name="temp19_1"/>
    <xsl:call-template name="temp19_2"/>
    <xsl:call-template name="temp19_3"/>
  </paymentDaysOffset>
</xsl:if>
</xsl:template>

<xsl:template name="temp19_1" match="FpSwpPayDtOffSetPrdMult">
  <xsl:if test = "FpSwpPayDtOffSetPrdMult"> 
    <periodMultiplier>
        <xsl:value-of select="FpSwpPayDtOffSetPrdMult" />
    </periodMultiplier>
  </xsl:if>
</xsl:template>

<xsl:template name="temp19_2" match="FpSwpPayDtOffSetPrd">
  <xsl:if test = "FpSwpPayDtOffSetPrd"> 
    <period>
        <xsl:value-of select="FpSwpPayDtOffSetPrd" />
    </period>
  </xsl:if>
</xsl:template>

<xsl:template name="temp19_3" match="FpSwpPayDtOffSetPrdDayType">
  <xsl:if test = "FpSwpPayDtOffSetPrdDayType"> 
    <dayType>
        <xsl:value-of select="FpSwpPayDtOffSetPrdDayType" />
    </dayType>
  </xsl:if>
</xsl:template>

<!--paymentDatesAdjustments-->


<xsl:template name="temp20" match="FpSwpPayDayAdjBusDayConv|FpSwpNoOfPayDayAdjBusCntr">
  <xsl:if test = "FpSwpPayDayAdjBusDayConv|FpSwpNoOfPayDayAdjBusCntr">
  <paymentDatesAdjustments>
    <xsl:call-template name="temp20_1"/>
    <xsl:call-template name="temp20_2"/>
    
  </paymentDatesAdjustments>
  </xsl:if>
</xsl:template>

<xsl:template name="temp20_1" match="FpSwpPayDayAdjBusDayConv">
  <xsl:if test = "FpSwpPayDayAdjBusDayConv"> 
    <businessDayConvention>
        <xsl:value-of select="FpSwpPayDayAdjBusDayConv" />
    </businessDayConvention>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp20_2" match="FpSwpNoOfPayDayAdjBusCntr">
  <businessCenters>
     <xsl:for-each select="FpSwpNoOfPayDayAdjBusCntr/group">

         <xsl:call-template name="temp20_2_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp20_2_1" match="FpSwpPayDayAdjBusCntr">
  <xsl:if test = "FpSwpPayDayAdjBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpSwpPayDayAdjBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <!--calculationPeriodDatesReference-->

 <xsl:template name="temp21" match="FpSwpRsetDtsCalcPrdDateRef">

    <xsl:if test="FpSwpRsetDtsCalcPrdDateRef">

      <calculationPeriodDatesReference>
        <xsl:if test="FpSwpRsetDtsCalcPrdDateRef">
              <xsl:attribute name="href">
                <xsl:value-of select="FpSwpRsetDtsCalcPrdDateRef" />
              </xsl:attribute>
        </xsl:if>
      </calculationPeriodDatesReference>
      
    </xsl:if>

  </xsl:template>

 <xsl:template name="temp22" match="FpSwpRsetDtRltTo">
  <xsl:if test = "FpSwpRsetDtRltTo"> 
    <resetRelativeTo>
        <xsl:value-of select="FpSwpRsetDtRltTo" />
    </resetRelativeTo>
  </xsl:if>
 </xsl:template>

 <!--fixingDates-->


 <xsl:template name="temp23" match="FpSwpRsetDtFxDatePrdMult|FpSwpRsetDtFxDatePrd|FpSwpRsetDtFxDateDayType|FpSwpRsetDtFxDateBusDayConv|FpSwpNoOfsetDtFxDateBusCntr">
  <xsl:if test = "FpSwpRsetDtFxDatePrdMult|FpSwpRsetDtFxDatePrd|FpSwpRsetDtFxDateDayType|FpSwpRsetDtFxDateBusDayConv|FpSwpNoOfsetDtFxDateBusCntr">
  <fixingDates>
    <xsl:call-template name="temp23_1"/>
    <xsl:call-template name="temp23_2"/>
    <xsl:call-template name="temp23_3"/>
    <xsl:call-template name="temp23_4"/>
    <xsl:call-template name="temp23_5"/>
    <xsl:call-template name="temp23_6"/>
    
  </fixingDates>
  </xsl:if>
</xsl:template>

<xsl:template name="temp23_1" match="FpSwpRsetDtFxDatePrdMult">
  <xsl:if test = "FpSwpRsetDtFxDatePrdMult"> 
    <periodMultiplier>
        <xsl:value-of select="FpSwpRsetDtFxDatePrdMult" />
    </periodMultiplier>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp23_2" match="FpSwpRsetDtFxDatePrd">
  <xsl:if test = "FpSwpRsetDtFxDatePrd"> 
    <period>
        <xsl:value-of select="FpSwpRsetDtFxDatePrd" />
    </period>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp23_3" match="FpSwpRsetDtFxDateDayType">
  <xsl:if test = "FpSwpRsetDtFxDateDayType"> 
    <dayType>
        <xsl:value-of select="FpSwpRsetDtFxDateDayType" />
    </dayType>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp23_4" match="FpSwpRsetDtFxDateBusDayConv">
  <xsl:if test = "FpSwpRsetDtFxDateBusDayConv"> 
    <businessDayConvention>
        <xsl:value-of select="FpSwpRsetDtFxDateBusDayConv" />
    </businessDayConvention>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp23_5" match="FpSwpNoOfsetDtFxDateBusCntr">
  <businessCenters>
     <xsl:for-each select="FpSwpNoOfsetDtFxDateBusCntr/group">

         <xsl:call-template name="temp23_5_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp23_5_1" match="FpSwpsetDtFxDateBusCntr">
  <xsl:if test = "FpSwpsetDtFxDateBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpSwpsetDtFxDateBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp23_6" match="FpSwpRsetDtFxDateRltTohref">


      <dateRelativeTo>
              <xsl:attribute name="href">
                <xsl:value-of select="FpSwpRsetDtFxDateRltTohref" />
              </xsl:attribute>
      </dateRelativeTo>

  </xsl:template>

  <!--resetFrequency-->

<xsl:template name="temp24" match="FpSwpRsetDtFrqPrdMult|FpSwpRsetDtFrqPrd">
  <xsl:if test = "FpSwpRsetDtFrqPrdMult|FpSwpRsetDtFrqPrd"> 
  <resetFrequency>
    <xsl:call-template name="temp24_1"/>
    <xsl:call-template name="temp24_2"/>
  </resetFrequency>
</xsl:if>
</xsl:template>

<xsl:template name="temp24_1" match="FpSwpRsetDtFrqPrdMult">
  <xsl:if test = "FpSwpRsetDtFrqPrdMult"> 
    <periodMultiplier>
        <xsl:value-of select="FpSwpRsetDtFrqPrdMult" />
    </periodMultiplier>
  </xsl:if>
</xsl:template>

<xsl:template name="temp24_2" match="FpSwpRsetDtFrqPrd">
  <xsl:if test = "FpSwpRsetDtFrqPrd"> 
    <period>
        <xsl:value-of select="FpSwpRsetDtFrqPrd" />
    </period>
  </xsl:if>
</xsl:template>

<!--resetDatesAdjustments-->

<xsl:template name="temp25" match="FpSwpRsetDtAdjBusDayConv|FpSwpNoOfsetDtAdjBusCntr">
  <xsl:if test = "FpSwpRsetDtAdjBusDayConv|FpSwpNoOfsetDtAdjBusCntr">
  <resetDatesAdjustments>
    <xsl:call-template name="temp25_1"/>
    <xsl:call-template name="temp25_2"/>
    
  </resetDatesAdjustments>
  </xsl:if>
</xsl:template>

<xsl:template name="temp25_1" match="FpSwpRsetDtAdjBusDayConv">
  <xsl:if test = "FpSwpRsetDtAdjBusDayConv"> 
    <businessDayConvention>
        <xsl:value-of select="FpSwpRsetDtAdjBusDayConv" />
    </businessDayConvention>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp25_2" match="FpSwpNoOfsetDtAdjBusCntr">
  <businessCenters>
     <xsl:for-each select="FpSwpNoOfsetDtAdjBusCntr/group">

         <xsl:call-template name="temp25_2_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp25_2_1" match="FpSwpRsetDtAdjBusCntr">
  <xsl:if test = "FpSwpRsetDtAdjBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpSwpRsetDtAdjBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <!--notionalSchedule-->

 <xsl:template name="temp26" match="FpSwpCalcPrdAmtNotSchInitValue|FpSwpCalcPrdAmtNotSchCurrency">
  <xsl:if test = "FpSwpCalcPrdAmtNotSchInitValue|FpSwpCalcPrdAmtNotSchCurrency"> 
  <notionalSchedule><notionalStepSchedule>
    <xsl:call-template name="temp26_1"/>
    <xsl:call-template name="temp26_2"/>
  </notionalStepSchedule></notionalSchedule>
</xsl:if>
</xsl:template>

<xsl:template name="temp26_1" match="FpSwpCalcPrdAmtNotSchInitValue">
  <xsl:if test = "FpSwpCalcPrdAmtNotSchInitValue"> 
    <initialValue>
        <xsl:value-of select="FpSwpCalcPrdAmtNotSchInitValue" />
    </initialValue>
  </xsl:if>
</xsl:template>

<xsl:template name="temp26_2" match="FpSwpCalcPrdAmtNotSchCurrency">
  <xsl:if test = "FpSwpCalcPrdAmtNotSchCurrency"> 
    <currency>
        <xsl:value-of select="FpSwpCalcPrdAmtNotSchCurrency" />
    </currency>
  </xsl:if>
</xsl:template>

<!--floatingRateCalculation-->

<xsl:template name="temp27" match="FpSwpCalcPrdAmtFltRateIndex|FpSwpCalcPrdAmtNotSchCurrency|FpSwpCalcPrdAmtInTnrPrdMult|FpSwpCalcPrdAmtInTnrPrd">
  <xsl:if test = "FpSwpCalcPrdAmtFltRateIndex|FpSwpCalcPrdAmtNotSchCurrency"> 
  <floatingRateCalculation>
    <xsl:call-template name="temp27_1"/>
    <xsl:call-template name="temp27_2"/>
  </floatingRateCalculation>
</xsl:if>
</xsl:template>

<xsl:template name="temp27_1" match="FpSwpCalcPrdAmtFltRateIndex">
  <xsl:if test = "FpSwpCalcPrdAmtFltRateIndex"> 
    <floatingRateIndex>
        <xsl:value-of select="FpSwpCalcPrdAmtFltRateIndex" />
    </floatingRateIndex>
  </xsl:if>
</xsl:template>

<xsl:template name="temp27_2" match="FpSwpCalcPrdAmtInTnrPrdMult|FpSwpCalcPrdAmtInTnrPrd">
<xsl:if test = "FpSwpCalcPrdAmtInTnrPrdMult|FpSwpCalcPrdAmtInTnrPrd"> 
  <indexTenor>
    <xsl:call-template name="temp27_2_1"/>
    <xsl:call-template name="temp27_2_2"/>
  </indexTenor>
</xsl:if>
</xsl:template>

<xsl:template name="temp27_2_1" match="FpSwpCalcPrdAmtInTnrPrdMult">
  <xsl:if test = "FpSwpCalcPrdAmtInTnrPrdMult"> 
    <periodMultiplier>
        <xsl:value-of select="FpSwpCalcPrdAmtInTnrPrdMult" />
    </periodMultiplier>
  </xsl:if>
</xsl:template>

<xsl:template name="temp27_2_2" match="FpSwpCalcPrdAmtInTnrPrd">
  <xsl:if test = "FpSwpCalcPrdAmtInTnrPrd"> 
    <period>
        <xsl:value-of select="FpSwpCalcPrdAmtInTnrPrd" />
    </period>
  </xsl:if>
</xsl:template>

<!--fixedRateSchedule-->

<xsl:template name="temp28" match="FpSwpCalcPrdAmtFxdSchInitValue">
  <xsl:if test = "FpSwpCalcPrdAmtFxdSchInitValue"> 
  <fixedRateSchedule><initialValue>

            <xsl:value-of select="FpSwpCalcPrdAmtFxdSchInitValue" />
   
  </initialValue></fixedRateSchedule>
</xsl:if>
</xsl:template>

<!--eeeeeeeeee-->

<xsl:template name="temp29" match="FpSwpCalcPrdAmtDayCountFraction">
  <xsl:if test = "FpSwpCalcPrdAmtDayCountFraction"> 
  <dayCountFraction>
            <xsl:value-of select="FpSwpCalcPrdAmtDayCountFraction" />
   
  </dayCountFraction>
</xsl:if>
</xsl:template>

<xsl:template name="temp30" match="FpSwpCalcPrdAmtCompMthd">
  <xsl:if test = "FpSwpCalcPrdAmtCompMthd"> 
  <compoundingMethod>

            <xsl:value-of select="FpSwpCalcPrdAmtCompMthd" />
   
  </compoundingMethod>
</xsl:if>
</xsl:template>

<!-- End swap -->

<!--  fxSingleLeg -->
<!-- TULLETT-16752 -->
<xsl:template name="temp31" match="FpFxlProdType|FpFxlExchCur1PayPtyhref|FpFxlExchCur1RcvPtyhref|FpFxlExchCur1PayAmtCurrency|FpFxlExchCur1PayAmtAmount|FpFxlExchCur2PayPtyhref|FpFxlExchCur2RcvPtyhref|FpFxlExchCur2PayAmtCurrency|FpFxlExchCur2PayAmtAmount|FpFxlValDate|FpFxlExchRtCurrency1|FpFxlExchRtCurrency2|FpFxlExchRtQotBasis|FpFxlExchRtRate|FpFxlNonDevStlCurrency|FpFxlNonDevCurrency1|FpFxlNonDevCurrency2|FpFxlNonDevQotBasis|FpFxlNonDevFxDate">
<xsl:if test = "FpFxlProdType|FpFxlExchCur1PayPtyhref|FpFxlExchCur1RcvPtyhref|FpFxlExchCur1PayAmtCurrency|FpFxlExchCur1PayAmtAmount|FpFxlExchCur2PayPtyhref|FpFxlExchCur2RcvPtyhref|FpFxlExchCur2PayAmtCurrency|FpFxlExchCur2PayAmtAmount|FpFxlValDate|FpFxlExchRtCurrency1|FpFxlExchRtCurrency2|FpFxlExchRtQotBasis|FpFxlExchRtRate|FpFxlNonDevStlCurrency|FpFxlNonDevCurrency1|FpFxlNonDevCurrency2|FpFxlNonDevQotBasis|FpFxlNonDevFxDate"> 
  <fxSingleLeg>
    <xsl:call-template name="temp31_1"/>
    <xsl:call-template name="temp31_2"/>
    <xsl:call-template name="temp31_3"/>
    <xsl:call-template name="temp31_4"/>
    <xsl:call-template name="temp31_5"/>
    <xsl:call-template name="temp31_6"/>
  </fxSingleLeg>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_1" match="FpFxlProdType">
  <xsl:if test = "FpFxlProdType"> 
  <productType>

            <xsl:value-of select="FpFxlProdType" />
   
  </productType>
</xsl:if>
</xsl:template>

<!--exchangedCurrency1-->

<xsl:template name="temp31_2" match="FpFxlExchCur1PayPtyhref|FpFxlExchCur1RcvPtyhref|FpFxlExchCur1PayAmtCurrency|FpFxlExchCur1PayAmtAmount">
<xsl:if test = "FpFxlExchCur1PayPtyhref|FpFxlExchCur1RcvPtyhref|FpFxlExchCur1PayAmtCurrency|FpFxlExchCur1PayAmtAmount"> 
  <exchangedCurrency1>
    <xsl:call-template name="temp31_2_1"/>
    <xsl:call-template name="temp31_2_2"/>
    <xsl:call-template name="temp31_2_3"/>
  </exchangedCurrency1>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_2_1" match="FpFxlExchCur1PayPtyhref">
  <payerPartyReference>

            <xsl:attribute name="href">
                <xsl:value-of select="FpFxlExchCur1PayPtyhref" />
              </xsl:attribute>
   
  </payerPartyReference>
</xsl:template>

<xsl:template name="temp31_2_2" match="FpFxlExchCur1RcvPtyhref">
  <receiverPartyReference>

            <xsl:attribute name="href">
                <xsl:value-of select="FpFxlExchCur1RcvPtyhref" />
              </xsl:attribute>
   
  </receiverPartyReference>
</xsl:template>
  
 <!--paymentAmount-->

 <xsl:template name="temp31_2_3" match="FpFxlExchCur1PayAmtCurrency|FpFxlExchCur1PayAmtAmount">
<xsl:if test = "FpFxlExchCur1PayAmtCurrency|FpFxlExchCur1PayAmtAmount"> 
  <paymentAmount>
    <xsl:call-template name="temp31_2_3_1"/>
    <xsl:call-template name="temp31_2_3_2"/>
  </paymentAmount>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_2_3_1" match="FpFxlExchCur1PayAmtCurrency">
  <xsl:if test = "FpFxlExchCur1PayAmtCurrency"> 
  <currency>

                <xsl:value-of select="FpFxlExchCur1PayAmtCurrency" />
   
  </currency>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_2_3_2" match="FpFxlExchCur1PayAmtAmount">
  <xsl:if test = "FpFxlExchCur1PayAmtAmount"> 
  <amount>

                <xsl:value-of select="FpFxlExchCur1PayAmtAmount" />
   
  </amount>
</xsl:if>
</xsl:template>

<!--######################################-->

<!--exchangedCurrency2-->

<xsl:template name="temp31_3" match="FpFxlExchCur2PayPtyhref|FpFxlExchCur2RcvPtyhref|FpFxlExchCur2PayAmtCurrency|FpFxlExchCur2PayAmtAmount">
<xsl:if test = "FpFxlExchCur2PayPtyhref|FpFxlExchCur2RcvPtyhref|FpFxlExchCur2PayAmtCurrency|FpFxlExchCur2PayAmtAmount"> 
  <exchangedCurrency2>
    <xsl:call-template name="temp31_3_1"/>
    <xsl:call-template name="temp31_3_2"/>
    <xsl:call-template name="temp31_3_3"/>
  </exchangedCurrency2>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_3_1" match="FpFxlExchCur2PayPtyhref">
  <payerPartyReference>

            <xsl:attribute name="href">
                <xsl:value-of select="FpFxlExchCur2PayPtyhref" />
              </xsl:attribute>
   
  </payerPartyReference>
</xsl:template>

<xsl:template name="temp31_3_2" match="FpFxlExchCur2RcvPtyhref">
  <receiverPartyReference>

            <xsl:attribute name="href">
                <xsl:value-of select="FpFxlExchCur2RcvPtyhref" />
              </xsl:attribute>
   
  </receiverPartyReference>
</xsl:template>
  
 <!--paymentAmount-->

 <xsl:template name="temp31_3_3" match="FpFxlExchCur2PayAmtCurrency|FpFxlExchCur2PayAmtAmount">
<xsl:if test = "FpFxlExchCur2PayAmtCurrency|FpFxlExchCur2PayAmtAmount"> 
  <paymentAmount>
    <xsl:call-template name="temp31_3_3_1"/>
    <xsl:call-template name="temp31_3_3_2"/>
  </paymentAmount>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_3_3_1" match="FpFxlExchCur2PayAmtCurrency">
  <xsl:if test = "FpFxlExchCur2PayAmtCurrency"> 
  <currency>

                <xsl:value-of select="FpFxlExchCur2PayAmtCurrency" />
   
  </currency>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_3_3_2" match="FpFxlExchCur2PayAmtAmount">
  <xsl:if test = "FpFxlExchCur2PayAmtAmount"> 
  <amount>

                <xsl:value-of select="FpFxlExchCur2PayAmtAmount" />
   
  </amount>
</xsl:if>
</xsl:template>

 <!--valueDate-->

 <xsl:template name="temp31_4" match="FpFxlValDate">
  <xsl:if test = "FpFxlValDate"> 
  <valueDate>

         <xsl:value-of select="FpFxlValDate" />
   
  </valueDate>
</xsl:if>
</xsl:template>


<!--######################################-->

<!--exchangeRate-->

<xsl:template name="temp31_5" match="FpFxlExchRtCurrency1|FpFxlExchRtCurrency2|FpFxlExchRtQotBasis|FpFxlExchRtRate">
<xsl:if test = "FpFxlExchRtCurrency1|FpFxlExchRtCurrency2|FpFxlExchRtQotBasis|FpFxlExchRtRate"> 
  <exchangeRate>
    <xsl:call-template name="temp31_5_1"/>
    <xsl:call-template name="temp31_5_2"/>
  </exchangeRate>
</xsl:if>
</xsl:template>

 <!--quotedCurrencyPair-->

 <xsl:template name="temp31_5_1" match="FpFxlExchRtCurrency1|FpFxlExchRtCurrency2|FpFxlExchRtQotBasis">
<xsl:if test = "FpFxlExchRtCurrency1|FpFxlExchRtCurrency2|FpFxlExchRtQotBasis"> 
  <quotedCurrencyPair>
    <xsl:call-template name="temp31_5_1_1"/>
    <xsl:call-template name="temp31_5_1_2"/>
    <xsl:call-template name="temp31_5_1_3"/>
  </quotedCurrencyPair>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_5_1_1" match="FpFxlExchRtCurrency1">
  <xsl:if test = "FpFxlExchRtCurrency1"> 
  <currency1>

                <xsl:value-of select="FpFxlExchRtCurrency1" />
   
  </currency1>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_5_1_2" match="FpFxlExchRtCurrency2">
  <xsl:if test = "FpFxlExchRtCurrency2"> 
  <currency2>

                <xsl:value-of select="FpFxlExchRtCurrency2" />
   
  </currency2>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_5_1_3" match="FpFxlExchRtQotBasis">
  <xsl:if test = "FpFxlExchRtQotBasis"> 
  <quoteBasis>

                <xsl:value-of select="FpFxlExchRtQotBasis" />
   
  </quoteBasis>
</xsl:if>
</xsl:template>

<!--rate-->

<xsl:template name="temp31_5_2" match="FpFxlExchRtRate">
  <xsl:if test = "FpFxlExchRtRate"> 
  <rate>

                <xsl:value-of select="FpFxlExchRtRate" />
   
  </rate>
</xsl:if>
</xsl:template>


<!--###############################################-->

<!--nonDeliverableSettlement-->
<!-- TULLETT-16752 -->
<xsl:template name="temp31_6" match="FpFxlNonDevStlCurrency|FpFxlNonDevCurrency1|FpFxlNonDevCurrency2|FpFxlNonDevQotBasis|FpFxlNonDevFxDate">
<xsl:if test = "FpFxlNonDevStlCurrency|FpFxlNonDevCurrency1|FpFxlNonDevCurrency2|FpFxlNonDevQotBasis|FpFxlNonDevFxDate"> 
  <nonDeliverableSettlement>
    <xsl:call-template name="temp31_6_1"/>
    <xsl:call-template name="temp31_6_2"/>
  </nonDeliverableSettlement>
</xsl:if>
</xsl:template>

<!--settlementCurrency-->

<xsl:template name="temp31_6_1" match="FpFxlNonDevStlCurrency">
  <xsl:if test = "FpFxlNonDevStlCurrency"> 
  <settlementCurrency>

                <xsl:value-of select="FpFxlNonDevStlCurrency" />
   
  </settlementCurrency>
</xsl:if>
</xsl:template>

 <!--fixing-->

 <xsl:template name="temp31_6_2" match="FpFxlNonDevCurrency1|FpFxlNonDevCurrency2|FpFxlNonDevQotBasis">
<xsl:if test = "FpFxlNonDevCurrency1|FpFxlNonDevCurrency2|FpFxlNonDevQotBasis"> 
  <fixing>
    <quotedCurrencyPair>
		<xsl:call-template name="temp31_6_2_1"/>
		<xsl:call-template name="temp31_6_2_2"/>
		<xsl:call-template name="temp31_6_2_3"/>
  </quotedCurrencyPair>
  
  <!-- TULLETT-16752 -->
	<xsl:if test = "FpFxlNonDevFxDate"> 
		<fixingDate>
			<xsl:value-of select="FpFxlNonDevFxDate" />
		</fixingDate>
	</xsl:if>
	
  </fixing>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_6_2_1" match="FpFxlNonDevCurrency1">
  <xsl:if test = "FpFxlNonDevCurrency1"> 
  <currency1>

                <xsl:value-of select="FpFxlNonDevCurrency1" />
   
  </currency1>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_6_2_2" match="FpFxlNonDevCurrency2">
  <xsl:if test = "FpFxlNonDevCurrency2"> 
  <currency2>

                <xsl:value-of select="FpFxlNonDevCurrency2" />
   
  </currency2>
</xsl:if>
</xsl:template>

<xsl:template name="temp31_6_2_3" match="FpFxlNonDevQotBasis">
  <xsl:if test = "FpFxlNonDevQotBasis"> 
  <quoteBasis>

                <xsl:value-of select="FpFxlNonDevQotBasis" />
   
  </quoteBasis>
</xsl:if>
</xsl:template>

<!--###############################################-->
<!--fra-->

<xsl:template name="temp32" match="FpFraPayPtyhref|FpFraRcvPtyhref|FpFraAdjEffDate|FpFraAdjEffDtID|FpFraAdjTrmDate|FpFraUnAdjDate|FpFraPayDayBusDayConv|FpFraNoOfBusCntr|FpFraFxDatePrdMult|FpFraFxDatePrd|FpFratDtFxDateDayType|FpFraFxDateBusDayConv|FpFraNoOfFxDateBusCntr|FpFraFxDateRltTohref|FpFraDayCountFraction|FpFraCalcPrdNoOfDays|FpFraNotCurrency|FpFraNotAmount|FpFraFxdRate|FpFraFltRateIndex|FpFraIdxTenrPrdMult|FpFraIdxTenrPrd|FpFraDiscounting">
<xsl:if test = "FpFraPayPtyhref|FpFraRcvPtyhref|FpFraAdjEffDate|FpFraAdjEffDtID|FpFraAdjTrmDate|FpFraUnAdjDate|FpFraPayDayBusDayConv|FpFraNoOfBusCntr|FpFraFxDatePrdMult|FpFraFxDatePrd|FpFratDtFxDateDayType|FpFraFxDateBusDayConv|FpFraNoOfFxDateBusCntr|FpFraFxDateRltTohref|FpFraDayCountFraction|FpFraCalcPrdNoOfDays|FpFraNotCurrency|FpFraNotAmount|FpFraFxdRate|FpFraFltRateIndex|FpFraIdxTenrPrdMult|FpFraIdxTenrPrd|FpFraDiscounting"> 
  <fra>

    <xsl:call-template name="temp32_1"/>
    <xsl:call-template name="temp32_2"/>
    <xsl:call-template name="temp32_3"/>
    <xsl:call-template name="temp32_4"/>
    <xsl:call-template name="temp32_5"/>
    <xsl:call-template name="temp32_6"/>
    <xsl:call-template name="temp32_7"/>
    <xsl:call-template name="temp32_8"/>
    <xsl:call-template name="temp32_9"/>
    <xsl:call-template name="temp32_10"/>
    <xsl:call-template name="temp32_11"/>
    <xsl:call-template name="temp32_12"/>
    <xsl:call-template name="temp32_13"/>

  </fra>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_1" match="FpFraPayPtyhref">
  <buyerPartyReference>

            <xsl:attribute name="href">
                <xsl:value-of select="FpFraPayPtyhref" />
              </xsl:attribute>
   
  </buyerPartyReference>
</xsl:template>

<xsl:template name="temp32_2" match="FpFraRcvPtyhref">
  <sellerPartyReference>

            <xsl:attribute name="href">
                <xsl:value-of select="FpFraRcvPtyhref" />
              </xsl:attribute>
   
  </sellerPartyReference>
</xsl:template>

<xsl:template name="temp32_3" match="FpFraAdjEffDate|FpFraAdjEffDtID">
  <xsl:if test = "FpFraAdjEffDate|FpFraAdjEffDtID"> 
  <adjustedEffectiveDate>

            <xsl:attribute name="id">
                <xsl:value-of select="FpFraAdjEffDtID" />
              </xsl:attribute>
      <xsl:value-of select="FpFraAdjEffDate" />
  </adjustedEffectiveDate>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_4" match="FpFraAdjTrmDate">
  <xsl:if test = "FpFraAdjTrmDate"> 
  <adjustedTerminationDate>

                <xsl:value-of select="FpFraAdjTrmDate" />
   
  </adjustedTerminationDate>
</xsl:if>
</xsl:template>

<!--paymentDate-->

<xsl:template name="temp32_5" match="FpFraUnAdjDate|FpFraPayDayBusDayConv|FpFraNoOfBusCntr">
<xsl:if test = "FpFraUnAdjDate|FpFraPayDayBusDayConv|FpFraNoOfBusCntr"> 
  <paymentDate>

    <xsl:call-template name="temp32_5_1"/>
    <xsl:call-template name="temp32_5_2"/>

  </paymentDate>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_5_1" match="FpFraUnAdjDate">
  <xsl:if test = "FpFraUnAdjDate"> 
  <unadjustedDate>

                <xsl:value-of select="FpFraUnAdjDate" />
   
  </unadjustedDate>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_5_2" match="FpFraPayDayBusDayConv|FpFraNoOfBusCntr">
<xsl:if test = "FpFraPayDayBusDayConv|FpFraNoOfBusCntr"> 
  <dateAdjustments>

    <xsl:call-template name="temp32_5_2_1"/>
    <xsl:call-template name="temp32_5_2_2"/>

  </dateAdjustments>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_5_2_1" match="FpFraPayDayBusDayConv">
  <xsl:if test = "FpFraPayDayBusDayConv"> 
  <businessDayConvention>

                <xsl:value-of select="FpFraPayDayBusDayConv" />
   
  </businessDayConvention>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_5_2_2" match="FpFraNoOfBusCntr">
  <businessCenters>
     <xsl:for-each select="FpFraNoOfBusCntr/group">

         <xsl:call-template name="temp32_5_2_2_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp32_5_2_2_1" match="FpFraEffBusCntr">
  <xsl:if test = "FpFraEffBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpFraEffBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <!--fixingDateOffset-->

<xsl:template name="temp32_6" match="FpFraFxDatePrdMult|FpFraFxDatePrd|FpFratDtFxDateDayType|FpFraFxDateBusDayConv|FpFraNoOfFxDateBusCntr|FpFraFxDateRltTohref">
<xsl:if test = "FpFraFxDatePrdMult|FpFraFxDatePrd|FpFratDtFxDateDayType|FpFraFxDateBusDayConv|FpFraNoOfFxDateBusCntr|FpFraFxDateRltTohref"> 
  <fixingDateOffset>

    <xsl:call-template name="temp32_6_1"/>
    <xsl:call-template name="temp32_6_2"/>
    <xsl:call-template name="temp32_6_3"/>
    <xsl:call-template name="temp32_6_4"/>
    <xsl:call-template name="temp32_6_5"/>
    <xsl:call-template name="temp32_6_6"/>

  </fixingDateOffset>
</xsl:if>
</xsl:template>

 <xsl:template name="temp32_6_1" match="FpFraFxDatePrdMult">
  <xsl:if test = "FpFraFxDatePrdMult"> 
    <periodMultiplier>
        <xsl:value-of select="FpFraFxDatePrdMult" />
    </periodMultiplier>
  </xsl:if>
 </xsl:template>

  <xsl:template name="temp32_6_2" match="FpFraFxDatePrd">
  <xsl:if test = "FpFraFxDatePrd"> 
    <period>
        <xsl:value-of select="FpFraFxDatePrd" />
    </period>
  </xsl:if>
 </xsl:template>

<xsl:template name="temp32_6_3" match="FpFratDtFxDateDayType">
  <xsl:if test = "FpFratDtFxDateDayType"> 
    <dayType>
        <xsl:value-of select="FpFratDtFxDateDayType" />
    </dayType>
  </xsl:if>
 </xsl:template>

 <xsl:template name="temp32_6_4" match="FpFraFxDateBusDayConv">
  <xsl:if test = "FpFraFxDateBusDayConv"> 
    <businessDayConvention>
        <xsl:value-of select="FpFraFxDateBusDayConv" />
    </businessDayConvention>
  </xsl:if>
 </xsl:template>

<!--businessCenters-->

 <xsl:template name="temp32_6_5" match="FpFraNoOfFxDateBusCntr">
  <businessCenters>
     <xsl:for-each select="FpFraNoOfFxDateBusCntr/group">

         <xsl:call-template name="temp32_6_5_1"/>

      </xsl:for-each>
  </businessCenters>

</xsl:template>

 <xsl:template name="temp32_6_5_1" match="FpFraFxDateBusCntr">
  <xsl:if test = "FpFraFxDateBusCntr"> 
    <businessCenter>
        <xsl:value-of select="FpFraFxDateBusCntr" />
    </businessCenter>
  </xsl:if>
 </xsl:template>

 <!--dateRelativeTo-->

<xsl:template name="temp32_6_6" match="FpFraFxDateRltTohref">
  <dateRelativeTo>

            <xsl:attribute name="href">
                <xsl:value-of select="FpFraFxDateRltTohref" />
            </xsl:attribute>

  </dateRelativeTo>
</xsl:template>

<!--dayCountFraction-->

<xsl:template name="temp32_7" match="FpFraDayCountFraction">
  <xsl:if test = "FpFraDayCountFraction"> 
  <dayCountFraction>

                <xsl:value-of select="FpFraDayCountFraction" />
   
  </dayCountFraction>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_8" match="FpFraCalcPrdNoOfDays">
  <xsl:if test = "FpFraCalcPrdNoOfDays"> 
  <calculationPeriodNumberOfDays>

                <xsl:value-of select="FpFraCalcPrdNoOfDays" />
   
  </calculationPeriodNumberOfDays>
</xsl:if>
</xsl:template>

<!--notional-->

<xsl:template name="temp32_9" match="FpFraNotCurrency|FpFraNotAmount">
<xsl:if test = "FpFraNotCurrency|FpFraNotAmount"> 
  <notional>

    <xsl:call-template name="temp32_9_1"/>
    <xsl:call-template name="temp32_9_2"/>

  </notional>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_9_1" match="FpFraNotCurrency">
  <xsl:if test = "FpFraNotCurrency"> 
  <currency>

                <xsl:value-of select="FpFraNotCurrency" />
   
  </currency>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_9_2" match="FpFraNotAmount">
  <xsl:if test = "FpFraNotAmount"> 
  <amount>

                <xsl:value-of select="FpFraNotAmount" />
   
  </amount>
</xsl:if>
</xsl:template>

<!--fixedRate-->

<xsl:template name="temp32_10" match="FpFraFxdRate">
  <xsl:if test = "FpFraFxdRate"> 
  <fixedRate>

                <xsl:value-of select="FpFraFxdRate" />
   
  </fixedRate>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_11" match="FpFraFltRateIndex">
  <xsl:if test = "FpFraFltRateIndex"> 
  <floatingRateIndex>

                <xsl:value-of select="FpFraFltRateIndex" />
   
  </floatingRateIndex>
</xsl:if>
</xsl:template>

<!--indexTenor-->

<xsl:template name="temp32_12" match="FpFraIdxTenrPrdMult|FpFraIdxTenrPrd">
<xsl:if test = "FpFraIdxTenrPrdMult|FpFraIdxTenrPrd"> 
  <indexTenor>

    <xsl:call-template name="temp32_12_1"/>
    <xsl:call-template name="temp32_12_2"/>

  </indexTenor>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_12_1" match="FpFraIdxTenrPrdMult">
  <xsl:if test = "FpFraIdxTenrPrdMult"> 
  <periodMultiplier>

                <xsl:value-of select="FpFraIdxTenrPrdMult" />
   
  </periodMultiplier>
</xsl:if>
</xsl:template>

<xsl:template name="temp32_12_2" match="FpFraIdxTenrPrd">
  <xsl:if test = "FpFraIdxTenrPrd"> 
  <period>

                <xsl:value-of select="FpFraIdxTenrPrd" />
   
  </period>
</xsl:if>
</xsl:template>

<!--fraDiscounting-->

<xsl:template name="temp32_13" match="FpFraDiscounting">
  <xsl:if test = "FpFraDiscounting"> 
  <fraDiscounting>

                <xsl:value-of select="FpFraDiscounting" />
   
  </fraDiscounting>
</xsl:if>
</xsl:template>


  <xsl:template name="temp33" match="ExecutionRetracted"><!-- root template -->
  <executionRetracted fpmlVersion="5-6" >

     <xsl:call-template name="temp1"/>
     <xsl:call-template name="temp2"/>
     <xsl:call-template name="temp3"/>
     <xsl:call-template name="temp3_1"/>
     <xsl:call-template name="temp4"/>
     <xsl:call-template name="temp5"/>
     <xsl:call-template name="temp6"/>
     <xsl:call-template name="temp7"/>
    
 

 <xsl:if test="FpNoOfPartyID/group">

     <xsl:for-each select="FpNoOfPartyID/group">

	 <xsl:if test="FpPartyIDValue">
      <party>

              <xsl:attribute name="id">
                 <xsl:value-of select="FpPartyID"/> 
              </xsl:attribute>

        
              <partyId>
                 <xsl:value-of select="FpPartyIDValue"/> 
              </partyId>

      </party>
	 </xsl:if>
     </xsl:for-each>
  
  </xsl:if>

  </executionRetracted>

  </xsl:template>


 </xsl:stylesheet>
