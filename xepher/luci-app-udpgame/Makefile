#
# Copyright (c) 2020 Shaojun Yang <xepher@outlook.com>
#
# This is free software, licensed under the MIT.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-udpgame
PKG_VERSION:=1.0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)/config
config PACKAGE_$(PKG_NAME)_INCLUDE_udp2raw
	bool "Include udp2raw-tunnel"
	default y if i386||x86_64||arm||aarch64

config PACKAGE_$(PKG_NAME)_INCLUDE_tinyfecVPN
	bool "Include tinyfecVPN"
	default y if i386||x86_64||arm||aarch64

config PACKAGE_$(PKG_NAME)_INCLUDE_tinyMapper
	bool "Include tinyMapper"
	default y if i386||x86_64||arm||aarch64
endef

PKG_CONFIG_DEPENDS:= \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_udp2raw \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_tinyfecVPN \
	CONFIG_PACKAGE_$(PKG_NAME)_INCLUDE_tinyMapper

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./src/luci/controller/*.lua $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DATA) ./src/luci/model/cbi/*.lua $(1)/usr/lib/lua/luci/model/cbi/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view
	$(INSTALL_DATA) ./src/luci/view/*.htm $(1)/usr/lib/lua/luci/view/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./src/etc/config/udpgame $(1)/etc/config/udpgame
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./src/etc/init.d/udpgame $(1)/etc/init.d/udpgame
endef

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI for udpgame(udp2raw, tinyfecVPN and tinyMapper)
	URL:=https://github.com/xepher/openwrt-udpgame
	PKGARCH:=all
	LUCI_DEPENDS:=+PACKAGE_$(PKG_NAME)_INCLUDE_udp2raw:udp2raw-tunnel +PACKAGE_$(PKG_NAME)_INCLUDE_tinyfecVPN:tinyfecVPN +PACKAGE_$(PKG_NAME)_INCLUDE_tinyMapper:tinyMapper
endef

define Package/$(PKG_NAME)/description
	LuCI for udpgame.
endef

$(eval $(call BuildPackage,$(PKG_NAME)))