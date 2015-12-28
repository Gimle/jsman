<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<xsl:output method="html" indent="yes"/>

	<xsl:include href="method.xsl"/>
	<xsl:include href="../config.xsl"/>

	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="/method/@parent"/>.<xsl:value-of select="/method/@name"/> | Javascript manual</title>
				<link rel="stylesheet" href="{$BASE_PATH}template/default.css" type="text/css"/>
			</head>
			<body>
				<header id="main-header">
					<a id="logo" href="{$BASE_PATH}">
						<hgroup>
							<h1>JavaScript</h1>
							<h2>Manual</h2>
						</hgroup>
					</a>
				</header>

				<div id="main">
					<aside>
					</aside>
					<div id="content">
						<xsl:apply-templates/>
					</div>
				</div>

				<footer id="main-footer">
				</footer>

				<script>
					var pre = document.getElementsByTagName('pre');

					for (var i = 0; i &lt; pre.length; i++) {
						var text = pre[i].innerHTML;
						var len = text.search(/\S|$/); // Find the number of first leading tabs.

						var re1 = new RegExp("\t{" + len + "}"); // Regex to remove them from first line.
						var re2 = new RegExp("\n\t{" + len + "}","mg"); // Regext to remove them from all other lines.

						text = text.replace(re1, "");
						text = text.replace(re2, "\n");
						text = text.trim();

						pre[i].innerHTML = text;
					}
				</script>
			</body>
		</html>

	</xsl:template>

</xsl:stylesheet>
