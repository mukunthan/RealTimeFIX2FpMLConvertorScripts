<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="1.0"
 >

  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

<xsl:template name="temp1" match="FpHdMsgID|FpHdSentBy|FpHdSentTo|FpHdCreateTime|FpHdExpTime">

	<xsl:if test = "FpHdMsgID|FpHdSentBy|FpHdSentTo|FpHdCreateTime|FpHdExpTime">
    <header>

      <xsl:if test = "FpHdMsgID">
        <messageId>
              <xsl:attribute name="messageIdScheme">
                <xsl:value-of select="FpHdMsgIDScheme" />
              </xsl:attribute>
          <xsl:value-of select="FpHdMsgID" />
        </messageId>
      </xsl:if>

	  <xsl:if test = "FpInReplyTo">
        <inReplyTo>
              <xsl:attribute name="messageIdScheme">
                <xsl:value-of select="FpInReplyToScheme" />
              </xsl:attribute>
          <xsl:value-of select="FpInReplyTo" />
        </inReplyTo>
      </xsl:if>
	 
	
      <xsl:if test = "FpHdSentBy">
        <sentBy>
          <xsl:value-of select="FpHdSentBy" />
        </sentBy>
      </xsl:if>

      <xsl:if test = "FpHdSentTo">
        <sendTo>
          <xsl:value-of select="FpHdSentTo" />
        </sendTo>
      </xsl:if>

      <xsl:if test = "FpHdCreateTime">
        <creationTimestamp>
          <xsl:value-of select="FpHdCreateTime" />
        </creationTimestamp>
      </xsl:if>

      <xsl:if test = "FpHdExpTime">
        <expiryTimestamp>
          <xsl:value-of select="FpHdExpTime" />
        </expiryTimestamp>
      </xsl:if>

    </header>
	</xsl:if>
  </xsl:template>

  <xsl:template name="temp2" match="FpParentCorID">

   <xsl:if test="FpParentCorID">
     <parentCorrelationId>
              <xsl:attribute name="correlationIdScheme">
                <xsl:value-of select="FpParentCorIDCorSch" />
              </xsl:attribute>
         <xsl:value-of select="FpParentCorID" />    
     </parentCorrelationId>

   </xsl:if>


  </xsl:template>

  <xsl:template name="temp3" match="FpCorID">

    <xsl:if test="FpCorID">

      <correlationId>
              <xsl:attribute name="correlationIdScheme">
                <xsl:value-of select="FpCorIDSch" />
              </xsl:attribute>
        <xsl:value-of select="FpCorID" />
      </correlationId>
      
    </xsl:if>

  </xsl:template>

  <xsl:template name="temp4" match="FpSeqNum">
    <xsl:if test="FpSeqNum">
      <sequenceNumber>
        <xsl:value-of select="FpSeqNum" />
      </sequenceNumber>
    </xsl:if>
  </xsl:template>
 
  <xsl:template name="temp5" match="FpResponse">
    <xsl:if test="FpResponse">
      <response>
        <xsl:value-of select="FpResponse" />   
      </response>
    </xsl:if>
  </xsl:template>


  <xsl:template name="temp7" match="CreditLimitResponse">

  <creditLimitResponse fpmlVersion="5-6" >

     <xsl:call-template name="temp1"/>
     <xsl:call-template name="temp2"/>
     <xsl:call-template name="temp3"/>
     <xsl:call-template name="temp4"/>
     <xsl:call-template name="temp5"/>

   <xsl:if test="FpNoOfReason">
 
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
 </creditLimitResponse>
</xsl:template>


 </xsl:stylesheet>



