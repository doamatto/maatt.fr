+++
title = "Creating an Intranet like the Internet"
date = "2022-06-01T04:32:00Z"
description = "Some people self-host music. I'm trying to self-host my own Internet."
updated= "2022-12-09"
+++

Apologies in advance; it's been a while since I last wrote and, arguably more importantly, have stayed on the quiet side of GitHub. I have *some* things planned for this month, but only time will tell if I will get anything out during the month (it's a hectic one).

---

The Internet is one of those things that was amazing: no two sites looked the same, banner and video ads were too bulky to be used (naturally, text ads were used instead and were far superior for the end-user, imo). **And then the Internet became centralised** with the big dogs like Cloudflare, Google, Amazon, and Microsoft being in control of the vast majority through CDN and VPS hosting.

The solution was simple for many: **host things yourself again.** Instead of:
  - Spotify— host a [Plex](https://www.plex.tv), Subsonic, or [Jellyfin](https://jellyfin.org) server
  - Nest— host a [Home Assistant](https://www.home-assistant.io) server
  - Alexa— host [Mycroft](https://mycroft.ai)

The list is long and our time is short; you get the idea. The core principle is great, but it was only brought so far. One server hosting all your services, or multiple servers hosting one or two services each. No parity. Seldom proper backups. Zero security. In a perfect world, this is all you need. But, we don't live in a perfect world where ports forward properly, services run the right way the first time, et al., et al.

## Farer— the solution that checks all the boxes
  - ✅ Hosts far too many things so that the Internet is harder to censor or go down
  - ✅ Provide a secure way to communicate with those on the Intranet, as well as communicate with servers
  - ✅ Be inaccessible to the public to the point where writting about it in the first place is mostly futile

Over the past couple of months, I've been working exhaustively with friends (namely [Daniel](https://cyckl.net)) to slowly get what we dub [The Farer Group](https://farer.group) up and running. If you're someone who likes [reading privacy policies,](/legal/) you would have seen mentions to projects such as `Haven Municipal`, `The Farer Group`; these are all the brainchild umbrella names given to this project to ultimately create a mini Internet in an Intranet.

Since Farer is still being constructed every day, all of this is tentative, but I'd argue that adds to the fun just a titbit. At some point, I'll write a follow-up on the progress we keep making on Farer. Until then, this is a *long* post; so hydrate now.

## Founding principles and other mumbo jumbo
We were tired of the downtime we'd see from services like Discord because of Cloudflare or Azure having outages. We hated not being able to stream or download music we owned because the alternatives were cumbersome to sync and seldom to scrobble. The list goes even longer than the things you self-host for what we were tired of. In other words, **we were tired of outages of big companies stopping us from doing our lives.**

We didn't appreciate the troves of data that was collected on us by companies and wanted to detach ourselves where we could to be able to remove the weakest links in the chain as much as possible. **We still enabled dependence on services needed to keep our own uptime or to backup our data properly.**

Daniel had used an Oracle virtual machine for a long time, but we eventually dedicated a tiny section of my VPS with 1984 to helping provide a better place to have microservices running that wouldn't hurt my wallet too much. Backups were a place of struggle: I proposed [BorgBackup](https://www.borgbackup.org) with Hetzner's servers while Daniel wanted to look into Rook and Ceph. As of writing, this is something still being decided, but nothing of merit or irrecoverability is being stored on our servers yet, so it's nothing of concern.. yet. Now's a great time to hydrate again, by the way.

## Creating security by voiding security
**Since conventional domain names and TLDs were out of the question, we had to craft our own in-house.** We settled upon `.fa` (**Fa**rer) and used `dnsmasq` for a month or so, we switched to CoreDNS for the ease of making an API surrounding domain creation. **By creating fake domains, browsers wouldn't behave like normal.** Browsers search the [Public Suffix List](https://publicsuffix.org/list/) to find out what is and isn't a real web domain. By appending a `/` to even time you go to a website (to go to `matt.fa`, you'd type `matt.fa/`), you can "mitigate" this issue. This is a pain, but has a relatively simple solution. By using the same method that extensions like uBlock use to bring you to a page for blocked assets, we can check if an address is one of ours or not and guide the browser to properly making the connection.

Another issue comes up shortly after and that's with the lack of HTTPS. Although we're using a WireGuard VPN which means all of our communication is secure regardless, browsers will still complain. By creating our own root Certificate Authority[^1], we are able to then issue certificates for these domains and have proper TLS traffic. There is one pitfall: **we have created the grounds for a man-in-the-middle attack.**

Currently, everyone in Farer has some connection to each other and a "sufficient" amount of trust that no foul play will occur. However, once you trust a root certificate, all websites can be mimicked. For instance, we could host a fake `google.com` and use our root certificate to create a certificate for `google.com`. On any clients that trusted this certificate, they would likely never know that `google.com` was not what they expected it to be, unless they checked the certificate before doing anything further. **This is a major security issue, one that should simultaneously discourage and encourage efforts to do a project like this.**

## Sanely hosting services 101
The first step is to not be us. Although Daniel and I both know a fair amount about Linux system administration and maintain servers for our own websites, we created a lot of complexity that was generally necessary to achieve the distributed hosting that we wanted to have as much uptime as possible.

Using Kubernetes, namely K3s, we brought CoreDNS across our servers and are slowly bringing the services we kept in Docker or sans container to K3s. **Using its native capability to scale, as well as the parity functionality of PostgreSQL, we're able to create a reundant system** that should *just work* whenever we have downtime, additions, or deletions of systems from the network or cluster. Now's another good time to hydrate; almost there!

## Conclusion: whew!
I've been working exhaustively on certificates, internal APIs, and other formalities and, by extension, haven't dedicated too much time to the personal projects I enjoy doing on GitHub. I haven't done that much in the way of drawing or filming, which is a weird thing in of itself. With the continous progress on Farer, it's nice to see it all come together into something that we can all be proud to have worked on creating something pretty cool.

I mentioned earlier that it was futile to write about Farer since it won't be public, which is *technically* true. Seldom things will be viewable by the public bar what we have to do. *However*, membership is all invite-only to keep that circle of trust going. Don't harass me for an invite; harass Daniel ;)

If you have suggestions or questions of how we're running Farer, or want to simply chat; [don't hesitate to reach out over email or other means.](/contact/)

[^1]: Few companies and governments have the keys that allow companies and people to get their sites to have HTTPS. Some notable root CAs are ZeroSSL and Let's Encrypt.

