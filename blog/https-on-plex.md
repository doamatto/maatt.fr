+++
title="HTTPS on Plex— What a Rollercoaster"
description="After about 3 hours, I setup a custom HTTPS on Plex purely so I don't have to look at that stupid red padlock."
date="2022-03-19T15:24:00-08:00"
+++

A pretty big part of my life is music and, although I know it's one of the worst ways to stream it, I use Plex to access my music on the go, as well as a few movies and musicals I have on the same server. For awhile, I just used Plex's relay servers and remote access while I was on campus or away from my house. But, whenever something like `plex.direct` was blocked, I was SOL. I deployed Tailscale on my home network not long ago and have used it to mitigate this problem, but whenever I use my laptop, I get rudely reminded of how I'm using an insecure connection.

## Securing the connection (technically)
Using Apple's very conveinent Keychain Access app, I was able to create a certificate authority (also called a `CA`; basically a company that says "Oh yeah, I know `maatt.ch`. You have the same key as me, so you must be him.") who gives certificates (that aforementioned key) to those who run websites, amongst other things like email servers or remote desktops. For this website, Cloudflare automatically generates a certificate for me, but I can't really take advantage of that luxury in my instance as the website I use on my local network for things like Plex isn't a real website. Type `plex.lleb` as many times as you want in your browser and it'll either do a search for it or tell you it isn't real. 

Getting back to the point, using Keychain Access, I exported a certificate that would expire in 2026, so I wouldn't have to worry about renewing it anytime soon. By entering my Plex server's settings and, with advanced settings shown, I set the location of my certificate file (that I exported as a `.p12`) and the password that I set in Keychain access. Plex didn't behave well with a `.p12` though, so I changed the file extension to `.pfx`, which is basically just a funny way to say `.p12`: both are the same PKCS #12 file. I also set the custom server access URL to accept `https://plex.lleb`, so that I could actually use the domain in apps.

## Telling your computer that it's stupid
A fun feature of computers is that they're not always the smartest. Fortunately, in this instance, that's a good thing. Without doing anything more, I would always get warnings still about an untrusted certificate (bar on the Mac that I created the CA on). I used Meraki to deploy the CA on my other devices to remove this warning, which did on my Windows devices. But, curiously, it still didn't work on iOS or macOS. Both had the CA, so what gives?

## Telling Apple that they're stupid
Safari warned that the certificate was "not standards compliant." Taking to the Internet, I was quick to find that Apple decided that, with iOS 13 and macOS 10.15, web certificates and CAs needed to follow some new rules:
- CAs and certificates must have a key size of at least 2048 bits (the CA and certificate were both 4096)
- CAs and certificates must use SHA-2 hashing (which they were)
- certificates must have a **validity period of 825 days or fewer**

That last point was a killer for this instance. 825 days is about 2 and a half years, and is far less than my old 2026 estimate. So, I settled with an even 2 years or 730 days until needing to do this hot mess all over again.

## Conclusion— Telling me I'm stupid
I could have actually seen this problem coming much sooner. I was working on using my own certificates for my desktop as well so that I wouldn't have to see warnings about bad certificates when doing remote desktop. It had the same warning as the web certificates, but I thought it was just Windows being the weird operating system it was and ignored it for the time being.

There is hindsight to be had, however. I now get to see a nice green padlock whenever I'm listening to music or watching something on Plex. The little things in life, y'know?
