import syntaxHighlight from "@11ty/eleventy-plugin-syntaxhighlight";

export default function (eleventyConfig) {
  // copy public/ straight to output
  eleventyConfig.addPassthroughCopy("public");

  // syntax highlighting (build-time, zero client JS)
  eleventyConfig.addPlugin(syntaxHighlight);

  // all posts collection, sorted by date descending
  eleventyConfig.addCollection("posts", (col) =>
    col
      .getFilteredByGlob("content/posts/**/index.md")
      .sort((a, b) => b.date - a.date),
  );

  // all unique tags across posts
  eleventyConfig.addCollection("tagList", (col) => {
    const tags = new Set();
    col
      .getFilteredByGlob("content/posts/**/index.md")
      .forEach((post) => (post.data.tags || []).forEach((t) => tags.add(t)));
    return [...tags].sort();
  });

  // date filter for templates
  eleventyConfig.addFilter("readableDate", (date) =>
    new Date(date).toLocaleDateString("en-US", {
      year: "numeric",
      month: "short",
      day: "numeric",
    }),
  );

  eleventyConfig.addFilter("filterByTag", (collection, tag) =>
    collection.filter((post) => (post.data.tags || []).includes(tag)),
  );

  // eleventy.config.js
  eleventyConfig.amendLibrary("md", (mdLib) => {
    mdLib.set({ html: true });
    // tables work by default in markdown-it
  });

  eleventyConfig.addPassthroughCopy(
    "content/**/*.{avif,png,jpg,jpeg,gif,webp,svg}",
  );

  return {
    dir: {
      input: "content",
      includes: "../_includes",
      data: "../_data",
      output: "docs",
    },
  };
}

//
// FILTERS
// eleventyConfig.addFilter("makeUppercase", function (value) {
//   /* … */
// });
// eleventyConfig.addAsyncFilter("makeUppercase", async function (value) {
//   /* … */
// });
// SHORTCODES
//   eleventyConfig.addShortcode("user", function(firstName, lastName) { /* … */ });
// Async-friendly in v2.0.0
// eleventyConfig.addShortcode("user", async function(myName) { /* … */ });
