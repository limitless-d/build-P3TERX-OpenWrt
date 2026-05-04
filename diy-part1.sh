#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default
# echo "src-git openclash https://github.com/vernesong/OpenClash.git" >> feeds.conf.default

# 标准 feeds（ImmortalWrt 默认已有，无需重复添加）
# src-git packages https://git.openwrt.org/feed/packages.git
# src-git luci https://git.openwrt.org/project/luci.git
# src-git routing https://git.openwrt.org/feed/routing.git

# 第三方 feeds（按需添加）
# 代理工具集（推荐 passwall，helloworld 已归档）
# echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
# echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages' >>feeds.conf.default
# echo 'src-git passwall_luci https://github.com/xiaorouji/luci-app-passwall' >>feeds.conf.default

# iStore 应用商店
echo "src-git istore https://github.com/linkease/istore;main" >>feeds.conf.default

# OpenClash
echo "src-git openclash https://github.com/vernesong/OpenClash.git" >>feeds.conf.default

# 可选：常用内核驱动（包含 r8125 等）
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >>feeds.conf.default
echo "src-git small https://github.com/kenzok8/small" >>feeds.conf.default
