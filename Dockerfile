FROM golang:stretch

MAINTAINER heycar Engineering <team-engineering@hey.car>

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn nodejs build-essential

ARG FLAGR_VERSION=1.0.9
RUN curl https://github.com/checkr/flagr/archive/${FLAGR_VERSION}.tar.gz -Lo flagr.tar.gz
RUN tar -xzf flagr.tar.gz
RUN mkdir -p /go/src/github.com/checkr
RUN mv flagr-${FLAGR_VERSION} /go/src/github.com/checkr/flagr

WORKDIR /go/src/github.com/checkr/flagr
RUN cd ./browser/flagr-ui/ && yarn install && yarn run build
RUN make build

ENV FLAGR_RECORDER_ENABLED=false
ENV HOST=0.0.0.0
ENV PORT=7000

EXPOSE 7000

CMD ./flagr
