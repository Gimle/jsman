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
		<h6>
			<xsl:apply-templates/>
		</h6>
	</xsl:template>

	<xsl:template match="object">
		<article>
			<h1><xsl:value-of select="@name"/></h1>
			<xsl:apply-templates/>
		</article>
	</xsl:template>

	<xsl:template match="lead">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="description">
		<h3>Description</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="parameters">
		<h3>Parameters</h3>
		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Type</th>
					<th>Default</th>
					<th>Optional</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates/>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="parameter">
		<tr>
			<td><xsl:value-of select="@name"/></td>
			<td><xsl:apply-templates/></td>
			<td><xsl:value-of select="@type"/></td>
			<td><xsl:value-of select="@default"/></td>
			<td>
				<xsl:choose>
					<xsl:when test="@optional = 'false'">No</xsl:when>
					<xsl:when test="@optional = 'true'">Yes</xsl:when>
				</xsl:choose>
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="examples">
		<h3>Examples</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="example">
		<h6>Example #<xsl:value-of select="position()"/><xsl:value-of select="' – '"/><xsl:value-of select="./heading"/></h6>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="code">
		<pre style="white-space: pre;">
			<xsl:apply-templates/>
		</pre>
	</xsl:template>

	<xsl:template match="example/heading">
	</xsl:template>

	<xsl:template match="links">
		<h3>Links</h3>
		<xsl:apply-templates/>
	</xsl:template>

</xsl:stylesheet>
