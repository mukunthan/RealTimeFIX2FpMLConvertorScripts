<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="consentException">
    <ConsentException>

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
	  <!-- Reason Count -->
      <FpNoOfReasons>
        <xsl:value-of select="count(/consentException/reason)"/>
      </FpNoOfReasons>

        <FpNoOfReason>
          <xsl:for-each select = "reason">

            <FpRsnCode>
              <xsl:value-of select="reasonCode"/>
            </FpRsnCode>

            <FpRsnDesc>
              <xsl:value-of select="description"/>
            </FpRsnDesc>

          </xsl:for-each>
        </FpNoOfReason>

      </xsl:if>

    </ConsentException>
  </xsl:template>

</xsl:stylesheet>