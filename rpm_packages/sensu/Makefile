SENSU_GO_TAR_NAME = $(SENSU_GO_REVISION).tar.gz
SENSU_GO_SOURCE_URL = https://github.com/sensu/sensu-go/archive/$(SENSU_GO_TAR_NAME)

.PHONY: download
download:
	@if [ ! -f build/$(SENSU_GO_TAR_NAME) ]; then \
		echo "Downloading Sensu Go source code tars for the revision $(SENSU_GO_REVISION)"; \
		dnf install -y wget || true; \
		wget --progress "dot:giga" --directory-prefix "build" $(SENSU_GO_SOURCE_URL); \
	fi

.PHONY: prepare
prepare: download
	@if [ ! -d build/sensu_go_extracted ]; then \
		echo "Extracting the source tar '$(SENSU_GO_TAR_NAME)' for Sensu Go."; \
		mkdir -p build/sensu_go_extracted; \
		tar -xzf build/$(SENSU_GO_TAR_NAME) -C build/sensu_go_extracted --strip-components 1; \
	else \
		echo "Re-extracting the source tar '$(SENSU_GO_TAR_NAME)' for Sensu Go."; \
		rm -rf build/sensu_go_extracted; \
		mkdir -p build/sensu_go_extracted; \
		tar -xzf build/$(SENSU_GO_TAR_NAME) -C build/sensu_go_extracted --strip-components 1; \
	fi

.PHONY: build
build: prepare
	@cd build/sensu_go_extracted; \
	go env -w GO111MODULE=on; \
	go env -w GOPROXY='https://proxy.golang.org'; \
	go env -w GOOS=linux; \
	go env -w GOARCH=amd64; \
	go build -ldflags '-X "github.com/sensu/sensu-go/version.BuildSHA=$(SENSU_GO_REVISION)" -X "github.com/sensu/sensu-go/version.BuildDate='$(shell date "+%Y-%m-%d")'"' -o bin/sensu-agent ./cmd/sensu-agent; \
	go build -ldflags '-X "github.com/sensu/sensu-go/version.BuildSHA=$(SENSU_GO_REVISION)" -X "github.com/sensu/sensu-go/version.BuildDate='$(shell date "+%Y-%m-%d")'"' -o bin/sensu-backend ./cmd/sensu-backend; \
	go build -ldflags '-X "github.com/sensu/sensu-go/version.BuildSHA=$(SENSU_GO_REVISION)" -X "github.com/sensu/sensu-go/version.BuildDate='$(shell date "+%Y-%m-%d")'"' -o bin/sensuctl ./cmd/sensuctl; \
	go build -ldflags '-X "github.com/sensu/sensu-go/version.BuildSHA=$(SENSU_GO_REVISION)" -X "github.com/sensu/sensu-go/version.BuildDate='$(shell date "+%Y-%m-%d")'"' -o bin/loadit ./cmd/loadit

.PHONY: rpm
rpm: build
	@echo "Building RPM package for Sensu Go revision '$(SENSU_GO_REVISION)', RPM revision '$(SENSU_GO_RPM_REVISION)'"; \
	nfpm package -p rpm -t build/ -f nfpm-sensu-go-backend.yaml; \
	nfpm package -p rpm -t build/ -f nfpm-sensu-go-agent.yaml; \
	nfpm package -p rpm -t build/ -f nfpm-sensu-go-cli.yaml; \
	nfpm package -p rpm -t build/ -f nfpm-sensu-go-loadit.yaml;
