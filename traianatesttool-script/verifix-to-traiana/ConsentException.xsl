<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="ConsentException">
    <consentException fpmlVersion="5-6" >

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

      <xsl:if test="FpNoOfReason">

        <xsl:for-each select="FpNoOfReason/group">
          <reason>
            <reasonCode>
              <xsl:value-of select="FpRsnCode"/>
            </reasonCode>

            <xsl:if test="FpRsnDesc">
              <description>
                <xsl:value-of select="FpRsnDesc"/>
              </description>
            </xsl:if>
          </reason>

        </xsl:for-each>
      </xsl:if>

    </consentException>
  </xsl:template>
</xsl:stylesheet>
