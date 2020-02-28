#
# Copyright (c) 2017 Yu Wang <wangyucn@gmail.com>
#
# This is free software, licensed under the MIT.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=tinyMapper
PKG_VERSION:=20190502.0
PKG_RELEASE:=1

PKG_SOURCE_PROTO:=git
PKG_SOURCE_URL:=https://github.com/wangyu-/tinyPortMapper.git
PKG_SOURCE_VERSION:=6be3de67087f227097725383d236338a790944f0
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz

PKG_LICENSE:=MIT
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=wangyu-

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)

PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/tinyMapper
	SECTION:=net
	CATEGORY:=Network
	TITLE:=A Lightweight Port Mapping/Forwarding Utility using epoll/libev, supports IPv4 and IPv6 for both TCP and UDP.
	URL:=https://github.com/wangyu-/tinyPortMapper
	DEPENDS:= +libstdcpp +libpthread +librt
endef

define Package/tinyMapper/description
	A Lightweight Port Mapping/Forwarding Utility using epoll/libev, supports IPv4 and IPv6 for both TCP and UDP.
endef

MAKE_FLAGS += cross

define Build/Prepare
	$(PKG_UNPACK)
	sed -i 's/cc_cross=.*/cc_cross=$(TARGET_CXX)/g' $(PKG_BUILD_DIR)/makefile
	sed -i '/\*gitversion/d' $(PKG_BUILD_DIR)/makefile
	echo 'const char *gitversion = "$(PKG_VERSION)";' > $(PKG_BUILD_DIR)/git_version.h
	$(Build/Patch)
endef

define Package/tinyMapper/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/tinymapper_cross $(1)/usr/bin/tinymapper
endef

$(eval $(call BuildPackage,tinyMapper))
