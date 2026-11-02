<?xml version="1.0" encoding="utf-8"?>
<!-- Makes /rss.xml readable when opened in a browser. Feed readers ignore this file. -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="utf-8" indent="yes" />
	<xsl:template match="/rss/channel">
		<html lang="en">
			<head>
				<meta charset="utf-8" />
				<meta name="viewport" content="width=device-width, initial-scale=1" />
				<title><xsl:value-of select="title" /> · RSS feed</title>
				<link rel="icon" type="image/svg+xml" href="/favicon.svg" />
				<style>
					:root {
						--bg: #fdfaf5;
						--surface: #f4eee4;
						--text: #26221d;
						--muted: #6d655b;
						--border: #e4dbcd;
						--accent: #b4532a;
						--serif: 'Iowan Old Style', 'Palatino Linotype', Palatino, Georgia, serif;
						--sans: system-ui, -apple-system, 'Segoe UI', Roboto, sans-serif;
						--mono: ui-monospace, 'SF Mono', Menlo, Consolas, monospace;
						color-scheme: light dark;
					}
					@media (prefers-color-scheme: dark) {
						:root {
							--bg: #1a1816;
							--surface: #24211e;
							--text: #ece6dc;
							--muted: #a59c90;
							--border: #37322c;
							--accent: #e58a5c;
						}
					}
					body {
						margin: 0;
						background: var(--bg);
						color: var(--text);
						font-family: var(--sans);
						font-size: 1.0625rem;
						line-height: 1.7;
					}
					main {
						max-width: 42rem;
						margin: 0 auto;
						padding: 2.5rem 1rem 4rem;
					}
					h1, h2 { font-family: var(--serif); line-height: 1.25; }
					h1 { font-size: 2.25rem; margin: 0 0 0.75rem; }
					h2 { font-size: 1.3rem; margin: 0 0 0.25rem; }
					a { color: var(--accent); }
					.note {
						background: var(--surface);
						border: 1px solid var(--border);
						border-radius: 10px;
						padding: 1rem 1.25rem;
						margin: 1.5rem 0 2.5rem;
					}
					.note p { margin: 0 0 0.5rem; }
					.note p:last-child { margin: 0; }
					code {
						font-family: var(--mono);
						font-size: 0.9em;
						overflow-wrap: anywhere;
					}
					ul { list-style: none; padding: 0; margin: 0; }
					li { margin-bottom: 1.75rem; }
					h2 a { color: inherit; text-decoration: none; }
					h2 a:hover { color: var(--accent); }
					.muted { color: var(--muted); margin: 0; }
					time { font-size: 0.9rem; }
				</style>
			</head>
			<body>
				<main>
					<h1>Subscribe to <xsl:value-of select="title" /></h1>
					<div class="note">
						<p>
							This is an RSS feed. Paste this address into a feed reader such as Feedly,
							Inoreader or NetNewsWire to get new posts as they come out:
						</p>
						<p><code>https://leviorero.com/rss.xml</code></p>
						<p class="muted">
							New to RSS? <a href="https://aboutfeeds.com">About Feeds</a> explains it in a
							couple of minutes.
						</p>
					</div>
					<ul>
						<xsl:for-each select="item">
							<li>
								<h2><a href="{link}"><xsl:value-of select="title" /></a></h2>
								<p class="muted"><xsl:value-of select="description" /></p>
								<time class="muted"><xsl:value-of select="substring(pubDate, 6, 11)" /></time>
							</li>
						</xsl:for-each>
					</ul>
					<p><a href="{link}">← Back to the site</a></p>
				</main>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
