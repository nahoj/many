BIN_DIR := $(HOME)/.local/bin

CONFIG_HOME := $(or $(XDG_CONFIG_HOME),$(HOME)/.config)
MANY_CONFIG := $(CONFIG_HOME)/many

DATA_DIR := $(HOME)/.local/share

lninstall:
	mkdir -p $(CONFIG_HOME)
	ln -sf $(abspath config) $(CONFIG_HOME)/

	mkdir -p $(MANY_CONFIG)/xdgconfig/many
	ln -sf $(MANY_CONFIG)/launcher_apps $(MANY_CONFIG)/xdgconfig/many/

	mkdir -p $(DATA_DIR)/applications
	ln -sf $(abspath share)/applications/* $(DATA_DIR)/applications/

	mkdir -p $(BIN_DIR)
	ln -sf $(abspath bin)/* $(BIN_DIR)/
