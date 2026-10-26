// Usage: npm run new -- "Post title"
// Creates src/content/blog/<slug>.md as a draft dated today.
import { existsSync, writeFileSync } from 'node:fs';

const title = process.argv.slice(2).join(' ').trim();
if (!title) {
	console.error('Usage: npm run new -- "Post title"');
	process.exit(1);
}

const slug = title
	.toLowerCase()
	.normalize('NFKD')
	.replace(/[^\w\s-]/g, '')
	.trim()
	.replace(/[\s_]+/g, '-');
const today = new Date().toISOString().slice(0, 10);
const path = `src/content/blog/${slug}.md`;

if (existsSync(path)) {
	console.error(`${path} already exists.`);
	process.exit(1);
}

writeFileSync(
	path,
	`---
title: ${JSON.stringify(title)}
description: ''
pubDate: ${today}
tags: []
draft: true
---

`,
);
console.log(`Created ${path}. Remove \`draft: true\` when it's ready to publish.`);
