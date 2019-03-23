<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

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

      <FpCorIDSch>
        <xsl:value-of select="correlationId/@correlationIdScheme" />
      </FpCorIDSch>

    </xsl:if><!-- end if -->

  </xsl:template><!-- End correlationId template -->

  <xsl:template name="temp4" match="orderStatus">

  <xsl:if test="orderStatus/requesterOrderId">
    <FpOrdStsReqOrdID>
        <xsl:apply-templates select="orderStatus/requesterOrderId"/> 
    </FpOrdStsReqOrdID>
	
	<!--TULLETT-16765 -->
	<xsl:variable name="OrginalRequestOrderID" select="orderStatus/requesterOrderId" />
	
	<FpOrdID>
        <xsl:value-of select="substring-before($OrginalRequestOrderID,'_')" /> 
    </FpOrdID> 
  </xsl:if>

  <xsl:if test="orderStatus/status">
    <FpOrdStsStatus>
        <xsl:apply-templates select="orderStatus/status"/> 
    </FpOrdStsStatus>
  </xsl:if>

     <xsl:if test="orderStatus/creditLimitReference/approvingPartyReference">
       <FpOrdStsAppPartyhref>
         <xsl:value-of select="orderStatus/creditLimitReference/approvingPartyReference/@href" />
       </FpOrdStsAppPartyhref>
     </xsl:if>

     <xsl:if test="orderStatus/creditLimitReference/approvalId">
       <FpOrdStsAppID>
         <xsl:value-of select="orderStatus/creditLimitReference/approvalId" /> 
       </FpOrdStsAppID>
     </xsl:if>

  
 </xsl:template>


  

   <xsl:variable name="NoOfParty" select="count(orderStatusNotification/party)" />

  <xsl:template name="temp5" match="orderStatusNotification"><!-- root template -->
  <OrderStatusNotification>

     <xsl:call-template name="temp1"/><!-- Add header template to the root template -->
     <xsl:call-template name="temp2"/><!-- Add parentCorrelationId template to the root template -->
     <xsl:call-template name="temp3"/><!-- Add correlationId template to the root template -->
     <xsl:call-template name="temp4"/><!-- Add orderStatus template to the root template -->

 <xsl:if test="party">
  <FpNoOfPartyIDs><xsl:value-of select="$NoOfParty"/></FpNoOfPartyIDs>

   <FpNoOfPartyID>
     <xsl:for-each select="party">

       <xsl:variable name="value">
          <xsl:copy-of select="partyId"/>
       </xsl:variable>
          
		  <xsl:if test="partyId">
          <FpPartyID>
            <xsl:value-of select="@id" />
          </FpPartyID>
          </xsl:if>
		  
		  <FpPartyIDValue>
            <xsl:value-of select="$value" />
          </FpPartyIDValue>
        

      </xsl:for-each>
    </FpNoOfPartyID>
  </xsl:if>


  </OrderStatusNotification>
  </xsl:template><!-- End root template-->


 </xsl:stylesheet><!-- End stylesheet -->



