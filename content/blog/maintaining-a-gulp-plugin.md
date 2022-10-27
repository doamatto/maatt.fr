+++
title = "Maintaining a Gulp Plugin: ESLint"
description = "Why struggle with someone else's package when you can struggle with your own!"
date = "2021-11-18"
updated = "2022-08-31"
+++

As much as I hate to admit it, I was a rather large fan of and user of JavaScript. To help make sure my spaghetti code isn't complete.. well.. spaghetti, I use a tool called [ESLint](https://eslint.org) to ensure silly mistakes like unclosed brackets and malformed indentations don't happen. I also use [Gulp](https://gulpjs.com) to run ESLint and a few other tools for me. In other words, it makes life easy. The most popular ESLint plugin for Gulp (at the time of writing) was from Adametry, but was both abandoned and outdated. So, I've decided, in true open-source fashion, to fork the repository and give it the love it needs.

Some rather big changes that happened to the plugin:
- Added failOnWarning and failAfterWarning
- Tons of updates to ESLint, Mocha (the current testing suite, as of writing), Acorn, and Vinyl
- and heaps more ([this was a big PR for some of the changes done up on the fork](https://github.com/doamatto/gulp-eslint/pull/10))

In February of 2021, I wanted to start to reshape the tool on a fundamental basis by rewriting the plugin in TypeScript and refactoring code to be easily understandable by others. Since then, [I've been in talks with numerous other developers](https://github.com/adametry/gulp-eslint/issues/266) and decided to ultimately detach myself from the old fork to create not only a better interface with Gulp for ESLint but to possibly make a better tool than ESLint and Gulp as a whole. These hopes and dreams are far into the future, [but (were) planned nevertheless.](/ideas/)

## Reflecting over `gulp-eslint`'s corpse
Over time, I grew a victim to the same issue as the original package: it became something I didn't need anymore with my move to other languages and better solutions. Since I didn't need it anymore, I didn't maintain it anymore. To this day, it continues to rot with its dreams of being written entirely in TypeScript.

With hindsight being 20/20 however, I had a terrible idea that other people should work on (or I will some day): native toolings for working with JavaScript. ESLint is written to work using Node; why not a linter written natively to process hundreds of thousands of lines in a blink of an eye, run tests and get responses in a matter of seconds rather than minutes at times, et al., et al. That's a journey for another day.

---

### Useful links
- [NPM Package](https://www.npmjs.com/package/@doamatto/gulp-eslint)
- [GitHub repository](https://github.com/doamatto/gulp-eslint)
