<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="ExecutionAcknowledgement">
    <executionAcknowledgement fpmlVersion="5-6" >

      <!-- Header  -->
	  <xsl:if test = "FpHdMsgID|FpHdSentBy|FpHdSentTo|FpHdCreateTime|FpHdExpTime">
      <header>
	  <xsl:if test = "FpHdMsgID">
        <messageId>
          <xsl:attribute name="messageIdScheme">
            <xsl:value-of select="header/FpHdMsgIDScheme"/>
          </xsl:attribute>
          <xsl:value-of select="FpHdMsgID" />
        </messageId>
	  </xsl:if>

	  <xsl:if test = "FpHdSentBy">
        <sentBy>
          <xsl:value-of select="FpHdSentBy"/>
        </sentBy>
	  </xsl:if>

	  <xsl:if test = "FpHdSentTo">
        <sendTo>
          <xsl:value-of select="FpHdSentTo"/>
        </sendTo>
	  </xsl:if>

	  <xsl:if test = "FpHdCreateTime">
        <creationTimestamp>
          <xsl:value-of select="FpHdCreateTime"/>
        </creationTimestamp>
	  </xsl:if>

        <xsl:if test = "FpHdExpTime">
          <expiryTimestamp>
            <xsl:value-of select= "FpHdExpTime" />
          </expiryTimestamp>
        </xsl:if>
      </header>
	  </xsl:if>

      <xsl:if test="FpCorID">
        <correlationId>
          <xsl:attribute name ="correlationIdScheme">
            <xsl:value-of select="FpCorIDSch"/>
          </xsl:attribute>
          <xsl:value-of select="FpCorID"/>
        </correlationId>
      </xsl:if>

      <xsl:if test="FpNoOfPtyTradeIdentifier">

        <tradeReferenceInformation>

          <xsl:for-each select="FpNoOfPtyTradeIdentifier/group">

            <partyTradeIdentifier>

                <partyReference>
                  <xsl:attribute name="href">
                    <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfPtyhref"/>
                  </xsl:attribute>
                </partyReference>

              <xsl:if test="FpTrdTrdHdrPtyTrdIdfTrdID">
                <tradeId>
                  <xsl:attribute name="tradeIdScheme">
                    <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfTrdIDSch"/>
                  </xsl:attribute>
                  <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfTrdID"/>
                </tradeId>
              </xsl:if>

              <xsl:if test="FpTrdTrdHdrPtyTrdIdfIssuer">
                <issuer>
                  <xsl:attribute name="issuerIdScheme">
                    <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfIssuerIDSch"/>
                  </xsl:attribute>
                  <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfIssuer"/>
                </issuer>
              </xsl:if>

            </partyTradeIdentifier>

          </xsl:for-each>
        </tradeReferenceInformation>
      </xsl:if>

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
	  
           
    </executionAcknowledgement>
  </xsl:template>
</xsl:stylesheet>
