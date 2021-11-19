ARG GO_VERSION=1.17
FROM docker-hub-remote.dr.corp.adobe.com/golang:${GO_VERSION}-alpine as builder
LABEL LOCATION="git@github.com:adobe-platform/kuberhealthy.git"
LABEL DESCRIPTION="Kuberhealthy - Check and expose kubernetes cluster health in detail."
COPY . /build
WORKDIR /build/cmd/kuberhealthy
ENV CGO_ENABLED=0
RUN go version
RUN go test -v
RUN mkdir /app
RUN addgroup -S -g 1000 user && \
    adduser -S -u 1000 -g user user
RUN go build -v -o /app/kuberhealthy

FROM scratch
WORKDIR /app
COPY --from=builder /app /app
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /etc/passwd /etc/passwd
ENTRYPOINT ["/app/kuberhealthy"]