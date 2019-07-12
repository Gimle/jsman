<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:default="http://www.jsman.net/xsd/manual" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<xsl:output method="html" indent="yes"/>

	<xsl:include href="general.xsl"/>

	<xsl:template match="default:operator">
		<article>
			<h1><xsl:value-of select="@name"/></h1>
			<xsl:apply-templates/>
		</article>
	</xsl:template>

</xsl:stylesheet>
