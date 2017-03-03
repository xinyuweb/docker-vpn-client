FROM alpine:latest
MAINTAINER James Z.M. Gao <gaozm55@gmail.com>

# install vpn clients
# fix ip command location for the pptp client
RUN apk --update upgrade
RUN apk add pptpclient openconnect
RUN ln -s "$(which ip)" /usr/sbin/ip
RUN rm -rf /var/cache/apk/* /tmp/*

COPY content /

ENTRYPOINT ["/entrypoint.sh"]
