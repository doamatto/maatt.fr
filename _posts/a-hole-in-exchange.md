---
title: "A hole in Exchange: a bug yet to be fixed by IT"
date: "2021-05-06"
updated: "2021-05-20"
description: "tl;dr: We really need to update our mail servers."
---

As a student, it's not uncommon to write to my teachers. The topic always being different; be it turning in late work, asking questions about the course, or, which is always a fun one, the teacher emailing *me* for some off the books tech advice. Whatever the case may be, there's two (technically one) inboxes that I get these queries to: my school provided Google Workspace account, or my personal Google Workspace account. This is actually a pretty important detail, that I'll explain a bit later.

I had this back and forth with a teacher about some technical issues he had configuring his Zoom meeting properly on my personal Google account. Why I was the best person to communicate with and not I21 (our district and school's IT department) will always be beyond me, but I got bored one day and decide to peruse the menus in Gmail. 

There's a useful feature in most email apps that allows you to see the original email. As great as it would be to have emails just be text, there is a bit of padding at the beginning, known as headers. These headers server tonnes of purposes, such as telling the email where to go, where to send replies to, if people were CC'd, and so much more. These headers are standarised in [RFC 6854](https://datatracker.ietf.org/doc/html/rfc6854), but there are also headers that are custom-made by other apps and services to do special things. An example is the header `X-Google-Smtp-Source`, which is used to show an email going out from Gmail's servers. My district utilises a mail server that adds the header `X-Originating-IP`.

A bit of boring time history: in 1999, Outlook, then known as Hotmail, used this same header. It's value would be the IP address of whoever the sender was. This meant that you can identify people in a relatively rudementary way, and how I think it was used and implemented for. In 2012, it was replaced with `X-EIP`, which stands for Encrypted IP, to better protect users' privacy. This wasn't an exemption to just Hotmail, but also Microsoft's mail server software known as Exchange. Based on that information, it means my district uses a version of Microsoft Exchange Server from 2010 to 2016, with this flaw remaining prevalant. Boring history time is now over.

Now, for those who may not know what IP addresses are or what they can be used for, the best way to describe them is a very rudementary and everly growing poor way to identify people. It's still used today for thinks like georestrictions of content on things like Netflix, as well as very vague tracking online. Now, as much as I would love to think people wouldn't do anything malicious with those IP addresses, there are some things they could do such as, but not limited to:
- DoS/DDoS attacks&mdash; can prevent that person's internet from being able to talk with websites by « flooding » their internet with tonnes of requests; and:
- can track network usage based off logs (done commonly by most servers to prevent fraud, done by most ad companies as a rudementary way to track).

There are two fixes, in theory. Either issue a VPN for all staff members and teachers, or update the Exchange Server to a version that uses « X-EIP » instead of « X-Originating-IP ». Considering how the former is highly unlikely, I would love to see a push for the former.

I mentioned earlier that an important detail was that I got emails to both of my Google accounts: one that I pay for, and one that the district pays for. As far as I know, there's no way to block the « Show original » functionality inside of Gmail. To me, that is a good thing, as it can be an essential way to double-check that emails you receive are legitmately from that party, if you happen to be into the nerdy bits of email communication and what not. However, there is one more solution that would be the most logical and reasonable: a full transition from the Exchange to Google's mail servers. Currently, teachers actually can mitigate the risks by managing emails through their district Google account, as it uses Gmail's servers to send the email to the district's SMTP servers (the servers responsible for sending out emails). In theory, this resolution could result in large costs being reduced from the licensing of Exchange, as well as a more unified experience for teachers to go between all of the work.

The morale of the story: please don't SWAT or DDoS your teachers. Don't abuse this knowledge. And, most importantly, make sure to tell people about the bugs you find. Who knows? Maybe you'll get a couple thousand dollars if it's a big one.
