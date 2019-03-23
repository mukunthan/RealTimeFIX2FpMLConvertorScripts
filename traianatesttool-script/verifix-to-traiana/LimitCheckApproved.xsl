<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- NOTE: All tags have been checked if present, if not , the tags will not be shown in the output -->
  <xsl:strip-space elements= "*"/>
  <xsl:output method="xml" version="1.0" encoding="utf-8" indent="yes"/>

  <xsl:template match="LimitCheckApproved">
    <limitCheckApproved fpmlVersion="5-6" >

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

        <onBehalfOf>
          <partyReference>
            <xsl:attribute name="href">
              <xsl:value-of select="FpOnBhlfPtyRefhref"/>
            </xsl:attribute>
          </partyReference>
        </onBehalfOf>

      <creditRiskLimit>
        <xsl:if test="FpCrdRiskFullAproval">
          <fullApproval>
            <xsl:value-of select="FpCrdRiskFullAproval" />
          </fullApproval>
        </xsl:if>

		
		
        <xsl:if test="FpCrdRiskLmtExpTime">
		
		<!--TULLETT-16759 -->
			<xsl:if test="FpOffset" >
			  <limitExpiryTimeStamp>
				<xsl:value-of select="FpCrdRiskLmtExpTime" /> 
				<xsl:value-of select="FpOffset"/>
			  </limitExpiryTimeStamp>
			</xsl:if>
			
			<xsl:if test = "not(FpOffset !='')">
				<limitExpiryTimeStamp>
					<xsl:value-of select="FpCrdRiskLmtExpTime" /> 
					<xsl:value-of select="'+00:00'"/>
				</limitExpiryTimeStamp>
			</xsl:if>
        </xsl:if>

		<xsl:if test="FpNoOfCrdLmtReference">
        <xsl:for-each select="FpNoOfCrdLmtReference/group">

          <creditLimitReference>
            <approvingPartyReference>
              <xsl:attribute name="href">
                <xsl:value-of select="FpCrdLmtRefAppPtyRefhref"/>
              </xsl:attribute>
            </approvingPartyReference>

			<xsl:if test="FpCrdLmtRefAppID">
            <approvalId>
              <xsl:value-of select= "FpCrdLmtRefAppID" />
            </approvalId>
			</xsl:if>
          </creditLimitReference>

        </xsl:for-each>
		</xsl:if>
		
        <originalRequestDetails>

            <requestingPartyReference>
              <xsl:attribute name="href">
                <xsl:value-of select="FpCrdRiskReqPtyRefhref"/>
              </xsl:attribute>
            </requestingPartyReference>

          <xsl:if test="FpCrdRiskCrdAppReqType">
            <creditApprovalRequestType>
              <xsl:value-of select="FpCrdRiskCrdAppReqType"/>
            </creditApprovalRequestType>
          </xsl:if>
		  
		  <xsl:if test="FpCrdRiskCrdAppModel">
            <creditApprovalModel>
              <xsl:value-of select="FpCrdRiskCrdAppModel"/>
            </creditApprovalModel>
          </xsl:if>
		  

          <xsl:if test="FpNoOfCrdLmtTrdIdentifier">
           

              <xsl:for-each select="FpNoOfCrdLmtTrdIdentifier/group">
			   <tradeIdentifier>
                  <partyReference>
                    <xsl:attribute name="href">
                      <xsl:value-of select="FpCrdRiskReqTrdIDPtyRefhref"/>
                    </xsl:attribute>
                  </partyReference>

                <xsl:if test="FpCrdRiskReqTrdID">
                  <tradeId>
                    <xsl:value-of select="FpCrdRiskReqTrdID"/>
                  </tradeId>
                </xsl:if>
				</tradeIdentifier>
              </xsl:for-each>

            
          </xsl:if>
          
        </originalRequestDetails>

      </creditRiskLimit>

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

    </limitCheckApproved>
  </xsl:template>

</xsl:stylesheet>

