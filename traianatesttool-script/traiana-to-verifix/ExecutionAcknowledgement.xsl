<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>


  <xsl:template match="executionAcknowledgement">
    <ExecutionAcknowledgement>

      <!-- Header  -->
      <xsl:if test = "header">
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

      

      <xsl:if test="tradeReferenceInformation/partyTradeIdentifier">
	  
	  <!-- partyTradeIdentifier Count-->
      <FpNoOfPtyTradeIdentifiers>
        <xsl:value-of select="count(/executionAcknowledgement/tradeReferenceInformation/partyTradeIdentifier)"/>
      </FpNoOfPtyTradeIdentifiers>
	  

        <FpNoOfPtyTradeIdentifier>
          <xsl:for-each select="tradeReferenceInformation/partyTradeIdentifier">

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

            

            <xsl:if test="issuer ">
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

      

      <!-- party-->
      <xsl:if test="party">
	  
	  <FpNoOfPartyIDs>
        <xsl:value-of select="count(/executionAcknowledgement/party)"/>
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
	  

    </ExecutionAcknowledgement>
  </xsl:template>


</xsl:stylesheet>
