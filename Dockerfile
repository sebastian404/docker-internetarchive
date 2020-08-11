FROM alpine:3.11

MAINTAINER  Sebastian Robinson sebastian@podtwo.com

RUN \
 echo "**** install packages ****" && \
 apk upgrade; apk add --no-cache curl git python3 bash aria2 lynx busybox busybox-extras && \
 pip3 install --upgrade pip; pip3 install internetarchive

RUN \
 echo "**** install webui-aria2 ****" && \
 cd / && \
 git clone https://github.com/ziahamza/webui-aria2

# ports and volumes
EXPOSE 6800 9000
VOLUME /data

# Entrypoint
ENTRYPOINT ["/bin/busybox-extras","httpd","-f","-p","9000","-h","/webui-aria2/docs/"]
