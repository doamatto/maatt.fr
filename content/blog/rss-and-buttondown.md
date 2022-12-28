+++
title= "Making RSS and Buttondown best friends forever"
description= "Using software written in a couple of hours, you too can wed RSS and Buttondown for an eternal marriage. Or until one gives out."
date= "2022-04-02T07:03:12-08:00"
updated= "2022-07-31"
+++

As most people know, this site has an [Atom/RSS feed.](/atom.xml) As most people probably don't know, this site *used* to have a mailing list alongside it. I knew that asking people to use feed readers as their sole method of trying to find out what's new on this site would be like a person without limbs trying to do yoga: hard, to say the least.

At the time, I used [Buttondown](https://buttondown.email/) to send emails and a service called [Zapier](https://zapier.com/) to automatically create drafts to send out based on new posts. This solution worked, but was finicky to use and, I ultimately ended up retiring the mailing list and closing my Zapier account. What possessed me to re-explore the mailing list is beyond me, but I did.

## The "Easy" Part: Writing some code
In less than 100 lines, we're able to get variables, the ability to send things in the first place, and have extra features like drafting OR sending emails. This was the "easy" part purely because it was quick to reach a first draft.

Deciding to invest some effort into this, I setup two things:
- **Renovate— a dead-simple automatic dependency updater.** I only really need this to keep the feed parsing tool up-to-date; and:
- **`golangci-lint`— a code linter for Golang.** This is so we can have a general idea of where we could be going wrong before spending time on compiling. Some of the things it warns about may popup with a build, but linters usually go above and beyond.

## The "Hard" Part: Justifying a mailing list again
You would think creating this would justify using a mailing list again, but somehow it doesn't for me. For one, it's another thing I have to maintain for: a slew of DNS records, data privacy for storing emails, et al. If it was a core means of traffic, I'd probably give it more consideration. But, comparing the low subscriber count to the high traffic reported by Cloudflare for the RSS endpoints.

For another, it was about 00:30 when I thought it was a good idea to make this, namely to extend Amazon SES.

## Conclusion (in general)
I'll maintain the tool for awhile, and you can use it if you want from [GitHub](https://github.com/nutshellmag/courier).

Maybe I'll revist a mailing list. Probably not.

I'm open to suggestions as to improving the tool and to alternatives to a mailing list that people might like; [don't hesitate to reach out over email or other means.](/contact/)
