---
title: "My woes with Hugo, the SSG"
date: "2022-11-19"
updated: "2022-12-13"
---

For about 7 years (I'm getting old, and I don't like it.), I've had some kind of website. It started as a HTML file and a CSS file, and eventually went to Jekyll for a couple of years. I made a [theme that surprisingly received decent reception](/blog/my-first-jekyll-theme/) and had a generally good experience with Jekyll. After a while though, the pains of setting up Bundler, installing Ruby, and the slowness of Jekyll in part to the Ruby VM.

I eventually got rid of it for [Next.js](https://nextjs.org) near when it started to emerge in popularity but hated the number of dependencies that grew and the time it took for NPM to fetch them (I'm aware of Yarn and PNPM, but they seem like band-aid solutions, albeit solutions that do help). It also didn't help that each page was HUGE: metric crap tonnes of JavaScript files just to load a page with some text and an image. It was excessive. Given 2 or 3 years, I dropped it [Zola](https://www.getzola.org/). With Zola, it finally clicked and I had basically no more issues with generating my site. It was native, was a single binary, and, most importantly, had a familiar templating library: [Tera](https://tera.netlify.app), which resembles the Liquid templating I enjoyed with Zola.

Zola's only flaw, for me, was that it never worked on my VPS with Überspace, a now non-issue, but one that inevitably continued to arise with other services I'd use like AWS Amplify and even my own Raspberry Pi. The "no-dependency" tool did have, in a sense of the word, dependency on certain versions of libc that I just wouldn't have installed and couldn't install, at least not with ease.

Fast-forward to 5 October 2022 and I'm ready to make another incremental change to my website's design intended for 2023. More importantly: I wanted to fix the only woe I had with Zola. All the arrows pointed towards Hugo. It was:
  - native,
  - was something I could contribute to (familiar language); and:
  - was something I could compile with general ease (Golang is just `go build` usually).

## The plus side: I got it to work (eventually)
It was NOT easy. RSS was a huge pain in the butt because to change the file name of `index.rss` to `feed.xml`, like it was before my move to Zola, you have to recreate the RSS template. JSON Feeds, an addition [Daniel](https://cyckl.net) nagged me a bit about, was an even larger pain in the butt. So much so, that it doesn't even work the way I want: it should be `feed.json`, not `index.json`. I gave up on it. It's good enough.

That is it. That is the only plus side I had with this. It may have fixed my one woe with Zola, but it introduced way too many more. For brevity, I won't list all, except the ones you should be aware of if you want to use Hugo.

## Downside: Page Bundles
I don't even understand how this was brought into production and seen as sane. With Zola, my folder structure was something like this:
```
content/
- _index.md
- about.md
- other.md
- blog/
  - blogpost1.md
  - blogpost2.md
- projects/
  - project1.md
  - project2.md
```

It made sense. If I didn't need to nest down a directory, like for `/about`, why should I? If I needed to for a section like `blog` (posts) or `projects`, then I could. With Hugo, this format turns into:
```
content/
- page/
  - _index.md
  - about.md
  - other.md
- blog/
  - blogpost1.md
  - blogpost2.md
- projects/
  - project1.md
  - project2.md
```

Not only that: but I have to declare in the config file that:
```toml
[permalinks]
  blog = "/blog/:filename/"
  page = "/:filename/"
  projects = "/projects/:filename/"
```

I have to add so much more complexity just to have `about.md` turn into `/about`. Why? The recommended solution for `/about` is to make a folder called `about` and add `index.md` to it. It's insane. It's complicated. It's so extra. And, worse of all, it's by design! Scratch that: worst of all is that the content folder doesn't make sense. I have HTML files inside `content/page/`. Content should mean Markdown, not markup. Hilariously, to let these one-off pages render properly, they need Markdown frontmatter. It is a bloody mess at best and a tragedy at worst.

## Downside: Adding any "unconventional" "media formats"
Like I said before, Daniel nagged me for JSON feeds. Whatever. In Zola, I would just add `feed.json` to my `templates` folder and set it up as I'd like. Without any more work, it would be generating. With Hugo? Well, you add that similar template to `layouts/index.json`. Why `index.json`? Because that's all that compiled. You add to your config:
```
[outputs]
home= ["HTML","RSS","jsonfeed"]
[outputFormats]
  [outputFormats.jsonfeed]
    mediaType= "application/json"
    baseName= "index"
    isPlainText= true
```

Why `index` for the `baseName` value? Because that's all that compiled. If you're lucky, it will just work and you will now have a JSON feed at `/index.json`. I wanted this at `/feed.json` (feed json -> json feed). No matter how much I beat Hugo with a baseball bat, it refused to compile when I changed the basename, changed the layout file to `feed.index.json`, anything. I barely even got my Atom feed to work, I'm genuinely unsure if this is even how I made JSON feeds work.

## Downside: Documentation is generally poor, and the forum isn't helping much
I will be 100% honest with you: I don't know how I figured out the JSON feed. I started with the obvious: doing what I would with Zola. No dice, whatever. Go to the documentation, find nothing. Go to the forum, nothing of merit. Go to the forum specifically with JSON feed, nothing of merit. Go to StackOverflow, nothing of merit. Go to just general Google searches. Nothing. Of. Merit.

For a lot of things, it isn't this sparse, but I don't understand how people can use this software to a degree that is sufficient for what they need at times. I flat-out do not get it.

## Downside: It doesn't work on Alpine
You *could* install Hugo and the extended version (includes SCSS support) via `APK` and the official repositories; however, this is a grossly outdated version. Using `wget`, I downloaded the latest Linux ARM64 binary and ran it to no avail. After about 15 minutes of troubleshooting, adding the `gcompat` package was the bandaid solution, other than recompiling Hugo entirely. Since Alpine Linux uses MUSL instead of GLIBC and because Hugo is compiled exclusively for GLIBC, it flat out will not work. For small VMs, where Alpine Linux is popular and thrives, this is, naturally, an inconvenience.

## Conclusion
I attempted to use Hugo ages ago and couldn't; wrote the SSG as one that's convoluted and just something to not even humour. Now, I've ported my site to it and I agree with my former self: this SSG is too complicated and messy. Site generators are meant to make your life easier by taking the "dynamic" parts of your site and automating the process for you: turning Markdown to markup and different styling languages into CSS. Where Hugo is asked for anything more than the basics, it crumbles and falls flat in its poor, or lack thereof, documentation and extra work.

So, [naturally, I plan to move from Hugo](https://github.com/doamatto/maatt.fr/releases/tag/v3-init), but where to is the biggest question I've had. I can go back to Zola and suck up the old issues. I can also return to Jekyll and stomach the slower speeds. I can make my own with some Liquid templating libraries and Dart SASS middleware I found on GitHub in Golang or something of that smell. There just isn't any good solution in sight. A pity. [Welp, back to Gutenberg :wink:.](https://github.com/getzola/zola#zola-n%C3%A9-gutenberg) 
