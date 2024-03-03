IMAGE_NAME ?= thelande/apcupsd
IMAGE_TAG  ?= latest

.PHONY: nerdctl-build
nerdctl-build:
  nerdctl -n k8s.io build -t $(IMAGE_NAME):$(IMAGE_TAG) .

.PHONY: podman-build
podman-build:
  podman build -t $(IMAGE_NAME):$(IMAGE_TAG) .