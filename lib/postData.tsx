import fs from 'fs'
import readingTime from 'reading-time'
import { serialize } from 'next-mdx-remote/serialize'
import matter from 'gray-matter'
import path from 'path'
const root = process.cwd()

// MDX Components
import Image from 'next/image'
import link from '@/components/mdx/link'
import {Timeline, Item} from '@/components/mdx/timeline'
export const MDXComponents = { Image, a: link, Timeline, Item }

export async function staticPaths (type) {
  const posts = await getFiles(type)
  return {
    paths: posts.map((p) => ({
      params: {
        slug: p.replace(/\.mdx/, '')
      }
    })),
    fallback: false
  }
}

export async function staticProps (type:string, { params }) {
  const post = await getFileBySlug(type, params.slug)
  return { props: post }
}

export async function getFileBySlug (type, slug) {
  const source = slug
    ? fs.readFileSync(path.join(root, 'data', type, `${slug}.mdx`), 'utf8')
    : fs.readFileSync(path.join(root, 'data', `${type}.mdx`), 'utf8')

  const { data, content } = matter(source)
  const mdxSource = await serialize(content)

  return {
    mdxSource,
    frontMatter: {
      wordCount: content.split(/\s+/gu).length,
      readingTime: readingTime(content),
      slug: slug || null,
      ...data
    }
  }
}

export async function getFiles (type) {
  return fs.readdirSync(path.join(root, 'data', type))
}
