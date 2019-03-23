<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="ExecutionException">

    <executionException fpmlVersion="5-6" >

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
	  
	  <xsl:if test = "FpNoOfReasons">
	  
	  	<xsl:for-each select="FpNoOfReason/group">
		<reason>

        <xsl:if test="FpRsnCode">
          <xsl:variable name="value">
            <xsl:value-of select="FpRsnCode"/>
         </xsl:variable>
            
            <reasonCode>
              <xsl:value-of select="$value" />
            </reasonCode>
         </xsl:if>

        <xsl:if test="FpRsnDesc">

          <xsl:variable name="value2">
            <xsl:value-of select="FpRsnDesc"/>
         </xsl:variable>
       

         <description>
              <xsl:value-of select="$value2" />
         </description>

         </xsl:if>         

        </reason>
     </xsl:for-each>
	  
	  </xsl:if>

	  <xsl:if test = "FpAddataMimeType|FpNoOfPtyTradeIdentifier">
		  <additionalData>

			<xsl:if test="FpAddataMimeType">
			  <mimeType>
				<xsl:value-of select="FpAddataMimeType"/>
			  </mimeType>

			</xsl:if>

			<xsl:if test="FpNoOfPtyTradeIdentifier">

			  <xsl:for-each select="FpNoOfPtyTradeIdentifier/group">
				<tradeHeader>

				<xsl:if test="FpTrdTrdHdrPtyTrdIdfTrdID">
					<tradeId>
					  <xsl:attribute name="tradeIdScheme">
						<xsl:value-of select="FpTrdTrdHdrPtyTrdIdfTrdIDSch"/>
					  </xsl:attribute>
					  <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfTrdID"/>
					</tradeId>
				  </xsl:if>
				  
					<partyReference>
					  <xsl:attribute name="href">
						<xsl:value-of select="FpTrdTrdHdrPtyTrdIdfPtyhref"/>
					  </xsl:attribute>
					</partyReference>

				  <xsl:if test="FpTrdTrdHdrPtyTrdIdfIssuer">
					<issuer>
					  <xsl:attribute name="issuerIdScheme">
						<xsl:value-of select="FpTrdTrdHdrPtyTrdIdfIssuerIDSch"/>
					  </xsl:attribute>
					  <xsl:value-of select="FpTrdTrdHdrPtyTrdIdfIssuer"/>
					</issuer>
				  </xsl:if>

				</tradeHeader>
			  </xsl:for-each>

			</xsl:if>

		  </additionalData>
	  </xsl:if>
    </executionException>

  </xsl:template>
</xsl:stylesheet>
