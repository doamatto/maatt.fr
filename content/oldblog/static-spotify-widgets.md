+++
title = "Static Spotify Widgets"
slug = "static-spotify-widgets"
date = "2020-12-17"
description = "Static widgets are way better than several kilobytes to load a stupid tweet."
tag = "Concepts"
class = 'bg-concepts'
+++

## ⚠️ Heads up!
This page is for a project that doesn't exist anymore or never existed in the first place. The best term for something like this is **vaporware.** In my eyes, however, it's better to keep these pages than to remove them, [creating linkrot.](@/blog/linkrot.md)

Images have also disappeared/been deleted by the magic of compression. I don't question it (neither should you), but do note some images are missing from this page because of such.

---

I love music. I listen to an assortment of genres, ranging from as large as pop and rock to as niche as the smallest indie bands from foreign countries. I would never have gained this addiction for such an amazing form of entertainment had it not been for platforms like Spotfiy and Bandcamp. I decided that, with the update to my site to a Next.js instead of the old Jekyll version, I should give myself less restricitions to let myself have more fun with this.

One prime way is the new area of what I'm listening to billions of times a day. This took a lot of time and, although the source code isn't ready to be published quite yet (I still have to create it and the about page, as of writing), a nice dive into how this will look seems like fun.

With the help of [Charlie](https://epic4809.github.io) and [Daniel](https://daniel.cafe). We got to that final iteration. Here's the logic behind all of it:

- **A light and dark version is a must.** Because of such, we needed to design at least 2 versions, one that would look great when the visitor was broadcasting that they were on light mode and one when they were on dark mode.
- **A fun option is a nice to have.** Why not go all the way with "Spotify Green?" A fun option is nice to have, but definetly not needed. It'll be an option you can have as opposed to the automatic light and dark theme banners.
- **It needs to be clear where you are going and who the data is from.** Attribution is essential. The Spotify logo has to be there. The official colours (green, white, and black).
- **It needs to be responsive.** Short titles like "NiNa" and "Ready to" can appear big and proud, but longer titles like "NIGHT RUNNING" and "The Devil's Bleeding Crown" need to go down in size to fit into the constraints of the widget.
- **It needs to be touch-friendly.** You're wasting a lot by having both a desktop and mobile version of everything. Because of such, one version that works great for both desktop and mobile is essential.

With these criteria out of the way, I made the first prototypes in Figma and invited Charlie to help out on expanding them.


We checked a lot of the boxes with this first version: a fun option, clarity, touch friendly, and there were versions for dark and light. However, we never experimented with different artist and song/album names. It would need work. Like any good design should be, we slept on it and figured it still needed work.

I sent a message over to Daniel and he taught me about a tool I wish I knew about sooner: [Auto Layout](https://help.figma.com/hc/en-us/articles/360040451373). In short, auto layout lets you prototype things that will act reactively based on another (growing to fill, shrinking to fit, etc). With this new found knowledge, I put it straight to work as he taught me, along with some of the advice for padding on the widgets themselves, and got what is now the final product.

---

Although this is starting as just a concept, I can't wait to create it into a real tool and share it on GitHub for others to enjoy a neat way to embed Spotify albums and songs. While working on the final widgets, it also hit me that I should make one library for Spotify widgets and more, that you can use with React. But that's a story for another day, at another time.
