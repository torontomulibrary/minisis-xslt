<?xml version="1.0" encoding="UTF-8" ?>
 
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
	<xsl:output encoding="UTF-8" 
				indent="yes" 
				method="xml" 
				version="1.0"
				media-type="text/xml"/>

	<!-- this should match the root <record_set/> element -->
	<xsl:template match="/">
		<ead>
			<!-- start at every top-level record and recurse through the hierarchy -->
			<xsl:apply-templates select="//XML_RECORD[REFD_LOWEREXIST]"/>			
		</ead>
	</xsl:template>

	<!-- recursive record template -->
	<xsl:template match="XML_RECORD">
		<archdesc level="{LEVEL_DESC}">
			<!-- HERE BE EAD HEADER -->
			<did>
				<xsl:value-of select="SISN"/>
			</did>

			<xsl:if test="boolean(LOWER_LEVEL)">

				<!-- HERE BE DESCGROUP -->
				<descgrp>

					<xsl:for-each select="LOWER_LEVEL">
						<xsl:variable name="lower_level_code" select="LOWER_CODE"/>

						<xsl:apply-templates select="//XML_RECORD[REFD=$lower_level_code]"/>
					</xsl:for-each>

				</descgrp>
			</xsl:if>
		</archdesc>
	</xsl:template>
	
</xsl:stylesheet>
	