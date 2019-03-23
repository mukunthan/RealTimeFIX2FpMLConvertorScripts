<xsl:stylesheet
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 version="1.0"
 ><!-- Start stylesheet -->

  <xsl:strip-space elements="*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template name="temp1" match="header"><!-- This is Header template -->

      <xsl:if test = "header/messageId"><!-- check header/messageId xparth is correct -->
        <FpHdMsgID><!-- Print <FPHdMsgID> new tag for <messageId> -->
          <xsl:apply-templates select="header/messageId"/> 
        </FpHdMsgID><!-- end <FPHdMsgID> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/messageId">
        <FpHdMsgIDScheme>        
           <xsl:value-of select = "header/messageId/@messageIdScheme" /><!-- messageId attribute value -->
        </FpHdMsgIDScheme>
      </xsl:if>
	  
	  <!--TULLETT-16970 -->
	  <xsl:if test = "header/inReplyTo"><!-- check header/inReplyTo xparth is correct -->
        <FpInReplyTo><!-- Print <FpInReplyTo> new tag for <messageId> -->
          <xsl:apply-templates select="header/inReplyTo"/> 
        </FpInReplyTo><!-- end <FpInReplyTo> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/inReplyTo">
        <FpInReplyToScheme>        
           <xsl:value-of select = "header/inReplyTo/@messageIdScheme" /><!-- inReplyTo attribute value -->
        </FpInReplyToScheme>
      </xsl:if>
	
	<!-- End TULLETT-16970 -->
	
      <xsl:if test = "header/sentBy"><!-- check header/sentBy xparth is correct -->
        <FpHdSentBy><!-- Print <FPHdSentBy> new tag for <sentBy> -->
          <xsl:apply-templates select="header/sentBy"/><!-- <sentBy> element value -->
        </FpHdSentBy><!-- end <FPHdSentBy> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/sendTo"><!-- check header/sendTo xparth is correct -->
        <FpHdSentTo><!-- Print <FPHdSentTo> new tag for <sentTo> -->
          <xsl:apply-templates select="header/sendTo"/><!-- <sendTo> element value --> 
        </FpHdSentTo><!-- end <FPHdSentTo> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/creationTimestamp"><!-- check header/creationTimestamp xparth is correct -->
        <FpHdCreateTime><!-- Print <FPHdCreateTime> new tag for <creationTimeStamp> -->
          <xsl:apply-templates select="header/creationTimestamp"/><!-- <creationTimestamp> element value --> 
        </FpHdCreateTime><!-- end <FPHdCreateTime> tag -->
      </xsl:if><!-- end if -->

      <xsl:if test = "header/expiryTimestamp"><!-- check header/expiryTimeStamp xparth is correct -->
        <FpHdExpTime><!-- Print <FPHdExpTime> new tag for <expiryTimeStamp> -->
          <xsl:apply-templates select="header/expiryTimestamp"/><!-- <expiryTimeStamp> element value -->
        </FpHdExpTime><!-- end <FPHdExpTime> tag -->
      </xsl:if><!-- end if -->

  </xsl:template><!-- End Header template -->

  <xsl:template name="temp2" match="parentCorrelationId"><!-- This is parentCorrelationId template -->

   <xsl:if test="parentCorrelationId"><!-- check */parentCorrelationId xparth is correct -->
     <FpParentCorID><!-- Print <FPParentCorID> new tag for <parentCorrelationId> -->
         <xsl:value-of select="parentCorrelationId" /><!-- <parentCorrelationId> element value -->    
     </FpParentCorID><!-- end <FPParentCorID> tag -->

     <FpParentCorIDCorSch>
         <xsl:value-of select="parentCorrelationId/@correlationIdScheme" />    
     </FpParentCorIDCorSch>

   </xsl:if><!-- end if -->


  </xsl:template><!-- End parentCorrelationId template -->

  <xsl:template name="temp3" match="correlationId"><!-- This is correlationId template -->

    <xsl:if test="correlationId"><!-- check */correlationId xparth is correct -->

      <FpCorID><!-- Print <FPCorID> new tag for <correlationId> -->
        <xsl:value-of select="correlationId" /><!-- <correlationId> element value --> 
      </FpCorID><!-- end <FPCorID> tag -->
      
      <FpCorIDSch><!-- Print <FPCorID> new tag for <correlationId> -->
        <xsl:value-of select="correlationId/@correlationIdScheme" />
      </FpCorIDSch><!-- end <FPCorID> tag -->

    </xsl:if><!-- end if -->

  </xsl:template><!-- End correlationId template -->

  <xsl:template name="temp4" match="sequenceNumber"><!-- This is sequenceNumber template -->
    <xsl:if test="sequenceNumber"><!-- check */sequenceNumber xparth is correct -->
      <FpSeqNum><!-- Print <FPSeqNum> new tag for <sequenceNumber> -->
        <xsl:value-of select="sequenceNumber" /><!-- <sequenceNumber> element value --> 
      </FpSeqNum><!-- end <FPSeqNum> tag -->
    </xsl:if><!-- end if -->
  </xsl:template><!-- End sequenceNumber template -->
 
  <xsl:template name="temp5" match="response"><!-- This is response template -->
    <xsl:if test="response"><!-- check */response xparth is correct -->
      <FpResponse><!-- Print <FPResponse> new tag for <response> -->
        <xsl:value-of select="response" /><!-- <response> element value -->     
      </FpResponse><!-- end <FPResponse> tag -->
    </xsl:if><!-- end if -->
  </xsl:template><!-- End response template -->

  <xsl:variable name="NoOfreason" select="count(creditLimitResponse/reason)" />

  <xsl:template name="temp7" match="creditLimitResponse"><!-- root template -->
  <CreditLimitResponse>

     <xsl:call-template name="temp1"/><!-- Add header template to the root template -->
     <xsl:call-template name="temp2"/><!-- Add parentCorrelationId template to the root template -->
     <xsl:call-template name="temp3"/><!-- Add correlationId template to the root template -->
     <xsl:call-template name="temp4"/><!-- Add sequenceNumber template to the root template -->
     <xsl:call-template name="temp5"/><!-- Add response template to the root template -->


    <!-- Add reason block to the root template -->
   <xsl:if test="reason">
     <FpNoOfReasons><xsl:value-of select="$NoOfreason"/></FpNoOfReasons>
     <FpNoOfReason>
       <xsl:for-each select="reason"><!-- for Print repeating <reasonCode> tags -->

         <xsl:variable name="value"><!-- <reasonCode> element value -->
            <xsl:copy-of select="reasonCode"/>
         </xsl:variable><!-- End variable -->

         <xsl:variable name="value2"><!-- <description> element value -->
            <xsl:copy-of select="description"/>
         </xsl:variable><!-- End variable -->

            
            <xsl:if test="reasonCode"><!-- check */reasonCode xparth is correct -->
            <FpRsnCode><!-- Print <FpRsnCode> new tag for <reasonCode> -->
              <xsl:value-of select="$value" />
            </FpRsnCode>
            </xsl:if><!-- end if -->
            
            <xsl:if test="description"><!-- check */description xparth is correct -->
            <FpRsnDesc><!-- Print <FpRsnDesc> new tag for <description> -->
              <xsl:value-of select="$value2" />
            </FpRsnDesc>
            </xsl:if><!-- end if -->

        </xsl:for-each>
      </FpNoOfReason>
  </xsl:if>
  <!-- End reason block -->
  </CreditLimitResponse>
  </xsl:template><!-- End root template-->


 </xsl:stylesheet><!-- End stylesheet -->



