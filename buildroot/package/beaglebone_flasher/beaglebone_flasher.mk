################################################################################
#
# beaglebone_flasher
#
################################################################################

BEAGLEBONE_FLASHER_SITE = $(BR2_EXTERNAL_beaglebone_flasher_PATH)/package/beaglebone_flasher
BEAGLEBONE_FLASHER_SITE_METHOD = local

define BEAGLEBONE_FLASHER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/S99flasher $(TARGET_DIR)/etc/init.d/S99flasher
	$(INSTALL) -D -m 0755 $(@D)/flasher.sh $(TARGET_DIR)/usr/sbin/flasher.sh
	test -e $(@D)/flasher.img.xz && $(INSTALL) -D -m 0644 $(@D)/flasher.img.xz $(TARGET_DIR)/run/flasher.img.xz
endef

$(eval $(generic-package))
