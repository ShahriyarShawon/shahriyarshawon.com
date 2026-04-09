import fs from "fs";
import path from "path";

const title = process.argv[2];

if (!title) {
  console.error("Usage: npm run new-post -- \"My Post Title\"");
  process.exit(1);
}

const slug = title
  .toLowerCase()
  .replace(/[^a-z0-9]+/g, "-")
  .replace(/^-|-$/g, "");

const now   = new Date();
const year  = now.getFullYear();
const month = String(now.getMonth() + 1).padStart(2, "0");
const day   = String(now.getDate()).padStart(2, "0");
const date  = `${year}-${month}-${day}`;

const dir  = path.join("content", "posts", slug);

if (fs.existsSync(dir)) {
  console.error(`Post already exists at ${dir}`);
  process.exit(1);
}

fs.mkdirSync(dir, { recursive: true });

const frontmatter = `---
title: ${title}
date: ${date}
tags: []
description: 
---
`;

fs.writeFileSync(path.join(dir, "index.md"), frontmatter);
console.log(`Created ${dir}/index.md`);
