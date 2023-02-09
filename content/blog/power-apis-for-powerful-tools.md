---
title: "Gathering power data to enable others"
description: "Making wrappers for public energy data to help others make cool things."
date: "2022-09-06T04:25:00Z"
updated: "2022-12-27"
---

Even if you've been sleeping under a rock, the globe has been getting a little toasty, as of late. With the politics and reasoning of why that may be put aside, many have felt record-breaking temperatures and felt generally piss-poor (or at least those of us who can't afford A/C). In California, we've been getting what are known as [Flex Alerts](https://flexalert.org) through most of our heatwave so far. In lamest terms, a flex alert tells you to use as little energy as possible to prevent power outages and other grid issues. Ironically, as I write this, we are using 43 153 MW of our estimated capacity of 48 433 MW; a.k.a too much for comfort.

## API wrappers— fun to write (hahaha)
The answer to all of this is, in fact, not API wrappers. This is instead a band-aid solution to, as eluded to before, a bigger problem with more politics that I still don't want to get into for what I think you can assume are reasonable reasons. Regardless, these API wrappers allow people to be more informed, as well as build more tools to be more informed.

This week, I've launched ~~two~~ one Go API wrappers: [`go-calipower`](https://github.com/doamatto/go-calipower) ~~and `go-sdgeoutages`~~. CaliPower grabs data from the same source as the official Flex Alerts website, [the California ISO](https://caiso.com). There are no lamest terms for CAISO, as I haven't even dug into the surface of what they do in California. To the best and most logical assumption, however, they likely have a little something to do with power and a little something with making sure CalFire doesn't have to get involved.

> **Edit:** A lot of proofreading and improvements to clarity.
>
> **Edit:** `go-sdgeoutages` was cancelled and was *eventually* planned to merge with `go-calipower`. Since it's the winter season, I don't have as much of a need to work on this, but once the warmer weather swings around (by SoCal standards), I'll add it to the wrapper.
