<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:default="http://www.jsman.net/xsd/manual" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
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

	<xsl:template match="default:params">
		<xsl:variable name="separator" select="@separator"/>
		<xsl:for-each select="/*/default:parameters/default:parameter">
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
		<xsl:for-each select="/*/default:parameters/default:parameter[@optional='true']">
			<xsl:value-of select="']'"/>
		</xsl:for-each>
	</xsl:template>

	<xsl:template match="default:number">
		<span class="number">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="default:date">
		<span class="date">
			<xsl:apply-templates/>
		</span>
	</xsl:template>

	<xsl:template match="default:heading">
		<h6>
			<xsl:apply-templates/>
		</h6>
	</xsl:template>

	<xsl:template match="default:lead">
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="default:description">
		<h3>Description</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="default:parameters">
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
				<xsl:apply-templates select="default:parameter"/>
			</tbody>
		</table>
		<xsl:apply-templates select="node()[name() != 'parameter']"/>
	</xsl:template>

	<xsl:template match="default:parameter">
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

	<xsl:template match="default:return">
		<h3>Return values</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="default:notes">
		<h3>Notes</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="default:changelog">
		<h3>Changelog</h3>
		<table>
			<thead>
				<tr>
					<th>Version</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<xsl:apply-templates select="default:change"/>
			</tbody>
		</table>
	</xsl:template>

	<xsl:template match="default:change">
		<tr>
			<td><xsl:value-of select="@version"/></td>
			<td><xsl:apply-templates/></td>
		</tr>
	</xsl:template>

	<xsl:template match="default:examples">
		<h3>Examples</h3>
		<xsl:apply-templates/>
	</xsl:template>

	<xsl:template match="default:example">
		<h6>Example #<xsl:value-of select="count(preceding-sibling::default:example) + 1"/><xsl:value-of select="' – '"/><xsl:value-of select="./default:heading"/></h6>
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

	<xsl:template match="default:example/default:heading">
	</xsl:template>

	<xsl:template match="default:see-also">
		<h3>See also</h3>
		<xsl:apply-templates/>
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

	<xsl:template match="default:external">
		<h3>External references</h3>
		<ul>
			<xsl:apply-templates/>
		</ul>
	</xsl:template>

	<xsl:template match="default:mdn">
		<li><a href="{@href}">Mozilla: <xsl:apply-templates/></a></li>
	</xsl:template>

</xsl:stylesheet>
