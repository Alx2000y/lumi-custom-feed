# CyberWrt
CyberWrt OpenWrt package 

Оригинальная прошивка CyberWrt http://cyber-place.ru/showthread.php?t=720

Эта инструкция позволяет настроить установки под себя (сеть, набор модулей и т.д.)
добавить модули которые требуются
получить доступ к последним обновлениям openwrt


Инструкция для сборки на примере OpenWrt 18.06 и роутера на базе rt3050f клона HAME A1

если ещё не настраивалось окружение, то поставить зависимости
```
$ apt-get install subversion build-essential libncurses5-dev zlib1g-dev gawk git ccache gettext libssl-dev xsltproc
```
Требуется скачать SDK и ImageBuilder для выбранной ветки OpenWrt
```
$ cd /opt/wrt/
$ wget https://downloads.openwrt.org/releases/18.06.1/targets/ramips/rt305x/openwrt-sdk-18.06.1-ramips-rt305x_gcc-7.3.0_musl.Linux-x86_64.tar.xz
$ tar -xvJf openwrt-sdk-18.06.1-ramips-rt305x_gcc-7.3.0_musl.Linux-x86_64.tar.xz
$ wget https://downloads.openwrt.org/releases/18.06.1/targets/ramips/rt305x/openwrt-imagebuilder-18.06.1-ramips-rt305x.Linux-x86_64.tar.xz
$ tar -xvJf openwrt-imagebuilder-18.06.1-ramips-rt305x.Linux-x86_64.tar.xz
```
Далее получаем пакет CyberWrt
```
$ cd /opt/wrt/openwrt-sdk-18.06.1-ramips-rt305x_gcc-7.3.0_musl.Linux-x86_64/package/
$ git clone https://github.com/Alx2000y/CyberWrt.git
```
Запуск сборки
```
$ cd /opt/wrt/openwrt-sdk-18.06.1-ramips-rt305x_gcc-7.3.0_musl.Linux-x86_64
$ make world
```
в папке /opt/wrt/openwrt-sdk-18.06.1-ramips-rt305x_gcc-7.3.0_musl.Linux-x86_64/bin/packages/mipsel_24kc/base/ появится файл CyberWrt_2_mipsel_24kc.ipk который можно как установить на стандартный Openwrt, так и добавить в свою сборку.

Если требуется сборка:

закинуть полученный файл в папку:
```
$ cp /opt/wrt/openwrt-sdk-18.06.1-ramips-rt305x_gcc-7.3.0_musl.Linux-x86_64/bin/packages/mipsel_24kc/base/CyberWrt_2_mipsel_24kc.ipk /opt/wrt/openwrt-imagebuilder-18.06.1-ramips-rt305x.Linux-x86_64/packages/
```
Из-за изменений в сборщике LEDE требуется пропатчить Makefile 
```
$ cd /opt/wrt/openwrt-imagebuilder-18.06.1-ramips-rt305x.Linux-x86_64
$ patch Makefile /opt/wrt/openwrt-sdk-18.06.1-ramips-rt305x_gcc-7.3.0_musl.Linux-x86_64/package/CyberWrt/builder.patch
```
Запустить сборку образа. Так как я сразу расширяю память на флешку, то добавляю модули ядра для поддержки флэшек
```
$ make image PROFILE=DEVICE_mpr-a1 PACKAGES="base-files CyberWrt uhttpd kmod-usb-core kmod-usb-ohci kmod-usb-storage kmod-usb2 kmod-fs-ext4 block-mount"
```

Если не требуется поддержка флэшек, достаточно:
```
$ cd /opt/wrt/openwrt-imagebuilder-18.06.1-ramips-rt305x.Linux-x86_64
$ make image PROFILE=DEVICE_mpr-a1 PACKAGES="base-files CyberWrt uhttpd"
```

Прошивка находится в /opt/wrt/openwrt-imagebuilder-18.06.1-ramips-rt305x.Linux-x86_64/bin/targets/ramips/rt305x/

