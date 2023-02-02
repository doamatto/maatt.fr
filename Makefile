OS= mac # mac, win, or apk (Alpine Linux)

all: build-site build-scss
fetch-deps: get-sass-$(OS) get-zola-$(OS)

prepare-build:
	mkdir -p public/
build-scss:
	sass sass/style.scss:style.css sass/:public/ -c -s compressed
build-site:
	zola build

# Dependencies for `make fetch-deps`
get-sass-win:
	scoop bucket add main
	scoop install sass@v1.58.0
get-sass-mac:
	brew install sass/sass/sass
get-sass-apk:
	apk add dart-sass=1.55.0-r2 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
get-zola-win:
	scoop bucket add main
	scoop install zola@v0.16.1
get-zola-mac:
	brew install zola@0.16.1
get-zola-apk:
	apk add zola=0.16.1-r0

serve:
	zola serve --drafts -O -p 10000 &
	sass sass/style.scss:style.css sass/:public/ -wc
	# Speed isn't important— use the native toolkit.
