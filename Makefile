OS= mac # mac, win, or apk (Alpine Linux)

SASS_VERSION=1.55.0
CHRUBY_VERSION=0.3.9
RUBY_VERSION=3.1.3
RUBYINSTALL_VERSION=0.9.0
BUNDLER_VERSION=2.4.6
JEKYLL_VERSION=4.3.2

.PHONY: build-new
build: build-site build-scss
fetch-deps: get-sass-$(OS) get-chruby-$(OS) get-ruby cleanup get-jekyll
cleanup: cleanup-repo

prepare-build:
	mkdir -p public/
build-scss:
	sass _sass/style.scss:style.css _sass/:public/ -c -s compressed
build-site-lite:
	JEKYLL_ENV="litemode" bundle exec jekyll build --config _config.yml,_liteconfig.yml
build-site:
	bundle exec jekyll build

# Dependencies for `make fetch-deps`
get-sass-win:
	scoop bucket add main
	scoop install sass@v1.58.0
get-sass-mac:
	brew install sass/sass/sass
get-sass-apk:
	apk add dart-sass=1.55.0-r2 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/
get-chruby-mac:
	brew install chruby ruby-install xz
	echo "source $(brew --prefix)/opt/chruby/share/chruby/auto.sh" > "$(HOME)/.zshrc"
get-chruby-apk: 
	curl -o chruby.tgz "https://github.com/postmodern/chruby/archive/v$(CHRUBY_VERSION).tar.gz"
	curl -o rubyinstall.tgz "https://github.com/postmodern/ruby-install/archive/v$(RUBYINSTALL_VERSION).tar.gz"
	tar -xzvf chruby.tgz
	tar -xzvf rubyinstall.tgz
	cd chruby/
	sudo make install
	cd ../rubyinstall/
	sudo make install
	echo "source " > "$(HOME)/.zprofile" # TODO: Source chruby in sh
get-chruby-win:
	scoop bucket add main
	scoop install ruby@v$(RUBY_VERSION)-1
get-ruby:
	if [ $(OS) != "win" ]; then 
		ruby-install ruby $(RUBY_VERSION)
	fi
get-jekyll:
	gem install bundler
	bundle install
cleanup:
	# Remove chruby installer
	rm chruby.tgz
	rm -r chruby/
	# Remove rubyinstall installer
	rm rubyinstall.tgz
	rm -r rubyinstall/

serve:
	bundle exec jekyll serve -owtD &
	sass _sass/style.scss:style.css _sass/:public/ -wc
	# Speed isn't important— use the native toolkit.
cleanup-repo:
	rm -r _site/
