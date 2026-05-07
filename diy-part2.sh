#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# 方法C：如果你想移除某些包（取消注释）
# sed -i 's/CONFIG_PACKAGE_dnsmasq=y/CONFIG_PACKAGE_dnsmasq=n/g' .config

# Modify default theme
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate


# 例如：修改默认IP
sed -i 's/192.168.1.1/192.168.3.15/g' package/base-files/files/bin/config_generate

# 例如：添加自定义软件包
# echo "CONFIG_PACKAGE_openssh-sftp-server=y" >> .config
# ========== 添加自定义软件包 ==========
# 方法A：基础软件包
# cat <<EOF >> .config
# CONFIG_TARGET_ROOTFS_PARTSIZE=1024

# CONFIG_PACKAGE_ipv6helper=y
# CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
# CONFIG_PACKAGE_odhcpd-ipv6only=y
# CONFIG_PACKAGE_odhcp6c=y

# CONFIG_PACKAGE_kmod-ipv6=y
# CONFIG_PACKAGE_kmod-ip6tables=y

# CONFIG_PACKAGE_ip6tables=y

# CONFIG_PACKAGE_luci-proto-ipv6=y

# CONFIG_PACKAGE_luci=y
# CONFIG_PACKAGE_luci-ssl-openssl=y
# CONFIG_PACKAGE_luci-compat=y
# CONFIG_PACKAGE_luci-i18n-base-zh-cn=y

# CONFIG_PACKAGE_luci-app-store=y
# CONFIG_PACKAGE_luci-lib-ipkg=y

# CONFIG_PACKAGE_luci-app-openclash=y

# CONFIG_PACKAGE_luci-app-upnp=y
# CONFIG_PACKAGE_luci-i18n-upnp-zh-cn=y

# CONFIG_PACKAGE_kmod-r8169=y
# CONFIG_PACKAGE_kmod-r8125=y

# CONFIG_PACKAGE_curl=y

# CONFIG_PACKAGE_nano=y
# CONFIG_PACKAGE_tcpdump=y
# EOF
