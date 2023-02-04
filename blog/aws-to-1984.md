+++
title= "Moving from AWS to 1984 Hosting"
description= "This was a rollercoaster of a journey just to make my site absurdly purple."
date= "2022-04-02T00:59:56-08:00"
updated= "2022-07-31"
+++

Recently, I decided to mess with my site again. This was a terrible idea for two reasons, both not being that I shouldn't mess with it as often as I do.

1. Merging a branch managed to break AWS Amplify **entirely.** It's stuck in a perpetual loop of not knowing what life is. Reminds me of why I left Vercel too.
2. **I wanted to cut out carbon emissions from the projects I do.** Undisputably, climate change is a b\*tch that's screwing with us all (I may live on the coast, but we are still in a desert that's struggling.) Being able to cut emissions from projects and, at some point, ideally my day-to-day to the best I can would be a nice contribution to a downward-spiraling problem.

But, this isn't a story about how I decided to be a climate activist (activism takes a lot of time), rather the rollercoaster that was bringing this site back online and up-to-date.

## Editing the site in the first place
The only thing I know for a fact changed were that things in the centre of the page aren't centred and an absurd amount of the page (eg. links) are purple now. Looking at commit history, I decided to:
- rewrite about section (well overdue)
- update dated links
- set the default for permalinks to `maatt.ch` from `doamatto.xyz` (both work fine, I just like the `.ch` for SEO reasons)
- made links purple
- changed how feeds look
- changed literally every little bit of how text looks
- made a lot of page content purple
- made horizontal rules prettier
- [and way too much more.](https://github.com/doamatto/maatt.fr/pull/213/)

## Leaving AWS and finding a new home
I had actually wanted to leave AWS for a long while. Just as soon as I started using them, I wanted to stop. I was basically waiting to start to pay for a glorified S3 bucket. Although I wouldn't be able to complain with how dirt cheap it would have been, too many issues were pushing me away from it:
- inherent privacy issues with AWS and using them as a hosting provider
- no manual deploys from a Git hash
- builds would sometimes not get recognised
- an overall terrible website

All but the first were the same issues I had with Vercel: couldn't deploy what I wanted reliably, which is unfortunate. I now set off looking for a generally private hosting provider that was powered 100% by green energy. It's a stretch to say such, of course: it's rare to have 100% green energy. When the sun goes down, solar panels can't create power. I was willing to settle with a general committment to staying as clean as possible.

This search was easier said than done, though. I had a list of 10 providers that I narrowed down pretty quickly from either vague promises, obsurd costs, and conflicting information. It was practically a cointoss between [1984 Hosting](https://1984.is/) and [Exoscale.](https://www.exoscale.com/) The ultimate reason that pushed me for 1984 was their independence: they handle all of their operations themselves, and that's something you've got to respect. Some other providers that came to mind for your consideration if ever are:
- [Hetzner](https://www.hetzner.com/)
- [OVH](https://www.ovhcloud.com/fr/)
- [Bahnhof](https://bahnhof.cloud/)
- [Greenhost](https://greenhost.net/)
- [Uberspace](https://uberspace.de/de/)

## Git hooks: The Secret Sauce to having a sane deploy
Git hooks have a pretty iffy reputation: on the one hand, they're an incredibly powerful scripting tool that are perfect for instances like these where you want a low-effort setup of your web server, but are atrocious to setup from the general confusion that comes with it. It wasn't too hard though at the end of the day.
1. On the remote server, create 2 folders: `repos/` and `sites/`
2. Create a bare-repository in the repos folder (`git init --bare repos/maatt.ch.git`)
3. On your local computer, add the remote server as a remote (`git remote add prod root@1984.is:/root/repos/maatt.ch.git`)
4. On the remote server, create a `post-receive` hook (see example [here](https://github.com/timharek/git-hooks/blob/main/post-receive.example); should be saved in `repos/maatt.ch.git/hooks/post-receive`) and make it executable (`chmod +x repos/maatt.ch.git/hooks/post-receive`)

Complicated? It was. Fortunately, that was actually the easiest part of setting things up.

## God, I hate Caddy
I've used Caddy maybe once to host a local file browser to test a site or two. I decided to use it in production because:
1. I didn't want to install Python to install `certbot` via Pip on my VPS
2. I didn't want to install Snap to install `certbot` via snapd on my VPS
3. I didn't want to spend a lot of time and energy creating configurations for redirects and other nonsense (which was a pattern with me and Nginx for quite awhile)

I decided to make a *basic* configuration for Caddy: here's my domains, here's where the webroots are, go ham. In the nature of computing, that would be too easy and I got plenty of issues: all of which were due to me being too dumb to be smart. That's not even self-deprecation.

I made a subdomain to test before I moved both root domains and `www` subdomains to 1984 and wanted to test that first exclusively. My configuration enabled that site, the WWWs, and the redirects for the roots (to go to `www.` of their domain). Leaving those domains in caused some problems: since those domains weren't pointing to the right server, Let's Encrypt would never generate certificates for it. And since Let's Encrypt would keep getting requests from Caddy, I would eventually get ratelimited, with the ZeroSSL fallback in Caddy taking over. As of writing, ZeroSSL is powering encryption because, as far as I know, the server is still ratelimited.

Once I restart the server, everything should be back to normal using Let's Encrypt, ~~but that would make too much sense.~~

## Conclusion
I'm happy with 1984 so far. Not only do I like the name of the service and its example domain `orwell.is` (ba dum tiss), I think it's the start of a good relationship. The site is actually [open-source again under the 3-clause BSD license.](https://github.com/doamatto/maatt.fr) It seemed appropriate to re-open it for the start of a new "site generation."

I'm open to suggestions and tips of how to make this solution that much better; [don't hesitate to reach out over email or other means.](/contact/)
