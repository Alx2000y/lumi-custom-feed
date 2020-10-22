#!/bin/sh

make image PROFILE=DEVICE_hlk-rm04 PACKAGES="base-files CyberWrt uhttpd -ip6tables -kmod-ip6tables -kmod-nf-conntrack6 -kmod-nf-ipt6 -odhcp6c -odhcpd -kmod-ipv -kmod-ppp -kmod-pppox -kmod-pppoe -ppp -ppp-mod-pppoe -kmod-b43 -kmod-b43legacy"
#ser2net coreutils coreutils-stty -kmod-usb-core -kmod-usb-dwc2 -kmod-usb-ledtrig-usbport
#make image -d PROFILE=DEVICE_mpr-a1 PACKAGES="base-files CyberWrt uhttpd kmod-usb-core kmod-usb-ohci kmod-usb-storage kmod-usb2 kmod-fs-ext4 block-mount"
