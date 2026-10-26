import { type CollectionEntry, getCollection } from 'astro:content';

export type Post = CollectionEntry<'blog'>;

/** Published posts, newest first. Drafts are included only in dev. */
export async function getPosts(): Promise<Post[]> {
	const posts = await getCollection('blog', ({ data }) => import.meta.env.DEV || !data.draft);
	return posts.sort((a, b) => b.data.pubDate.valueOf() - a.data.pubDate.valueOf());
}

export function getTags(posts: Post[]): string[] {
	return [...new Set(posts.flatMap((post) => post.data.tags))].sort();
}

export function readingTime(body: string | undefined): number {
	const words = (body ?? '').trim().split(/\s+/).length;
	return Math.max(1, Math.round(words / 230));
}
