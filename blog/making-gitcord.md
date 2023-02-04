+++
title = "Making Gitcord"
description = "A bot that allows users to search repositories via GitHub's API"
date = "2021-01-23"
updated= "2022-08-31"
+++

I recently was sent an invite to a GitHub organisation and a Discord group known as «DevingOnDiscord». From my understanding, it's essentially a group of lads who use Discord to turn a profit with their software. Frankly, I've never really cared about making a profit from my service, but I decided to help out with some of the projects. One of those being Gitcord.

Gitcord is a Discord bot that allows people to search for repositories via GitHub's API. It's pretty simple. Written in TypeScript with Discord.js, it uses the `/search/repositories` endpoint to query for results. It works not too far from the following:

1. You call the command and provide a query (eg. `git!search user:doamatto`)
2. It takes your query and:
  - encodes it as a URI using [encodeURI()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/encodeURI); and:
  - inserts it into a request to GitHub's servers, providing the results needed to display the data and logging the query for later use
3. The data provided by GitHub is then:
  - parsed into an easy format (JSON, in this case),
  - sliced to the top 5 results; and:
  - scanned to mark forked repos.
4. All the data is coagulated into a [MessageEmbed()](https://discord.js.org/#/docs/main/stable/class/MessageEmbed), or embed message, using data from:
  - the data from step 3 in a list,
  - the query in step 1 to remind you what you searched for; and:
  - the parsed query in step 2 in the form of a search to see other results that were excluded.

Overall, there are some flaws with how the bot operates that may be addressed by current maintainers, such as missing types (with the infamous `TSFixMe` as a placeholder) and rate limiting from not using a token. However, for the average person who might see the need to self-host a bot to search GitHub, this gets the job done easily.

Shortly after development in January 2021, I transfered the source to the DOD team. Unfortuantely, the group has since disappeared from the Internet, along with the Gitcord source.

## Reflecting on a dead Discord bot
This is, as far as I'm aware, my second Discord bot *ever.* The one before wasn't terrible, but it just wasn't something I wanted to keep maintaining. Discord is one of those platforms that has always been iffy to me; can't quite put my finger on what exactly does it to me.

Maybe some not so fateful day I'll make a return to the Discord bot market. I've helped [Jack](https://jackmerrill.com) from time-to-time with BlueJay and [Astral](https://astralapp.io), but never enough to consider myself a bot developer or someone who actively works on bots. At the end of the day, I'm not sure. Ve vill see what the future has in store for me.
