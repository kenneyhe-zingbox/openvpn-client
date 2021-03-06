FROM alpine
MAINTAINER Kenney He <kenney.he@zingbox.com>

# Install openvpn
RUN apk --no-cache --no-progress upgrade && \
    apk --no-cache --no-progress add bash curl ip6tables iptables openvpn \
                shadow && \
    addgroup -S vpn && \
    rm -rf /tmp/*

COPY openvpn.sh /usr/bin/

# disable port 22 health check
#HEALTHCHECK --interval=60s --timeout=15s --start-period=120s \
#             CMD curl -L 'https://api.ipify.org'

VOLUME ["/vpn"]

ENTRYPOINT ["openvpn.sh"]
