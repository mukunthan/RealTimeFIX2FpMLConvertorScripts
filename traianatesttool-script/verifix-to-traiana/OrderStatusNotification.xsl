<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

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
  <!--###########################################-->

  <xsl:template name="temp4_1" match="FpOrdStsReqOrdID">
  
    <xsl:if test="FpOrdStsReqOrdID">

      <requesterOrderId>
         <xsl:value-of select="FpOrdStsReqOrdID"/> 
      </requesterOrderId>
      
    </xsl:if>

  </xsl:template>

  <xsl:template name="temp4_2" match="FpOrdStsStatus">
  
    <xsl:if test="FpOrdStsStatus">

      <status>
         <xsl:value-of select="FpOrdStsStatus"/> 
      </status>
      
    </xsl:if>

  </xsl:template>

  <xsl:template name="temp4_3_1" match="FpOrdStsAppPartyhref">
  

      <approvingPartyReference>

              <xsl:attribute name="href">
                 <xsl:value-of select="FpOrdStsAppPartyhref"/> 
              </xsl:attribute>

      </approvingPartyReference>
	  
  </xsl:template>

  <xsl:template name="temp4_3_2" match="FpOrdStsAppID">
  
    <xsl:if test="FpOrdStsAppID">

      <approvalId>

                 <xsl:value-of select="FpOrdStsAppID"/> 
     
      </approvalId>
      
    </xsl:if>

  </xsl:template>

  <xsl:template name="temp4_3" match="FpOrdStsAppPartyhref|FpOrdStsAppID">

      <creditLimitReference>

         <xsl:call-template name="temp4_3_1"/>
         <xsl:call-template name="temp4_3_2"/>

      </creditLimitReference>

  </xsl:template>

  <xsl:template name="temp4" match="FpOrdStsReqOrdID|FpOrdStsStatus|FpOrdStsAppID">

      <orderStatus>
       
         <xsl:call-template name="temp4_1"/>
         <xsl:call-template name="temp4_2"/>
         <xsl:call-template name="temp4_3"/>

      </orderStatus>

  </xsl:template>

  <xsl:template name="temp5" match="OrderStatusNotification"><!-- root template -->
  <orderStatusNotification fpmlVersion="5-6" >

     <xsl:call-template name="temp1"/><!-- Add header template to the root template -->
     <xsl:call-template name="temp2"/><!-- Add parentCorrelationId template to the root template -->
     <xsl:call-template name="temp3"/><!-- Add correlationId template to the root template -->
     <xsl:call-template name="temp4"/><!-- Add orderStatus template to the root template -->

    
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


</orderStatusNotification>
</xsl:template><!-- End root template-->


 </xsl:stylesheet><!-- End stylesheet -->



