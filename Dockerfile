FROM certbot/dns-luadns:latest

RUN printf '#!/bin/sh\necho "dns_luadns_email = $LUADNS_EMAIL\ndns_luadns_token = $LUADNS_TOKEN" > /luadns.ini\ncertbot "$@" --dns-luadns-credentials /luadns.ini' > /init.sh

RUN chmod +x /init.sh

ENTRYPOINT ["/init.sh"]

