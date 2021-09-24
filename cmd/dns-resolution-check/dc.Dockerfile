ARG GO_VERSION=1.17
FROM docker-hub-remote.dr.corp.adobe.com/golang:${GO_VERSION}-alpine AS builder
RUN groupadd -g 999 user && \
    useradd -r -u 999 -g user user
COPY --chown=user:user . /build
WORKDIR /build/cmd/dns-resolution-check
ENV CGO_ENABLED=0
RUN go build -v
FROM docker-hub-remote.dr.corp.adobe.com/scratch
COPY --from=builder /etc/passwd /etc/passwd
USER user
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /build/cmd/dns-resolution-check/dns-resolution-check /app/dns-resolution-check
ENTRYPOINT ["/app/dns-resolution-check"]
