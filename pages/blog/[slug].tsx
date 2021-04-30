import Head from 'next/head'
import hydrate from 'next-mdx-remote/hydrate'
import { GetStaticProps, GetStaticPaths } from 'next'
import { NextSeo } from 'next-seo'
import React from 'react'

import { default as Page } from '@/components/pageData'
import { staticProps, staticPaths, MDXComponents } from '@/lib/postData'
import { Post as SEO } from '@/layouts/seo'

export default function BlogPostPage ({ mdxSource, frontMatter }) {
  const title = frontMatter.title
  const content = hydrate(mdxSource, {
    components: MDXComponents
  })
  
  return (
    <>
      <NextSeo {...SEO(frontMatter, 'post')} />
      <Head>
        <title>{title} - doamatto</title>
      </Head>
      <Page frontMatter={frontMatter}>{content}</Page>
    </>
  )
}

export const getStaticPaths: GetStaticPaths = async () => {
  return staticPaths('posts')
}

export const getStaticProps: GetStaticProps = async ({ params }) => {
  return staticProps('posts', { params })
}
