OPENAPI_ROOT := openapi/openapi.yaml
REDOC_HBS_TEMPLATE := docs/template.hbs
REDOC_OUTPUT_FILE := docs/index.html
.PHONY: all build serve clean install uninstall

all: build serve

install:
	npm install -g redoc-cli
build:
	redoc-cli bundle $(OPENAPI_ROOT) --template $(REDOC_HBS_TEMPLATE) --output $(REDOC_OUTPUT_FILE) --cdn
	git add $(REDOC_OUTPUT_FILE)
serve:
	redoc-cli serve $(OPENAPI_ROOT)  --template $(REDOC_HBS_TEMPLATE) --ssr --watch
clean:
	rm $(REDOC_OUTPUT_FILE)
uninstall:
	npm uninstall -g redoc-cli