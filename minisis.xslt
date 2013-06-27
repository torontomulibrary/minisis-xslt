<?xml version="1.0" encoding="UTF-8" ?>
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
	<xsl:output encoding="UTF-8" 
				indent="yes" 
				method="xml" 
				version="1.0"
				media-type="text/xml"/>

	<!-- this should match the root <record_set/> element -->
	<xsl:template match="/">
		<xsl:apply-templates select="XML_RECORD[TOP_LEVEL_FLAG='Y']"/>
	</xsl:template>

	<!-- -->
	<xsl:template match="XML_RECORD">
		<xsl:choose>

			<!-- start at every top-level record and recurse through the hierarchy -->
			<xsl:when test="TOP_LEVEL_FLAG='Y'">

				<!-- HERE BE EAD HEADER -->

				<xsl:variable name="refd_higher" select="REFD_HIGHER"/>
				<xsl:apply-templates select="XML_RECORD[REFD=$refd_higher]"/>
			</xsl:when>
			
			<!-- embed this record in an existing EAD description -->
			<xsl:otherwise>
				<!-- HERE BE DESCGROUP -->
			</xsl:otherwise>

		</xsl:choose>		
	</xsl:template>
	
</xsl:stylesheet>
	