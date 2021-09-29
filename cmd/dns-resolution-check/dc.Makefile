.PHONY: build.docker

BINARY        ?= dns-resolution-check
VERSION       ?= $(shell git describe --tags --always)
IMAGE         ?= docker-dc-micro-release.dr.corp.adobe.com/kuberhealthy/$(BINARY)
TAG           ?= ${VERSION}
DOCKERFILE    ?= dc.Dockerfile
GIT_ROOT      ?= $(shell git rev-parse --show-toplevel)

default: build.docker

build.docker:
	  docker build -t ${IMAGE}:${TAG} -f $(DOCKERFILE) --build-arg VERSION=$(VERSION) $(GIT_ROOT)