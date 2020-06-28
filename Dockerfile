FROM alpine:3.11

MAINTAINER  Sebastian Robinson sebastian@podtwo.com

RUN apk upgrade; apk add --no-cache curl python3 bash aria2 lynx
RUN pip3 install --upgrade pip; pip3 install internetarchive

# ports and volumes
VOLUME /files

CMD tail -f /dev/null
