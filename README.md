TeamWin Recovery Project

Device configuration for TP-LINK Neffos C5 (TP701A)
=====================================

Basic   | Spec Sheet
-------:|:-------------------------
CHIPSET | MediaTek MT6735
CPU     | 1.3 GHz Quad-core ARM Cortex A53 CPU
GPU     | ARM Mali-T720 MP2
Memory  | 2 GB
Shipped Android Version | Android 5.1 (Lollipop)
Storage | 16 GB
MicroSD | Up to 32 GB
Battery | 2200 mAh
Dimensions | 144 x 72 x 8.8 mm
Display | 1280 x 720 pixels 5.0" (293,7 PPI)
Rear Camera  | 8.0 MP
Front Camera | 5.0 MP
Release Date | January 2016

![TP-LINK Neffos C5 MAX](http://www.neffos.com/res/upfile/product/20160107020005.png "TP-LINK Neffos C5 MAX")

How to compile the image
=====================================
You can get the minimal OMNI source [from here](https://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni).
The full HowTo can be found [here](https://forum.xda-developers.com/showthread.php?t=1943625).

TWRP Functional Checklist
=====================================

Blocking checks
- [x] Correct screen/recovery size
- [x] Working Touch, screen
- [x] Backup to internal/microSD
- [x] Restore from internal/microSD
- [x] reboot to system
- [x] ADB

Medium checks
- [x] update.zip sideload
- [x] UI colors (red/blue inversions)
- [x] Screen goes off and on
- [x] F2FS/EXT4 Support, exFAT/NTFS where supported
- [x] all important partitions listed in mount/backup lists
- [ ] backup/restore to/from external (USB-OTG) storage (not supported by the device)
- [ ] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [x] decrypt /data
- [x] Correct date

Minor checks
- [x] MTP export
- [x] reboot to bootloader
- [x] reboot to recovery
- [x] poweroff
- [x] battery level
- [x] temperature
- [x] encrypted backups
- [ ] input devices via USB (USB-OTG) - keyboard, mouse and disks (not supported by the device)
- [x] USB mass storage export
- [x] set brightness
- [x] vibrate
- [x] screenshot
- [x] partition SD card
