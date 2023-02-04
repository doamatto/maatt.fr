+++
title = "Why analytics are a niche tool that isn't for everyone"
slug = "why-analytics-are-a-niche-tool"
date = "2021-07-05"
description = "I used analytics for about a month, then stopped because it was futile."
updated= "2022-07-31"
+++

There are a few things that come to mind when you think of the Internet these days:
- slow websites,
- lack of data privacy; and:
- large, bulky assets (eg. images, stylesheets, et al).

When I redesigned this site about a month ago ([doamatto/doamatto#206](https://github.com/doamatto/maatt.fr/pull/206)), I had two goals in mind: to make the site faster and to test Plausible, a privacy-included self-hosted analytics tool. Considering how I was moving from Next.js, a beginner-friendly version of React, to Zola, a static generator written in Rust, it wouldn't be hard to make the site much faster. People confuse the hydration, SSR, and other features you get with React to help performance as excuses to make big, bloated sites when, in reality, you should do what needs to be done: nothing more, nothing less. This principle lets you make the best experience for all users: be it on a 3G connection in some countries or on a gigabit connection in others.

At the end of the day, however, most sites don't need analytics tools. They're a niche that only really makes sense for sites that sell a service or product.

## The data isn't useful on most sites
I feel like a lot of people miss that point, however. Numerous sites have analytics tools that really don't need them. Services like Cloudflare Insights and Vercel Analytics give admittedly extra information as well. Sites that need to sell things can benefit from these tools since they can let you better adjust your marketing. However, for most individuals, it's pertinent to keep your audience engaged and enjoying your content, not collecting data from every crevice of their device.

## Data shouldn't be the root of your site
Those writing blog posts or making [now pages](https://nownownow.com/about) don't need all this extra data. Being driven by purely numbers makes your hobbies feel like jobs: as if you *have* to increase the number of views, or *have* to get more conversions. **You shouldn't be driven by numbers for your hobby, you should be driven by your love for your hobby.**

## Focus on making a site for the genuine masses
There are large portions of [not only the United States](https://www.pewresearch.org/internet/fact-sheet/internet-broadband/#who-has-home-broadband) (see both Comunity and Income), but also [across the world](https://www.measurementlab.net/visualizations/)[^1] with slow or no Internet. These slow connections make big sites feel like they take ages to load. This limits the number of people with access to content either for entertainment or out of need (eg. studying and learning).

## A simple solution: stop supporting a bloated web
There is a simple solution: stop bloating the web as much. Even on my average Internet speeds (about 200Mbps down, 20Mbps up), some sites take a few seconds to load due to the sheer girth of files needed to load them. Outside of removing analytics where it isn't needed, you can make your sites more accessible by:
- [making them more accessible](https://www.a11yproject.com/),
- minimising and or [dithering](https://www.cs.princeton.edu/courses/archive/fall00/cs426/lectures/dither/dither.pdf) images,
- [using one font](https://web.dev/font-best-practices/) or system fonts (as opposed to several fonts/weights),
- use modern standards and formats like [WebP](https://web.dev/serve-images-webp/), [brotli (gzip)](https://web.dev/codelab-text-compression-brotli/); and:
- using JavaScript where needed, not where convenient.

## Conclusion
The Internet is a place where we've been given the freedom to do so much, but we should still be mindful of the limitations not of our own hardware, but of others. When I test things like the tools I make or the sites I work on, I do so almost always on my Raspberry Pi with a throttled connection. This allows me to know a « worst case scenario» in my eyes, with it being a low-powered computer with a limited connection. Help push for a more [sustainable](https://www.sustainablewebmanifesto.com/), [accessible](https://www.a11yproject.com/values/), and [open](https://www.mozilla.org/en-US/about/manifesto/) Internet for everyone, now and into the future.

> **Edit:** A lot of proofreading and improvements to clarity.

[^1]: I didn't link directly to the global statistics, as it processes a lot of data and eats up computer resources. For a direct link, you can head [here](https://datastudio.google.com/s/r6ZnlTmHfwE), just know it'll take a while for data to load.
