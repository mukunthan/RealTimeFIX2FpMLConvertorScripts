<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>


  <xsl:template match="limitCheckRefused">
    <LimitCheckRefused>

      <xsl:if test="header">
        <!-- Header  -->
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

      <!-- onBehalfOf/partyReference -->
      <xsl:if test="onBehalfOf/partyReference">
        <FpOnBhlfPtyRefhref>
          <xsl:value-of select = "onBehalfOf/partyReference/@href"/>
        </FpOnBhlfPtyRefhref>
      </xsl:if>

      <!-- limitRefused -->
      <xsl:if test="creditRiskLimit/limitRefused">
        <FpCrdRiskLmtRefused>
          <xsl:value-of select = "creditRiskLimit/limitRefused"/>
        </FpCrdRiskLmtRefused>
      </xsl:if>

      

      <!-- reason -->
      <xsl:if test="creditRiskLimit/reason">
	  
	  <!-- reason count -->
      <FpNoOfReasons>
        <xsl:value-of select="count(/limitCheckRefused/creditRiskLimit/reason)"/>
      </FpNoOfReasons>

        <FpNoOfReason>
          <xsl:for-each select = "creditRiskLimit/reason">

            <xsl:if test = "reasonCode">
              <FpRsnCode>
                <xsl:value-of select = "reasonCode"/>
              </FpRsnCode>

              <xsl:if test="reasonCode/@creditLimitCheckReasonScheme">
                <FpCrdRiskLmtRsnCodeSch>
                  <xsl:value-of select="reasonCode/@creditLimitCheckReasonScheme"/>
                </FpCrdRiskLmtRsnCodeSch>
              </xsl:if>
            </xsl:if>

            <xsl:if test = "description">
              <FpRsnDesc>
                <xsl:value-of select = "description"/>
              </FpRsnDesc>
            </xsl:if>

          </xsl:for-each>
        </FpNoOfReason>

      </xsl:if>

      <!-- requestingPartyReference -->
      <xsl:if test ="creditRiskLimit/originalRequestDetails/requestingPartyReference">
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

      

      <!-- tradeIdentifier -->
      <xsl:if test="creditRiskLimit/originalRequestDetails/tradeIdentifier">
	  
	  <!-- tradeIdentifier count -->
      <FpNoOfCrdLmtTrdIdentifiers>
        <xsl:value-of select = "count(creditRiskLimit/originalRequestDetails/tradeIdentifier)"/>
      </FpNoOfCrdLmtTrdIdentifiers>

        <FpNoOfCrdLmtTrdIdentifier>
          <xsl:for-each select = "creditRiskLimit/originalRequestDetails/tradeIdentifier">

            <FpCrdRiskReqTrdIDPtyRefhref>
              <xsl:value-of select = "partyReference/@href"/>
            </FpCrdRiskReqTrdIDPtyRefhref>

            <FpCrdRiskReqTrdID>
              <xsl:value-of select = "tradeId"/>
            </FpCrdRiskReqTrdID>

          </xsl:for-each>
        </FpNoOfCrdLmtTrdIdentifier>

      </xsl:if>

      

      <!-- party -->
      <xsl:if test ="party">
	  
	  <!-- party Count-->
      <FpNoOfPartyIDs>
        <xsl:value-of select="count(/limitCheckRefused /party)"/>
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
	  

    </LimitCheckRefused>
  </xsl:template>
</xsl:stylesheet>