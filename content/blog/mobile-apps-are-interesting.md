---
title: "Mobile apps are... interesting"
date: "2021-06-18"
description: "Mobile apps followed desktop apps going from bad to worse."
---

As a kid from the early 2000s, I can technically say « Back in my day, we had rotary telephones » and similar things and be telling the truth. I did have a box television with OTA (watched a lot of PBS), had a 1st iPod (5Go :astonished:), and had a Core 2 Duo as my desktop. The internet was starting to manifest some of the biggest sites to date: YouTube a month before me, MySpace, Facebook, and Tumblr. All these sites had something in common: they all looked starkly different. Sure, everything still had the old internet look to them. But there was a clear distinction between them all. Vastly different ways they were layed out, the content on them, et al.

Sadly, that faded away. More and more sites started to look like each other. Mobile apps did a similar trend. Recently, you'd be hard pressed to find an app that was unique and looked different. There are some few ones: notably Discord, TunnelBear, and Windscribe all have very different designs from the vast majority of apps of: bottom bar, side menu, content in the centre. There's nothing wrong with that layout, but that's the only layout there really is. There's no added personality to show that an app is different from the others apart from an accent colour.

Mobile apps have started to follow a trend from desktop: non-native code. On desktop, a lot of your favourite or most used apps like Spotify and Steam run off of web technologies for the most part. This isn't necessarily a terrible thing in the case of Steam. It makes it easier for them to give you one central place to buy games and communicate with friends, as well as let you have a mini web browser in the Steam overlay. However, when you look at Spotify, it uses a tool called Electron known for essentially taking your web apps and making them into EXEs. On the surface, it's a little woopity-doo, but when you realise that Electron is basically just another Chrome instance (not window or tab), then it clicks. These apps are much slower and have far more restricting limits than before.

In the mobile world, this takes the shape of React Native which is similar to Electron in the sense of it taking your web apps and making them into mobile apps. Fortunately, it does try to adapt as much as possible into being actual native APIs, meaning these apps are relatively fast. However, there's still a fatal flaw with React Native in the fact that it's still being transpiled from JavaScript, which is suited for the web, not transpilation, to this native code.

---

For smaller teams, I always don't care if they use Electron because it would be a lot to ask a solo developer, for instance, to create an app that works on Windows, Mac, and Linux all in native code. It would be much harder to maintain and take much more time to prevent feature disparity. However, alternatives do exist such as Qt, Google's Flutter, and Vlang's native UI library, to name a few. I enjoy Flutter the most because it allows you to combine essentially all of your codebases into one that compiles to machine code on desktops and mobile, and JavaScript for the web. That and Dart is a pretty nice language to work in, in my opinion.

> **Edit:** A lot of proofreading and improvements to clarity.
