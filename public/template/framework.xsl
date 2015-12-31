<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*"/>
	<xsl:output method="html" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<title><xsl:value-of select="/property/@parent"/>.<xsl:value-of select="/method/@name"/> | Javascript manual</title>

				<link rel="stylesheet" href="{$BASE_PATH}highlight/styles/default.css"/>
				<script src="{$BASE_PATH}highlight/highlight.pack.js"></script>

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
						var text = pre[i].getElementsByTagName('div')[0].innerHTML;
						var len = text.search(/\S|$/) - 1; // Find the number of first leading tabs.

						var re1 = new RegExp("\t{" + len + "}"); // Regex to remove them from first line.
						var re2 = new RegExp("\n\t{" + len + "}", "mg"); // Regext to remove them from all other lines.

						text = text.replace(re1, "");
						text = text.replace(re2, "\n");
						text = text.trim();

						pre[i].getElementsByTagName('code')[0].innerHTML = text;

						pre[i].getElementsByTagName('button')[0].addEventListener('click', function () {
							eval(this.parentElement.getElementsByTagName('div')[0].innerHTML);
						});
					}

					hljs.initHighlighting();
				</script>
			</body>
		</html>

	</xsl:template>

</xsl:stylesheet>