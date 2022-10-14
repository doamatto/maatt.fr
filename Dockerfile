FROM ghcr.io/getzola/zola:v0.15.3 as buildstage

RUN mkdir /build /build-farer
COPY . /build
COPY . /build-farer
WORKDIR /build
RUN zola build
WORKDIR /build-farer
RUN zola build --base-url "https://matt.fa"
##############################################
FROM caddy:2.6.2-alpine

RUN ["apk add brotli"]
RUN mkdir /srv/public /srv/farer
COPY --from=buildstage /build/out /srv/public
COPY --from=buildstage /build-farer/out /srv/farer
COPY /srv/Caddyfile /srv/Caddyfile
RUN ["find /srv/public -type f -regex '.*\.\(htm\|html\|txt\|text\|js\|css\)$' -exec brotli -f -k {} \;"]
RUN ["find /srv/farer -type f -regex '.*\.\(htm\|html\|txt\|text\|js\|css\)$' -exec brotli -f -k {} \;"]

RUN ["caddy run --config /srv/Caddyfile --adapter Caddyfile"]
