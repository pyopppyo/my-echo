NAME := my-echo
REPOSITORY := pyok/$(NAME)
TAG := 20240710
GOOS := linux
GOARCH := arm64

.PHONY: build test image-build image-push clean
build:
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o _output/$(NAME) .

test:

image-build:
	docker build -t $(REPOSITORY):$(TAG) .

image-push:
	docker push $(REPOSITORY):$(TAG)

clean:
	rm -rf _output
