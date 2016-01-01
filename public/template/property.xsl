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

	<xsl:template match="property">
		<article>
			<h1><xsl:value-of select="@parent"/>.<xsl:value-of select="@name"/></h1>
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

	<xsl:template match="return">
		<h3>Return values</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="notes">
		<h3>Notes</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="changelog">
		<h3>Changelog</h3>
		<table>
			<thead>
				<tr>
					<th>Version</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="change"/>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="change">
		<tr>
			<td><xsl:value-of select="@version"/></td>
			<td><xsl:apply-templates/></td>
		</tr>
	</xsl:template>

	<xsl:template match="examples">
		<h3>Examples</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="example">
		<h6>Example #<xsl:value-of select="count(preceding-sibling::example) + 1"/><xsl:value-of select="' – '"/><xsl:value-of select="./heading"/></h6>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="code">
		<pre style="white-space: pre;">
			<button class="run" style="float: right;" title="Open your console to see console output.">Run</button>
			<div style="display: none;">
				<xsl:apply-templates/>
			</div>
			<code class="javascript">
			</code>
		</pre>
	</xsl:template>

	<xsl:template match="example/heading">
	</xsl:template>

	<xsl:template match="see-also">
		<h3>See also</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="xref">
		<a href="{@href}"><xsl:apply-templates/></a>
	</xsl:template>

	<xsl:template match="external">
		<h3>External references</h3>
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<xsl:template match="mdn">
		<li><a href="{@href}">Mozilla: <xsl:apply-templates/></a></li>
	</xsl:template>
	<xsl:template match="msdn">
		<li><a href="{@href}">Microsoft: <xsl:apply-templates/></a></li>
	</xsl:template>

</xsl:stylesheet>
