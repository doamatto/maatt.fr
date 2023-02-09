OS= mac # mac, win, or apk (Alpine Linux)
SASS_VERSION=1.58.0
VELO_VERSION=0.1.0

.PHONY: build
build: build-site build-scss
fetch-deps: get-sass-$(OS) cleanup get-velo

prepare-build:
	mkdir -p public/
build-scss:
	sass _sass/style.scss:style.css _sass/:public/ -c -s compressed
build-site-lite:
	VELO_ENV="litemode" velo build --config config.lite.json
build-site:
	velo build --config config.json

# Dependencies for `make fetch-deps`
get-sass-win:
	scoop bucket add main
	scoop install sass@v$(SASS_VERSION)
get-sass-mac:
	brew install sass/sass/sass
get-sass-apk:
	apk add dart-sass=$(SASS_VERSION)-r0 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
get-velo:
	curl -O velo-$(OS) https://github.com/doamatto/velo/releases/download/v$(VELO_VERSION)/velo-$(OS)
	if [$(OS) == "mac"; $(OS) == "apk"]; then
		mv velo-$(OS) /usr/bin/velo
		chmod +x /usr/bin/velo
	else
		# TODO: Install to PATH on Windows
	fi
cleanup:
	rm -r _site/

serve:
	velo serve --drafts &
	sass _sass/style.scss:style.css _sass/:public/ -wc
	# Speed isn't important— use the native toolkit.
