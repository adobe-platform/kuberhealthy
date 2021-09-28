.PHONY: build.docker
build.docker:
	docker build -t docker-hub-remote.dr.corp.adobe.com:kuberhealthy/deployment-check:v1.9.0-dc -f cmd/deployment-check/dc.Dockerfile .
	docker build -t docker-hub-remote.dr.corp.adobe.com:kuberhealthy/dns-resolution-check:v1.5.0-dc -f cmd/dns-resolution-check/dc.Dockerfile .
  docker build -t docker-hub-remote.dr.corp.adobe.com:kuberhealthy/daemonset-check:v3.3.0-dc -f cmd/daemonset-check/dc.Dockerfile .
