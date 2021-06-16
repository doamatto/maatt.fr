+++
title = "Always Amazon Smiling"
slug = "always-amazon-smiling"
description = "A simple tool to redirect you from Amazon's sites to their Amazon Smile counterparts."
tag = "released"
date = "2020-08-12"
+++

<section id="timeline">
  {{item(
    status="released",
    date="3 May, 2020",
    info="Always Amazon Smiling has officially launched and is now
      available on the Chrome Web Store and Firefox Add-on Store.
      This open-source extension takes all the appropriate requests
      and supported Amazon sites and redirects them to their Amazon
      Smile counterparts to help raise money for charities. <a
      href="https://github.com/doamatto/always-amazon-smiling"> You
      can learn more here.</a>"
  )}}
</section>

### Useful links
- [GitHub repository](https://github.com/doamatto/always-amazon-smiling)
- Store pages:
  - [Chrome Web Store](https://chrome.google.com/webstore/detail/always-amazon-smiling/ioeinegegnpkndnbkmmhhhaljlfpemgf)
  - [Firefox Add-ons Shop](https://addons.mozilla.org/firefox/addon/always-amazon-smiling/)
  - [Opera Addons Shop](https://addons.opera.com/extensions/details/always-amazon-smiling/)

---

AAS was meant as a "demo" to see how I liked making some browser extensions. Turns out: it's pretty fun and it helps to know what you're doing. Recently, I returned to AAS to give it an update due to a lot of bug reports in my inbox and personal issues I've had with the extension.

In v1.0.0, the biggest change is how links are processed. I've explained what the code does but not exactly why. I might be able to make this more efficient in the future, but, for now, this is a solid start. It starts with fetching the URL you're going to. We're going to have https://amazon.co.uk/studioghibli be your query to your browser, as an example. This is then stripped of its protocol. The protocol is essentially the http:// or https:// bit at the start of URLs. In one line, we remove either of the two. Our query now is amazon.co.uk/studioghibli. A check for www. is then done and removes that chunk if the check succeeds. Otherwise, it continues.[^1]

Following this, we temporarily save the domain base and remove it from the chunk. So, in this case, our base is amazon.co.uk. After this, we're left with /studioghibli. We then piece everything back together to form the redirection. The format is as follows: https://smile. followed by our base (amazon.co.uk) and final chunk (/studioghibli). The final redirect is https://smile.amazon.co.uk/studioghibli[^2].

The new system is way more efficient, documented, and, overall, smarter than the old method that broke frequently. With this new update, I've also employed measures such as ESlint and JavaScript minification to lower the package size and help milk every bit of performance I can get. This ensures pages load just as fast, even with this slight overhead.

[^1]: This is because some URLs don't need to start with www. This site, for instance, is doamatto.xyz, however, you can still come from www.doamatto.xyz because of a redirection. [^2]: In this case, however, it's technically redirected to https://www.amazon.co.uk/stores/page/6DD4F81B-3B1D-4037-8749-B95932B7C959, because it's a "whitelabelled" URL. It's just bounced a few times on Amazon's part to get there.
