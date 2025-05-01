################################################################################
#
# ldd
#
################################################################################

LDD_VERSION = 5c3cae6ddc96b8645dfa6f6bc4ddbba08aae8789
LIBFOO_INSTALL_STAGING = NO
LDD_SITE_METHOD = git
LDD_GIT_SUBMODULES = YES
LDD_SITE = git@github.com:cu-ecen-aeld/assignment-7-solomonbstoner.git

LDD_MODULE_SUBDIRS = scull
LDD_MODULE_SUBDIRS += misc-modules

# LDD_BUILD_CMDS is not necessary because
# 1. `init` script does not need to be built
# 2. `kernel-module` settles the building of the kernel modules for us

# We are going to install the following files:
# 1. init (as S89lddmodules)
# 2. scull_load & unload
# 2. module_load & unload
# `kernel-module` settles the scull and misc-modules for us
define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/init $(TARGET_DIR)/etc/init.d/S98lddmodules
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/bin
	$(INSTALL) -D -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/bin
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/bin
	$(INSTALL) -D -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/bin
endef

$(eval $(kernel-module))
$(eval $(generic-package))
