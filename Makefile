# SOURCEDIR=.
# SOURCES = $(shell find $(SOURCEDIR) -name '*.go')
# VERSION=$(git describe --always --tags)
# BINARY=bin/pd

# bin: $(BINARY)

# $(BINARY): $(SOURCES)
# 	go build -o $(BINARY) command/*

.PHONY: build
build: build-deps
	go build -mod=vendor -o $(GOROOT)/bin/pd ./command

.PHONY: build-deps
build-deps:
	go get
	go mod verify
	go mod vendor

.PHONY: test
test:
	go test ./...

.PHONY: deploy
deploy:
	- curl -sL https://git.io/goreleaser | bash
