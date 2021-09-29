################################################################################
#
# beaglebone_flasher
#
################################################################################

BEAGLEBONE_FLASHER_SITE = $(BR2_EXTERNAL_beaglebone_flasher_PATH)/package/beaglebone_flasher
BEAGLEBONE_FLASHER_SITE_METHOD = local

define BEAGLEBONE_FLASHER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/S99flasher $(STAGING_DIR)/etc/init.d/S99flasher
	$(INSTALL) -D -m 0755 $(@D)/flasher.sh $(STAGING_DIR)/usr/sbin/flasher.sh
endef

$(eval $(generic-package))
