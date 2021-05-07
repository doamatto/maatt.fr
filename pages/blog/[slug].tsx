import Head from 'next/head'
import { MDXRemote } from 'next-mdx-remote'
import { GetStaticProps, GetStaticPaths } from 'next'
import { NextSeo } from 'next-seo'
import React from 'react'

import { default as Page } from '@/components/pageData'
import { staticProps, staticPaths, MDXComponents } from '@/lib/postData'
import { Post as SEO } from '@/layouts/seo'

export default function BlogPostPage ({ mdxSource, frontMatter }) {
  const title = frontMatter.title
  
  return (
    <>
      <NextSeo {...SEO(frontMatter, 'post')} />
      <Head>
        <title>{title} - doamatto</title>
      </Head>
      <Page frontMatter={frontMatter}>
        <MDXRemote {...mdxSource} components={MDXComponents} />
      </Page>
    </>
  )
}

export const getStaticPaths: GetStaticPaths = async () => {
  return staticPaths('blog')
}

export const getStaticProps: GetStaticProps = async ({ params }) => {
  return staticProps('blog', { params })
}
