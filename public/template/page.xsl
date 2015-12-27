<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="header">
		<xsl:element name="h6">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="page">
		<xsl:element name="article">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="page/header">
		<xsl:element name="h1">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

</xsl:stylesheet>
