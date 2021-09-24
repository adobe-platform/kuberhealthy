.PHONY: build.docker

BINARY        ?= kuberhealthy
VERSION       ?= $(shell git describe --tags --always --dirty)
IMAGE         ?= docker-adobesign-govcloud-forks-release.dr.corp.adobe.com/kuberhealthy/$(BINARY)
TAG           ?= ${VERSION}-dc

build.docker:
	docker build -t ${IMAGE}:${TAG} -f dc.Dockerfile ../../
