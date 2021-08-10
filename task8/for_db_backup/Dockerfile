FROM golang:1.16.2-alpine as builder
RUN apk add git

ENV CGO_ENABLED=0
ENV GOOS=linux

ARG GCSFUSE_VERSION="master"
ARG GCSFUSE_REPO="${GOPATH}/src/github.com/googlecloudplatform/gcsfuse/"
ADD . ${GCSFUSE_REPO}

WORKDIR ${GCSFUSE_REPO}
RUN git checkout ${GCSFUSE_VERSION}
RUN go install ./tools/build_gcsfuse
RUN build_gcsfuse . /tmp ${GCSFUSE_VERSION}

FROM docker
RUN apk add --update --no-cache bash ca-certificates fuse postgresql-client tzdata

ENV TZ Europe/Minsk

COPY --from=builder /tmp/bin/gcsfuse /usr/local/bin/gcsfuse
COPY --from=builder /tmp/sbin/mount.gcsfuse /usr/sbin/mount.gcsfuse

WORKDIR /root
COPY ./postgres-backup.sh /root/
RUN chmod +x /root/postgres-backup.sh

CMD ["./postgres-backup.sh"]
