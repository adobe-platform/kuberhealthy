.PHONY: build.docker

BINARY        ?= kuberhealthy
VERSION       ?= $(shell git describe --tags --always --dirty)
IMAGE         ?= docker-adobesign-govcloud-forks-release.dr.corp.adobe.com/kuberhealthy/$(BINARY)
TAG           ?= ${VERSION}
DOCKERFILE    ?= dc.Dockerfile

default: build.docker

build.docker:
	docker build --rm -t ${IMAGE}:${TAG} -f $(DOCKERFILE) --build-arg VERSION=$(VERSION) ../../
