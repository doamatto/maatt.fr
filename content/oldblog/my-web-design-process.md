+++
title = "How I Design and Build Websites"
date = "2021-04-09"
description = "I've gone through so many good and bad tools; here's the 411 of how I get it all done and dusted."
+++

Over time, I've been lucky to not only tweak my personal portfolio to however it suits my fancy but been able to work with several different [people](https://epic4809.github.io) and companies (each one of those words is a different site I've worked on). I've played with just about every framework under the sun too: Next.js, Jekyll, Hugo, Sapper, and Vue, to name a few. I've slowly developed a system as to how I make sites for both clients and personal projects that when I was working on the refresh of [Michael Holiday's website](https://www.michaelholidaybooks.com), I decided to whip out the clickiest keyboard ever and go ham. I also decided it's a good idea to name each section as a part of building a house. Which is honestly a good analogy.

## You've got to start somewhere. That somewhere should be planning.
Despite what you may see me do sometimes if you've looked at me code before, it's essential to plan out how you're going to do something. In this case, it's mostly a matter of planning site layout and flow. I usually use a pen and paper for this, because tools like Figma, albeit are amazing to use, are too time-consuming from a proof-of-concept. If I need to establish more specific things for a client, then I might use it.

I'll draw out relatively simple stuff to establish a general layout and sprinkle in some keywords or a motto so I have some context if I pick it up later and don't understand it.

## After you plan, it's time to buy everything you need.
In this case, it's really just setting up your environment. Although I've used Jekyll for past clients like Glitch Entertainment and on past projects like Mello, I've switched to almost always using vanilla code or Next.js. The simplicity of Next.js paired with Vercel's servers makes for an amazing combination.

I also used to use [SCSS/SASS](https://sass-lang.com/), a preprocessor that made your CSS look way more manageable. I recently bit the bullet and tried out [Tailwind CSS](https://tailwindcss.com). It's safe to say I'm not looking back. I still use CSS or SCSS/SASS for small things that may not be practical use Tailwind for, or require `!important` for, but I've been loving Tailwind a ton.

When using Next.js, I use TypeScript rather than JavaScript purely for typings. They are a life-saver when doing testing and can make it much easier to find issues. Just don't set every typing to `any`.

## Once you've got everything you need, it's time to put it all together.
This can take anywhere from a long day or two, or almost 3 months (like my portfolio redesign haha). It really depends on what my deadlines are and how much I want to do, if it's a personal project. If I want to go above and beyond on my own stuff, I'll do it if it seems fun.

With things like the web redesign for Michael, I spent a good amount of time nailing in the colour scheme with his orange and muted black (or grey, whatever suits your fancy), while still bringing in interesting designings to components of every page.

## Don't forget to hook up the HVAC and plumbing.
When I finish a client's site, it's always up to them where it gets hosted. Most of the time, I've recommended they use Vercel and pair it with their analytical tool if they need the data. Most all of them have followed said advice and­— well, I haven't heard any complaints yet!

I personally love Vercel since the dashboard is just a piece of piss to use. If I needed the data from their analytics for my portfolio, it's quite literally one click away, which is half the reason I recommend it to clients.

## Put it on the market (and pray).
Once a site is done, I usually give it a day before giving it to a client. I like to look at it the next day to see if everything not only still works but looks good. It's the same philosophy you should really have for any big purchase. Look at an assortment, narrow to things you like, and sleep on it. But, once it's all done and dusted, a beautiful 7z is made or I have been graciously been working on a Git repo, which means the work has been submitted ages ago.

---

Although I don't always go into it, I've always enjoyed doing design and development. It technically means I always get the outcome I like when it comes to making software, which no one complains about when they're making something, themselves. I do still enjoy other avenues though. Maybe I'll write something up on that in the future.

Until then, cheers.
