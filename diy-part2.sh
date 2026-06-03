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
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

#修复Rust编译失败
#sed -i 's/ci-llvm=true/ci-llvm=false/g' feeds/packages/lang/rust/Makefile
wget -O feeds/packages/lang/rust/Makefile https://raw.githubusercontent.com/immortalwrt/packages/refs/heads/master/lang/rust/Makefile

# 添加上网插件
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/openclash
git clone --depth=1 https://github.com/panther706/NIKKI.git package/nikki

#添加插件
git clone --depth=1 https://github.com/timsaya/luci-app-bandix.git package/luci-app-bandix
git clone --depth=1 https://github.com/timsaya/openwrt-bandix.git package/openwrt-bandix
git clone --depth=1 https://github.com/panther706/luci-app-adguardhome.git package/luci-app-adguardhome
