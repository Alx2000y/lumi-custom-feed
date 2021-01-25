#!/usr/bin/env sh

echo "kernel -> mtd1"
mtd write /root/openwrt-imx6-lumi-zImage /dev/mtd1
echo "dtb -> mtd2"
mtd write /root/openwrt-imx6-imx6ull-xiaomi-lumi.dtb /dev/mtd2
