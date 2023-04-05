BASE_PATH = .

NPROCS ?= $(shell nproc)

.PHONY: builder
builder:
ifdef BUILD_BUILDER_IMAGE
	docker build \
		--build-arg NPROCS=$(NPROCS) \
		-t collector-builder:latest \
		-f "$(CURDIR)/Dockerfile.coll" \
		.
else
	docker pull quay.io/stackrox-io/collector-builder:$(COLLECTOR_BUILDER_TAG)
endif

collector: builder

image: collector 
	docker build \
		-f "$(CURDIR)/Dockerfile" \
		-t collector:latest .
