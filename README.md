# leviorero.com

My personal site and weekly blog, built with [Astro](https://astro.build) and hosted on GitHub Pages.
My professional work lives at [lordoferos.github.io](https://lordoferos.github.io) and [wrangla360.com](https://wrangla360.com).

## Writing a post

```sh
npm run new -- "My post title"   # creates src/content/blog/my-post-title.md as a draft
npm run dev                       # preview at http://localhost:4321 (drafts are visible here)
```

Write in Markdown. When it's ready, delete the `draft: true` line, then commit and push to `main`.
GitHub Actions builds the site and publishes it in about a minute.

Frontmatter fields:

| Field         | Required | Notes                                         |
| ------------- | -------- | --------------------------------------------- |
| `title`       | yes      |                                               |
| `description` | yes      | Shown in post lists, RSS and link previews    |
| `pubDate`     | yes      | `YYYY-MM-DD`                                  |
| `tags`        | no       | e.g. `['books', 'maps']`, each gets a page    |
| `heroImage`   | no       | Relative path to an image in `src/assets/`    |
| `updatedDate` | no       |                                               |
| `draft`       | no       | `true` hides the post from the live site      |

Use a `.mdx` file instead of `.md` when you want to embed components or interactive pieces in a post.

## Other pages

- `src/pages/interests.astro`: edit the `interests` list at the top
- `src/pages/now.astro`: what you're up to, and bump the `updated` date
- `src/pages/about.astro`
- `src/consts.ts`: site title, description and external links

## Setup (one time)

1. Install Node 22.23.4 or newer (`brew install node`), then run `npm install`.
2. Create a GitHub repo (e.g. `lordoferos/leviorero.com`) and push this folder to it.
3. In the repo, go to **Settings → Pages**, set **Source** to **GitHub Actions**, and set the custom domain to `leviorero.com`.
4. At your domain registrar, add these DNS records:
   - `A` records for `@` pointing to `185.199.108.153`, `185.199.109.153`, `185.199.110.153` and `185.199.111.153`
   - `AAAA` records for `@` pointing to `2606:50c0:8000::153`, `2606:50c0:8001::153`, `2606:50c0:8002::153` and `2606:50c0:8003::153`
   - a `CNAME` record for `www` pointing to `lordoferos.github.io`
5. Once DNS has propagated, tick **Enforce HTTPS** in Settings → Pages.
6. Recommended: verify the domain under your GitHub account (**Settings → Pages → Verified domains**) so nobody else can claim it.
