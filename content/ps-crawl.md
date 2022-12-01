+++
title="PrivacySpy Crawler"
+++

Hey! I'm Matt, a software engineer. With the very brief introduction out of the way, you may be wondering why your site has been getting requests from `maatt DOT fr/ps-crawl`. This is the unofficial (with plans to be official in the future) web crawler for [PrivacySpy](https://privacyspy.org) that makes automated GitHub issues for when a privacy policy may need to have its score updated. You can see the bot's source code [on GitHub.](https://github.com/doamatto/ps-crawl)

## Opt-out of site crawling
You can use a `robots.txt` file to block the bot's user-agent. It's highly encouraged to not however, as it means privacy policies will have to be manually checked for updates to adjust your score.

## My site doesn't have a privacy policy
You can [create a pull request removing your website from the `products/` folder.](https://github.com/politiwatch/privacyspy) Once that change is made, the bot should stop crawling your website permanently. It's encouraged to do this other optting-out, if applicable, as it helps the bot get through the slew of policies that much faster.
