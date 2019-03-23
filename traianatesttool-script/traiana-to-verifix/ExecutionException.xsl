<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="executionException">
    <ExecutionException>

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

      

      <!-- Reason -->
      <xsl:if test="reason">
	  <FpNoOfReasons>
        <xsl:value-of select="count(/executionException/reason)"/>
      </FpNoOfReasons>

        <FpNoOfReason>
          <xsl:for-each select = "reason">

            <xsl:if test = "reasonCode">
              <FpRsnCode>
                <xsl:value-of select = "reasonCode"/>
              </FpRsnCode>
            </xsl:if>

            <xsl:if test = "description">
              <FpRsnDesc>
                <xsl:value-of select = "description"/>
              </FpRsnDesc>
            </xsl:if>

          </xsl:for-each>
        </FpNoOfReason>

      </xsl:if>

      <xsl:if test="additionalData">

        <!-- mimeType -->
        <xsl:if test="additionalData/mimeType">
          <FpAddataMimeType>
            <xsl:value-of select= "additionalData/mimeType"/>
          </FpAddataMimeType>
        </xsl:if>

        <!-- partyTradeIdentifier -->
		<xsl:if test="additionalData/tradeHeader">
        <FpNoOfPtyTradeIdentifiers>
          <xsl:value-of select="count(/executionException/additionalData/tradeHeader/partyTradeIdentifier)"/>
        </FpNoOfPtyTradeIdentifiers>
		

        <xsl:if test="additionalData/tradeHeader">

          <FpNoOfPtyTradeIdentifier>
            <xsl:for-each select="additionalData/tradeHeader">

			  <!-- tradeId and tradeIdScheme -->
              <xsl:if test="tradeId">

                <FpTrdTrdHdrPtyTrdIdfTrdID>
                  <xsl:value-of select="tradeId"/>
                </FpTrdTrdHdrPtyTrdIdfTrdID>

                <FpTrdTrdHdrPtyTrdIdfTrdIDSch>
                  <xsl:value-of select="tradeId/@tradeIdScheme"/>
                </FpTrdTrdHdrPtyTrdIdfTrdIDSch>

              </xsl:if>
			  
              <!-- partyReference href-->
              <xsl:if test="partyReference">

                <FpTrdTrdHdrPtyTrdIdfPtyhref>
                  <xsl:value-of select="partyReference/@href"/>
                </FpTrdTrdHdrPtyTrdIdfPtyhref>

              </xsl:if>


              

              <xsl:if test="issuer">

                <!-- issuer and issuerIdScheme -->
                <FpTrdTrdHdrPtyTrdIdfIssuer>
                  <xsl:value-of select="issuer"/>
                </FpTrdTrdHdrPtyTrdIdfIssuer>

                <FpTrdTrdHdrPtyTrdIdfIssuerIDSch>
                  <xsl:value-of select="issuer/@issuerIdScheme"/>
                </FpTrdTrdHdrPtyTrdIdfIssuerIDSch>

              </xsl:if>
            </xsl:for-each>
          </FpNoOfPtyTradeIdentifier>

        </xsl:if>
		</xsl:if>

      </xsl:if>
    </ExecutionException>
  </xsl:template>
</xsl:stylesheet>
