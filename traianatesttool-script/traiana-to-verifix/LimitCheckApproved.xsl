<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="limitCheckApproved">
    <LimitCheckApproved>

      <!-- Header  -->
      <xsl:if test="header">
        <FpHdMsgID>
          <xsl:value-of select = "header/messageId"/>
        </FpHdMsgID>

        <FpHdMsgIDScheme>
          <xsl:value-of select = "header/messageId/@messageIdScheme" />
        </FpHdMsgIDScheme>

        <FpHdSentBy>
          <xsl:value-of select = "header/sentBy" />
        </FpHdSentBy>

        <FpHdSentTo>
          <xsl:value-of select="header/sendTo" />
        </FpHdSentTo>

        <FpHdCreateTime>
          <xsl:value-of select= "header/creationTimestamp" />
        </FpHdCreateTime>

        <xsl:if test = "header/expiryTimestamp">
          <FpHdExpTime>
            <xsl:value-of select= "header/expiryTimestamp" />
          </FpHdExpTime>
        </xsl:if>
      </xsl:if>

      <!-- CorrelationId -->
      <xsl:if test="correlationId">
        <FpCorID>
          <xsl:value-of select = "correlationId"/>
        </FpCorID>

        <FpCorIDSch>
          <xsl:value-of select = "correlationId/@correlationIdScheme" />
        </FpCorIDSch>
      </xsl:if>

      <!-- onBehalfOf/partyReference  -->
      <xsl:if test="onBehalfOf/partyReference">
        <FpOnBhlfPtyRefhref>
          <xsl:value-of select = "onBehalfOf/partyReference/@href"/>
        </FpOnBhlfPtyRefhref>
      </xsl:if>

      <!-- fullApproval  -->
      <xsl:if test="creditRiskLimit/fullApproval">
        <FpCrdRiskFullAproval>
          <xsl:value-of select = "creditRiskLimit/fullApproval"/>
        </FpCrdRiskFullAproval>
      </xsl:if>

      <!-- limitExpiryTimeStamp  -->
      <xsl:if test="creditRiskLimit/limitExpiryTimeStamp">
        <FpCrdRiskLmtExpTime>
          <xsl:value-of select = "creditRiskLimit/limitExpiryTimeStamp"/>
        </FpCrdRiskLmtExpTime>
      </xsl:if>

      

      <xsl:if test="creditRiskLimit/creditLimitReference">
	  
	  <!-- creditLimitReference Count  -->
      <FpNoOfCrdLmtReferences>
        <xsl:value-of select="count(/limitCheckApproved /creditRiskLimit/creditLimitReference)"/>
      </FpNoOfCrdLmtReferences>

        <!-- creditLimitReference -->
        <FpNoOfCrdLmtReference>
          <xsl:for-each select = "creditRiskLimit/creditLimitReference">

            <xsl:if test="approvingPartyReference">
              <FpCrdLmtRefAppPtyRefhref>
                <xsl:value-of select = "approvingPartyReference /@href" />
              </FpCrdLmtRefAppPtyRefhref>
            </xsl:if>

            <xsl:if test="approvalId">
              <FpCrdLmtRefAppID>
                <xsl:value-of select = "approvalId" />
              </FpCrdLmtRefAppID>
            </xsl:if>

          </xsl:for-each>
        </FpNoOfCrdLmtReference>
      </xsl:if>

      <!-- requestingPartyReference -->
      <xsl:if test="creditRiskLimit/originalRequestDetails/requestingPartyReference">
        <FpCrdRiskReqPtyRefhref>
          <xsl:value-of select = "creditRiskLimit/originalRequestDetails/requestingPartyReference/@href"/>
        </FpCrdRiskReqPtyRefhref>
      </xsl:if>

      <!-- creditApprovalRequestType -->
      <xsl:if test="creditRiskLimit/originalRequestDetails/creditApprovalRequestType">
        <FpCrdRiskCrdAppReqType>
          <xsl:value-of select = "creditRiskLimit/originalRequestDetails/creditApprovalRequestType"/>
        </FpCrdRiskCrdAppReqType>
      </xsl:if>

      <!-- creditApprovalModel -->
      <xsl:if test="creditRiskLimit/originalRequestDetails/creditApprovalModel">
        <FpCrdRiskCrdAppModel>
          <xsl:value-of select="creditRiskLimit/originalRequestDetails/creditApprovalModel"/>
        </FpCrdRiskCrdAppModel>
      </xsl:if>

      
      
      <xsl:if test="creditRiskLimit/originalRequestDetails/tradeIdentifier">
	  
	  <!-- tradeIdentifier count-->
      <FpNoOfCrdLmtTrdIdentifiers>
        <xsl:value-of select="count(creditRiskLimit/originalRequestDetails/tradeIdentifier)"/>
      </FpNoOfCrdLmtTrdIdentifiers>

        <xsl:for-each select="creditRiskLimit/originalRequestDetails/tradeIdentifier">
          <FpNoOfCrdLmtTrdIdentifier>
            
          <!-- partyReference href -->
            <xsl:if test="partyReference">
              <FpCrdRiskReqTrdIDPtyRefhref>
                <xsl:value-of select = "partyReference/@href"/>
              </FpCrdRiskReqTrdIDPtyRefhref>
            </xsl:if>

            <!-- tradeId -->
            <xsl:if test="tradeId">
              <FpCrdRiskReqTrdID>
                <xsl:value-of select = "tradeId"/>
              </FpCrdRiskReqTrdID>
            </xsl:if>
            
          </FpNoOfCrdLmtTrdIdentifier>
        </xsl:for-each>
      </xsl:if>

      

      <!-- party -->
      <xsl:if test="party">
	  <!-- Party Count-->
      <FpNoOfPartyIDs>
        <xsl:value-of select="count(/limitCheckApproved/party)"/>
      </FpNoOfPartyIDs>
	  
        <FpNoOfPartyID>
          <xsl:for-each select = "party">

            <FpPartyID>
              <xsl:value-of select = "@id" />
            </FpPartyID>

            <FpPartyIDValue>
              <xsl:value-of select = "partyId" />
            </FpPartyIDValue>

          </xsl:for-each>
        </FpNoOfPartyID>
      </xsl:if>
	  

    </LimitCheckApproved>
  </xsl:template>
</xsl:stylesheet>