BINARY := ntsc-hmq
BINARY_VERSION := v1.0.0
BUILD_DIR := ./build

.PHONY: clean-build clean-all

all: clean-all compile-all

init:
	go mod tidy
	mkdir -p $(BUILD_DIR)

compile-linux: init
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -ldflags '-s -w' \
		-o $(BUILD_DIR)/$(BINARY)-$(BINARY_VERSION)-linux-amd64 
	# GOOS=linux GOARCH=386 CGO_ENABLED=0 go build -ldflags '-s -w' \
		# -o $(BUILD_DIR)/$(BINARY)-$(BINARY_VERSION)-linux-386 
	# GOOS=linux GOARCH=arm64 CGO_ENABLED=0 go build -ldflags '-s -w' \
		# -o $(BUILD_DIR)/$(BINARY)-$(BINARY_VERSION)-linux-aarch64
	# GOOS=linux GOARCH=arm CGO_ENABLED=0 go build -ldflags '-s -w' \
		# -o $(BUILD_DIR)/$(BINARY)-$(BINARY_VERSION)-linux-arm

compile-windows: init
	# GOOS=windows GOARCH=amd64 CGO_ENABLED=0 go build -ldflags '-s -w' \
	# 	-o $(BUILD_DIR)/$(BINARY)-$(BINARY_VERSION)-windows-amd64.exe 
	# GOOS=windows GOARCH=386 CGO_ENABLED=0 go build -ldflags '-s -w' \
	# 	-o $(BUILD_DIR)/$(BINARY)-$(BINARY_VERSION)-windows-x86.exe 

compile-all: compile-linux compile-windows

clean-build:
	rm -rf $(BUILD_DIR)

clean-all: clean-build
