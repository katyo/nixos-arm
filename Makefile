ifeq ($(dist),y)
BUILD_OPTS += -j 0
else
BUILD_OPTS += --option builders ''
endif

ifeq ($(cache),y)
export CACHIX_AUTH_TOKEN=$(shell cat cachix.token)
BUILD_OPTS += | cachix push sunxi64
endif

define sd-image-rules
sd-image-$(1):
	nix-build '<nixpkgs/nixos>' -A config.system.build.sdImage -I nixos-config=./sd-image-$(1).nix --argstr system aarch64-linux $$(BUILD_OPTS) 2>&1 | tee $$@.log
endef

sd-image-names := $(patsubst sd-image-%.nix,%,$(wildcard sd-image-*.nix))

$(foreach name,$(sd-image-names),$(eval $(call sd-image-rules,$(name))))

attach:
	sudo losetup --partscan --find --show sd-image.img > sd-image.attached

detach:
	if [ -f sd-image.attached ]; then sudo losetup --detach $$(cat sd-image.attached) && rm -f sd-image.attached; fi

