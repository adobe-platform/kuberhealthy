.PHONY: build.docker

BINARY        ?= kuberhealthy
VERSION       ?= v2.7.0
IMAGE         ?= docker-hub-remote.dr.corp.adobe.com/kuberhealthy/$(BINARY)
TAG           ?= ${VERSION}-dc

build.docker:
	docker build -t ${IMAGE}:${TAG} -f dc.Dockerfile ../../
