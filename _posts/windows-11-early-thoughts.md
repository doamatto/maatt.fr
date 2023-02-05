---
title: "Windows 11: So good, yet so bad."
slug: "windows-11-early-thoughts"
date: "2021-06-25"
updated: "2022-12-27"
description: "Windows 11 just got announced; it's got a lot going for it, yet it's also so terrible."
---

When I heard about the leaks of a new Windows, I actually thought of it as a joke at first. It brought back the glass design and it replaced the old icons from Windows 7 with what I probably would have found on DeviantArt as a free icon pack. But, yesterday, Microsoft announced Windows 11 to the world, and I'm both a fan and not.

## The new design and look
The new design is on the glassy side; that is to say: lots of transparency. It features the recognisable task-bar moved to the centre of the screen with the remaining strip still remnant. This task-bar change will cause some people to have their muscle memory ruined, but I've heard there will be a setting to revert to the default view[^1]. It's clear that there is a focus on a more unified design across first-party apps, but it has yielded icons that I'm not a particular fan of.

The brand-new, never before seen tiling system got an update to give more presets and tiling memory (quickly open apps to presets of how windows were tiled) what's on your desktop with ease; which is to say, it's not new at all[^2]. I first saw it in Pop!\_OS, with their hybrid approach to make it easy for people who are used to either window management system to feel at home on Pop, but it's been in tiling managers for who knows how long. It's nice to see this feature since it makes it easier for those who are used to that system to feel at home on Windows.

Widgets make a return similar to the ones in the notification panel on macOS. They're likely the successor to Live Tiles from Windows 8 and 10. It's a better system and should be a good addition, for those that use them.

## Gaming just got even better (apparently)
With better integration with Game Pass, it was no surprise Windows made sure their service works great on Windows. However, things like DirectStorage, which allows PCI devices like your graphics card to talk directly with your drives (instead of through your CPU), and auto HDR, should yield greater performance for games that support it. DirectStorage was first seen (afaik) on the Xbox Series X/S and the PlayStation 5.

## A throwback in all the wrong ways
In 2001, you may have remembered a lawsuit from the U.S. against Microsoft due to abusing a monopoly with pre-installing Internet Explorer, giving it an « unfair advantage » over Opera and Netscape (the big names at the time). Since then, IE has been relegated to installing Firefox and Chrome for many.

Hilariously, I wouldn't be surprised if there isn't another antitrust suit against Microsoft with Windows 11 due to the bundling of Microsoft Teams [^3]. This would fall under the same situation of giving them that « unfair advantage » over alternatives like Skype and Zoom. I don't care, as I ~~only really use Jitsi or Google Meet for professional things~~ never do video calls[^4]. 

## A Microsoft Store You'll Want to Use
Android apps are now available via the Amazon App Store, bringing a slew of new apps to Windows and adding feature parity with macOS (where you can install iOS and iPadOS apps). There is sure to be some hiccups with touch inputs being the default. It's also much easier to install apps from websites, such as their example with Spotify. It opens up a smaller install window that should make it a breeze [^5].

Not to mention the new store-front is finally getting more apps from more developers as well, which should prompt more and more developers to publish there as well. PWAs get better integration into Windows, but I hope that doesn't become an excuse to developers to make non-native or piss-poor apps more than they already do with solutions like Electron.

## The Windows Graveyard
A good chunk of things were removed from both Windows and Microsoft syncing. Internet Explorer was gutted, Cortana was removed from the setup process, S Mode was kept to the home edition, and a good chunk of arguably useless apps are no longer pre-installed: Wallet, 3D Viewer, OneNote for Windows 10, Paint 3D, and Skype. Microsoft accounts no longer sync your wallpaper and there isn't a timeline to see things from the past across devices.

I appreciate seeing some of the bloat removed from Windows, making it a much better operating system for everyone (ideally it should just be what you need to get setup for your needs, not everything for every person by default). The task-bar, unfortunately, can no longer be moved from the bottom of the monitor, making it harder for those who have adjusted such for certain situations (I have mine usually at the top of the screen to make it easier to see the clock). Overall though, most everything here are welcome changes.

## Improvements for developers
Microsoft decided to poke a bit of fun at Apple as of late. As Apple deals with its app store, Microsoft described themselves as a platform of choice and flexibility. They mention that « developers will also have an option to bring their own or a third party commerce platform in their apps, and if they do so they don't need to pay Microsoft any fee ». This is nice, especially for indie developers who can make sure they get more of their hard earned revenue.

Support for new packaging types came too: notably React Native, Java, and PWAs. These are probably the most popular ways to make Android apps and should enable more to learn to develop for new platforms. Project Reunion, which is now the App SDK, also means that more apps can look native to Windows.

## The Good, The Bad, and The Ugly
Changes to the system requirements have made countless headlines. Support for 32-bit software has been gutted: a double-edged sword for those using legacy software and a plus side for those wanting to take full advantage of the architecture "by force." The Home edition of Windows will require a Microsoft account and Internet for the setup process, making it a pain for those with unreliable or nonexistent Internet. This is something the Pro editiion will not be affected by.

When it can't get worse, it gets ugly. Windows added a requirement for the TPM, or Trusted Platform Module, chip in Windows installations. TPM chips are used to securely store the keys used for things like drive encryption and the hashes and keys to ensure Windows hasn't been tampered. On Intel Macs, the best comparison is with the T1 and T2 chips, the Secure Enclave on iOS and Apple Silicon Macs, or the Titan M in Pixel phones. Many modern computers have them on their motherboards and, odds are, if you have a somewhat recent laptop, it would as well.

This need for a TPM has sparked scalpers interest causing some modules to go from 25$ to 100$. 

## Conclusion
Overall, I've never been a huge fan of Windows. It's slow, got lots of extra crap installed, and has had an inconsistent design for years. Windows 11 is more consistent, performant, and secure, and for most will be great. However, for people like me, who need every bit of performance for things like compilations, renders, and baking lights (oh god), Windows 10 might be where you want to stay until a LTSC update.

> **Edit:** A lot of proofreading and improvements to clarity.

[^1]: This ended up being the case. You can find it by right-clicking the taskbar, selecting Taskbar Settings, opening the dropdown for Taskbar behaviours, and choosing Left.
[^2]: It dawned on me in these revisions that the iPad Pro has a similar thing. Daniel nags me to keep everything open and not close it from multitasking, so I see a lot of "presets" of my slide-over and side-by-side apps in the multitasking.
[^3]: When I tested it on my Razer Blade 2019 a few months ago, this was something that I was annoyed to re-remember. It was a PITA to delete and was, for whatever reason, in the Pro variant, which I assumed did away with it like most of the bloat in Windows 10 LTSC.
[^4]: At the time of writing, I'm sure I had a video call or two for school or something of the sort. I don't have a need anymore: school is back on campus, and everyone I talk to barely even own microphones, never mind webcams.
[^5]: With the testing in [^3], using the mini installer was something I tried early on. It worked as well as App Installer usually does, and I eventually got what I needed installed. I'll stick to [Scoop](https://scoop.sh).

