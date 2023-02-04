# Personal Site [![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=doamatto_personal-site&metric=alert_status)](https://sonarcloud.io/dashboard?id=doamatto_personal-site)

This hosts both:
  - [https://maatt.fr](https://maatt.fr); and:
  - [http://lite.maatt.fr](http://lite.maatt.fr)— the smaller and very backward compatible version of the site.

This utilises:
- **Hakyll** for page compilation,
- **Dart SASS** for stylesheet compilation (to be replaced in near future),
- **1984** for hosting; and:
- **SonarCloud** for code quality.

## Building 
Set the `OS` variable to one of the following:
  - `mac` if on `mac`OS
  - `win` if on `win`dows
  - `apk` if on Alpine Linux.

Run `make fetch-deps`, followed by `make` to build the site. 

The steps to follow are for manual builds.
1. Install [Stack](https://haskellstack.org) and [Dart Sass]()
2. Install Hakyll using Stack (`stack install hakyll`)
3. Build the site (`make`)
  a. Alternatively, run the following commands:
    - `sass sass/style.scss:style.css sass/s.scss:sass/A.css sass/:public/ -c -s compressed`
    - `stack exec site build`

### Acknowledgments
This codebase is licensed under the BSD 3-Clause license. Content of the website, unless mentioned otherwise, are licensed under [the CC BY-SA 4.0 license.](https://creativecommons.org/licenses/by-sa/4.0/deed.fr)
