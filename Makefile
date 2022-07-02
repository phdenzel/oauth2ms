PREFIX ?= $(HOME)/local/bin
CONF_DIR ?= $(HOME)/.config/oauth2ms
LOCAL_BIN = ./bin

all:
	@echo Run \'[PREFIX=/prefix/path] make install\' to install oauth2ms.
	@echo Depending on the PREFIX you might need to use sudo...

install:
	@mkdir -p $(PREFIX)
	@cp oauth2ms $(PREFIX)/
	@chmod 755 $(PREFIX)/oauth2ms
	@mkdir -p $(LOCAL_BIN)
	@ln -sf $(PREFIX)/oauth2ms $(LOCAL_BIN)/oauth2ms-"`uuidgen`"

config:
	@mkdir -p $(CONF_DIR)
	@test -f config.json || cp config.thunderbird.json config.json
	@cp config.json $(CONF_DIR)/config.json

clean:
	rm -rf $(LOCAL_BIN)

uninstall:
	rm -f $(PREFIX)/oauth2ms
	rm -f `readlink -f $(LOCAL_BIN)/*`
