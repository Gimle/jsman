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

	<xsl:template match="code">
		<xsl:choose>
			<xsl:when test="not(@lang) or @lang = '' or @lang = 'javascript'">
				<pre style="white-space: pre;">
					<button class="run" style="float: right;" title="Open your console to see console output.">Run</button>
					<div style="display: none;">
						<xsl:apply-templates/>
					</div>
					<code class="javascript">
					</code>
				</pre>
			</xsl:when>
			<xsl:otherwise>
				<pre style="white-space: pre;">
					<code class="{@lang}">
						<xsl:apply-templates/>
					</code>
				</pre>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
