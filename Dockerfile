FROM alpine:3.20

RUN apk add --no-cache aws-cli kubectl bash

RUN addgroup -S refresh && adduser -S refresh -G refresh -D

USER refresh

ADD ./refresh.sh /refresh.sh

CMD ["/refresh.sh"]
