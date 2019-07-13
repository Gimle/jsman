<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:default="http://www.jsman.net/xsd/page" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="*">
		<xsl:element name="{local-name()}">
			<xsl:for-each select="@*">
				<xsl:attribute name="{local-name()}">
					<xsl:value-of select="."/>
				</xsl:attribute>
			</xsl:for-each>
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="default:heading">
		<xsl:element name="h6">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="default:page">
		<xsl:element name="article">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="default:page/default:heading">
		<xsl:element name="h1">
			<xsl:apply-templates/>
		</xsl:element>
	</xsl:template>

	<xsl:template match="default:see-also">
		<h3>See also</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="default:code">
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

	<xsl:template match="default:result">
		<xsl:element name="div">
			<xsl:attribute name="class">
				<xsl:value-of select="'result'"/>
			</xsl:attribute>
			<button class="reset" style="float: right;" title="Reset the output.">Reset</button>
			<xsl:element name="div">
				<xsl:attribute name="id">
					<xsl:value-of select="@id"/>
				</xsl:attribute>
				<i>Run example above to see the output.</i>
			</xsl:element>
		</xsl:element>
	</xsl:template>

	<xsl:template match="default:xref">
		<xsl:choose>
			<xsl:when test="@href">
				<a href="{@href}"><xsl:apply-templates/></a>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
