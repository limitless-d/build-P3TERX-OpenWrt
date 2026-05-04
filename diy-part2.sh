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

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

# diy-part2.sh - OpenWrt 编译自定义配置

echo "开始执行 diy-part2.sh..."

# 1. 修复版本号问题
echo "修复问题包的版本号..."

# 方法A: 修复 luci-theme-design
if [ -d "feeds/kenzo/luci-theme-design" ]; then
    cd feeds/kenzo/luci-theme-design
    
    # 修改 Makefile
    if [ -f "Makefile" ]; then
        # 替换版本号和发布号
        sed -i 's/PKG_VERSION:=.*/PKG_VERSION:=5.8.0/' Makefile
        sed -i 's/PKG_RELEASE:=.*/PKG_RELEASE:=1/' Makefile
        
        # 如果版本号包含特殊字符，进一步清理
        sed -i 's/-[0-9]\{8\}//g' Makefile
        
        echo "已修复 luci-theme-design"
    fi
    
    cd ../..
fi

# 方法B: 如果有其他包也有类似问题，批量修复
find feeds -name "Makefile" -type f | while read makefile; do
    # 检查是否有不规范的版本号
    if grep -q "PKG_VERSION.*-[0-9]\{8\}" "$makefile"; then
        echo "修复: $makefile"
        sed -i 's/-[0-9]\{8\}//g' "$makefile"
    fi
done

# 2. 可选：移除有问题的包（如果不需要）
# echo "移除有问题的包..."
# rm -rf feeds/kenzo/luci-theme-design

# 3. 其他自定义配置
# echo "执行其他自定义配置..."

# 例如：修改默认IP
# sed -i 's/192.168.1.1/192.168.5.1/g' package/base-files/files/bin/config_generate

# 例如：添加自定义软件包
# echo "CONFIG_PACKAGE_openssh-sftp-server=y" >> .config

echo "diy-part2.sh 执行完成"
