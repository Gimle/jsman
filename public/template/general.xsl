<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

	<xsl:template match="params">
		<xsl:variable name="separator" select="@separator"/>
		<xsl:for-each select="/*/parameters/parameter">
			<xsl:if test="@optional = 'true'">
				<xsl:value-of select="'['"/>
			</xsl:if>
			<xsl:value-of select="@type"/><xsl:value-of select="' '"/><i><xsl:value-of select="@name"/></i>
			<xsl:if test="position() != last()">
				<xsl:choose>
					<xsl:when test="$separator != ''"><xsl:value-of select="$separator"/><xsl:value-of select="' '"/></xsl:when>
					<xsl:otherwise><xsl:value-of select="', '"/></xsl:otherwise>
				</xsl:choose>
				<xsl:value-of select="separator"/>
			</xsl:if>
		</xsl:for-each>
		<xsl:for-each select="/*/parameters/parameter[@optional='true']">
			<xsl:value-of select="']'"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="number">
		<span class="number">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="date">
		<span class="date">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="header">
		<h6>
			<xsl:apply-templates/>
		</h6>
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
				<xsl:apply-templates select="parameter"/>
			</tbody>
		</table>
		<xsl:apply-templates select="node()[name() != 'parameter']"/>
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
