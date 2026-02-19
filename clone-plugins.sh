#!/bin/bash
# 进入 OpenWrt 源码目录
cd openwrt

# 创建自定义包目录
mkdir -p package/my

# 克隆 OpenClash 源码（官方仓库）
if [ ! -d package/my/luci-app-openclash ]; then
    git clone https://github.com/vernesong/OpenClash.git package/my/luci-app-openclash
    # 注意：OpenClash 仓库结构可能包含多个文件夹，需要确保 luci-app-openclash 在正确位置
    # 如果源码在 package/my/luci-app-openclash/luci-app-openclash，则移动一下
    if [ -d package/my/luci-app-openclash/luci-app-openclash ]; then
        mv package/my/luci-app-openclash/luci-app-openclash/* package/my/luci-app-openclash/
        rmdir package/my/luci-app-openclash/luci-app-openclash
    fi
fi

# 克隆 Argon 主题
if [ ! -d package/my/luci-theme-argon ]; then
    git clone https://github.com/jerrykuku/luci-theme-argon.git package/my/luci-theme-argon
fi

# 克隆 MosDNS 及 LuCI 界面（需要两个仓库）
if [ ! -d package/my/mosdns ]; then
    git clone https://github.com/IrineSistiana/mosdns.git package/my/mosdns
    # 注意：mosdns 主程序可能需要单独编译，通常它的 Makefile 在 release 中，或者需要从源码构建
    # 建议使用预打包的 ipk 方式，或者从 luci-app-mosdns 仓库获取
fi

# 克隆 luci-app-mosdns
if [ ! -d package/my/luci-app-mosdns ]; then
    git clone https://github.com/sbwml/luci-app-mosdns.git package/my/luci-app-mosdns
fi
