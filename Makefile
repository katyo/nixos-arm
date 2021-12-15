ifeq ($(dist),y)
BUILD_OPTS := -j 0
else
BUILD_OPTS := --option builders ''
endif

image:
	nix-build '<nixpkgs/nixos>' -A config.system.build.sdImage -I nixos-config=./sd-image.nix --argstr system aarch64-linux $(BUILD_OPTS) 2>&1 | tee $@.log

attach:
	sudo losetup --partscan --find --show sd-image.img > sd-image.attached

detach:
	if [ -f sd-image.attached ]; then sudo losetup --detach $$(cat sd-image.attached) && rm -f sd-image.attached; fi

