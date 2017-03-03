FROM alpine:latest
MAINTAINER James Z.M. Gao <gaozm55@gmail.com>

# install vpn clients
# fix ip command location for the pptp client
RUN set -ex
RUN echo '@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories
RUN apk --update upgrade
RUN apk add ca-certificates pptpclient@testing openconnect@testing
RUN ln -s "$(which ip)" /usr/sbin/ip
RUN rm -rf /var/cache/apk/* /tmp/*

COPY content /

ENTRYPOINT ["/entrypoint.sh"]
