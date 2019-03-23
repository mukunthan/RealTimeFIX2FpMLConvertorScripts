<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="RestoreCredit">
    <restoreCredit fpmlVersion="5-6"  >

      <!-- Header  -->
	  <xsl:if test = "FpHdMsgID|FpHdSentBy|FpHdSentTo|FpHdCreateTime|FpHdExpTime">
      <header>
		  <xsl:if test="FpHdMsgID">
			<messageId>
			  <xsl:attribute name="messageIdScheme">
				<xsl:value-of select="FpHdMsgIDScheme"/>
			  </xsl:attribute>
			  <xsl:value-of select="FpHdMsgID" />
			</messageId>
		  </xsl:if>

		  <xsl:if test="FpHdSentBy">
			<sentBy>
			  <xsl:value-of select="FpHdSentBy"/>
			</sentBy>
		  </xsl:if>
		  
		  <xsl:if test="FpHdSentTo">
			<sendTo>
			  <xsl:value-of select="FpHdSentTo"/>
			</sendTo>
		  </xsl:if>
	  
		  <xsl:if test="FpHdCreateTime">
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

      <xsl:if test="FpParentCorID">
        <parentCorrelationId>
          <xsl:attribute name ="correlationIdScheme">
            <xsl:value-of select="FpParentCorIDCorSch"/>
          </xsl:attribute>
          <xsl:value-of select="FpParentCorID"/>
        </parentCorrelationId>
      </xsl:if>

      <xsl:if test="FpCorID">
        <correlationId>
          <xsl:attribute name ="correlationIdScheme">
            <xsl:value-of select="FpCorIDSch"/>
          </xsl:attribute>
          <xsl:value-of select="FpCorID"/>
        </correlationId>
      </xsl:if>

      <xsl:if test="FpSeqNum">
        <sequenceNumber>
          <xsl:value-of select="FpSeqNum"/>
        </sequenceNumber>
      </xsl:if>

      
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
		
		<!-- TULLETT-16801 -->
		<xsl:if test="FpPartyOneValue">
          <party>
            <xsl:attribute name="id">
              <xsl:value-of select="FpPartyOne"/>
            </xsl:attribute>
            <partyId>
              <xsl:value-of select="FpPartyOneValue"/>
            </partyId>
          </party>
        </xsl:if>

        <xsl:if test="FpAccountIdAcc">
          <account>
            <xsl:attribute name="id">
              <xsl:value-of select="FpAccountId"/>
            </xsl:attribute>
            <accountId>
              <xsl:value-of select="FpAccountIdAcc"/>
            </accountId>
          </account>
        </xsl:if>


    </restoreCredit>
  </xsl:template>
</xsl:stylesheet>
