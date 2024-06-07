IMG_TAG ?= latest
IMG ?= ghcr.io/humanitec-architecture/aws-ecr-credentials-refresh:$(IMG_TAG)
PLATFORM ?= linux/amd64,linux/arm64

# Build the aws-ecr-credentials-refresh image
build:
	docker buildx build --platform $(PLATFORM) -t $(IMG) .
	# Ideally we could remove the next step, but docker on GHA doesn't support
	# loading multi-platform builds yet
	docker buildx build -t $(IMG) --load .

# Test the aws-ecr-credentials-refresh image
test:
	docker run --rm --entrypoint /bin/bash $(IMG) -c "aws --version"
	docker run --rm --entrypoint /bin/bash $(IMG) -c "kubectl version --client"

# Push the aws-ecr-credentials-refresh image
push:
	docker buildx build --platform $(PLATFORM) -t $(IMG) --push .
