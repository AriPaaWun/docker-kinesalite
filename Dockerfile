FROM node:8-alpine
LABEL maintainer="Tommi Haapaniemi"

ENV KINESALITE_VERSION=1.14.0

RUN \
  apk add --no-cache python make g++ && \
  yarn global add kinesalite@${KINESALITE_VERSION} && \
  apk del python make g++ && \
  rm -rf /tmp/*

EXPOSE 4567

CMD ["/usr/local/bin/kinesalite","--createStreamMs","0","--deleteStreamMs","0","--updateStreamMs","0"]
