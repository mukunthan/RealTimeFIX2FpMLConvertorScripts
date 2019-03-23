<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="suspendCredit">
    <SuspendCredit>

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

      <!-- parentCorrelationId -->
      <xsl:if test="parentCorrelationId">
        <FpParentCorID>
          <xsl:value-of select = "parentCorrelationId"/>
        </FpParentCorID>

        <FpParentCorIDCorSch>
          <xsl:value-of select = "parentCorrelationId/@correlationIdScheme" />
        </FpParentCorIDCorSch>
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

      <!-- sequenceNumber -->
      <xsl:if test="sequenceNumber">
        <FpSeqNum>
          <xsl:value-of select="sequenceNumber"/>
        </FpSeqNum>
      </xsl:if>

      <!-- party -->
      <xsl:if test="party">
        <FpPartyID>
          <xsl:value-of select = "party/@id" />
        </FpPartyID>

        <FpPartyIDValue>
          <xsl:value-of select = "party/partyId" />
        </FpPartyIDValue>
      </xsl:if>
	  
	  <!-- party1 -->
      <xsl:if test="party">
        <FpPartyOne>
          <xsl:value-of select = "party/@id" />
        </FpPartyOne>

        <FpPartyOneValue>
          <xsl:value-of select = "party/partyId" />
        </FpPartyOneValue>
      </xsl:if>
	  
	  
      <!-- account -->
      <xsl:if test="account">
        <FpAccountId>
          <xsl:value-of select="account/@id"/>
        </FpAccountId>

        <FpAccountIdAcc>
          <xsl:value-of select="account/accountId"/>
        </FpAccountIdAcc>
      </xsl:if>

    </SuspendCredit>
  </xsl:template>
</xsl:stylesheet>