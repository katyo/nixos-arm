export NIXPKGS_ALLOW_UNFREE=1

ifeq ($(dist),y)
BUILD_OPTS += -j 0
else
BUILD_OPTS += --option builders ''
endif

ifeq ($(cache),y)
export CACHIX_AUTH_TOKEN=$(shell cat cachix.token)
BUILD_PIPES += | cachix push sunxi64
endif

ifeq ($(cross),y)
export NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
BUILD_OPTS += --arg crossSystem '{ config = "aarch64-unknown-linux-gnu"; }'
else
BUILD_OPTS += --argstr system aarch64-linux
endif

ifneq ($(nolog),y)
BUILD_PIPES += | tee $$@.log
endif

define sd-image-rules
sd-image-$(1):
	nix-build '<nixpkgs/nixos>' -A config.system.build.sdImage \
	  -I nixos-config=./sd-image-$(1).nix -o result-$(1) $$(BUILD_OPTS) \
	  2>&1 $(BUILD_PIPES)

pkgs-$(1).%:
	nix-build '<nixpkgs/nixos>' -A pkgs.$$* \
	  -I nixos-config=./sd-image-$(1).nix $$(BUILD_OPTS)
endef

sd-image-names := $(patsubst sd-image-%.nix,%,$(wildcard sd-image-*.nix))

$(foreach name,$(sd-image-names),$(eval $(call sd-image-rules,$(name))))

attach:
	sudo losetup --partscan --find --show sd-image.img > sd-image.attached

detach:
	if [ -f sd-image.attached ]; then \
	  sudo losetup --detach $$(cat sd-image.attached) && \
	  rm -f sd-image.attached; \
	fi
