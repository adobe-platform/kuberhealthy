.PHONY: build.docker

BINARY        ?= kuberhealthy
VERSION       ?= $(shell git describe --tags --always --dirty)
IMAGE         ?= docker-hub-remote.dr.corp.adobe.com/kuberhealthy/$(BINARY)
TAG           ?= ${VERSION}-dc

build.docker:
	docker build --no-cache --pull -t ${IMAGE}:${TAG} -f dc.Dockerfile ../../
