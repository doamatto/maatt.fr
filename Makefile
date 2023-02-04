OS= mac # mac, win, or apk (Alpine Linux)

.PHONY: build-new
all: build-site build-scss
build-new: build-site-new build-scss
fetch-deps: get-sass-$(OS) get-zola-$(OS)
fetch-deps-new: get-sass-$(OS) get-haskell-$(OS) get-hakyll

prepare-build:
	mkdir -p public/
build-scss:
	sass sass/style.scss:style.css sass/:public/ -c -s compressed
build-site:
	zola build
build-site-new:
	stack exec site build

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
	brew install zola
get-zola-apk:
	apk add zola=0.16.1-r0
get-haskell-mac get-haskell-apk:
	curl -sSL https://get.haskellstack.org/ | sh -s - -f
get-haskell-win:
	scoop bucket add main
	scoop install stack
get-hakyll:
	stack install ghc hakyll

serve:
	zola serve --drafts -O -p 10000 &
	sass sass/style.scss:style.css sass/:public/ -wc
	# Speed isn't important— use the native toolkit.
serve-new:
	stack exec site watch &
	sass sass/style.scss:style.css sass/:public/ -wc
