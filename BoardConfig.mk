#
# Copyright (C) 2017 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# https://forum.xda-developers.com/android/software/twrp-flags-boardconfig-mk-t3333970
# http://rootzwiki.com/topic/23903-how-to-compile-twrp-from-source/

LOCAL_PATH := device/tp-link/tp701a

### Platform
# TARGET_NO_BOOTLOADER tells TWRP, that the phone doesn't have a fastboot mode. If you set this
# flag to true, TWRP will hide the "Reboot to Bootloader/Fastboot" Button
TARGET_NO_BOOTLOADER := false

TARGET_BOARD_PLATFORM := mt6735
TARGET_BOARD_PLATFORM_GPU := Mali-T720
#TARGET_BOOTLOADER_BOARD_NAME :=
TARGET_IS_64_BIT := true
TARGET_BOARD_SUFFIX := _64
# Set "TARGET_USES_64_BIT_BINDER" to use 64bit binder IPC on ARMv8. Make sure this variable is set
# to true even if you are doing a 32bit only Android builds for ARMv8.
TARGET_USES_64_BIT_BINDER := true

# For 64 bit
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_CORTEX_A53 := true

# For 32 bit
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
#TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_CPU_VARIANT := generic

# Architecture Extensions (read these from the /proc/cpuinfo file)
ARCH_ARM_HAVE_TLS_REGISTER := true
# Make sure SMP is enabled in the kernel config (CONFIG_SMP=y)
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true

TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp

# Mediatek
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
COMMON_GLOBAL_CFLAGS   += -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL
COMMON_GLOBAL_CFLAGS   += -DMTK_HARDWARE -DMTK_AOSP_ENHANCEMENT
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE -DMTK_AOSP_ENHANCEMENT

# ABI lists for build.prop
# Multilib Support: Set "TARGET_SUPPORTS_32_BIT_APPS" and "TARGET_SUPPORTS_64_BIT_APPS" to determine
# which native libraries to build for an app.  If both are set, it will use 64-bit unless
# "TARGET_PREFER_32_BIT" is set. If only one is set, it will only build apps that work on that
# architecture.  If neither is set it will fall back to only building 32-bit apps.
TARGET_SUPPORTS_32_BIT_APPS := true
TARGET_SUPPORTS_64_BIT_APPS := true
#
#TARGET_CPU_ABI_LIST_64_BIT := $(TARGET_CPU_ABI)
#TARGET_CPU_ABI_LIST_32_BIT := $(TARGET_2ND_CPU_ABI),$(TARGET_2ND_CPU_ABI2)
#TARGET_CPU_ABI_LIST := $(TARGET_CPU_ABI_LIST_64_BIT),$(TARGET_CPU_ABI_LIST_32_BIT)

TARGET_OTA_ASSERT_DEVICE := tp701a,C5

### Kernel
BOARD_KERNEL_BASE         := 0x40078000
BOARD_KERNEL_PAGESIZE     := 2048
BOARD_KERNEL_OFFSET       := 0x00008000
BOARD_RAMDISK_OFFSET      := 0x03f88000
BOARD_KERNEL_TAGS_OFFSET  := 0x0df88000
BOARD_KERNEL_SEPARATED_DT := false
BOARD_KERNEL_CMDLINE := \
	bootopt=64S3,32N2,64N2
#BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := \
	--base $(BOARD_KERNEL_BASE) \
	--pagesize $(BOARD_KERNEL_PAGESIZE) \
	--kernel_offset $(BOARD_KERNEL_OFFSET) \
	--ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
	--tags_offset $(BOARD_KERNEL_TAGS_OFFSET) \
	--cmdline '$(BOARD_KERNEL_CMDLINE)'
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel


### Encryption
TARGET_HW_DISK_ENCRYPTION := false
TW_INCLUDE_CRYPTO := true

### Partitions
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_BOOTIMAGE_PARTITION_SIZE     :=   0x1000000 # (16 MiB)
BOARD_RECOVERYIMAGE_PARTITION_SIZE :=   0x1000000 # (16 MiB)
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x100000000 # (4.0 GiB)
BOARD_CACHEIMAGE_PARTITION_SIZE    :=  0x19000000 # (400 MiB)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x27ED80000 # (~10 GiB)
BOARD_FLASH_BLOCK_SIZE := 131072                  # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_USERIMAGES_USE_EXT4 := true
# Include F2FS support. Make sure your kernel supports F2FS!
TARGET_USERIMAGES_USE_F2FS := false
TW_INCLUDE_NTFS_3G := true
TW_NO_EXFAT := false
TW_NO_EXFAT_FUSE := false
# Use this flag if the board has an EXT4 partition larger than 2 GiB
BOARD_HAS_LARGE_FILESYSTEM := true

### Logs
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

### SELinux
TWHAVE_SELINUX := true

BOARD_SEPOLICY_DIRS += \
	$(LOCAL_PATH)/sepolicy

#BOARD_SEPOLICY_UNION += \

# Charger
RED_LED_PATH := "/sys/class/leds/red/brightness"
GREEN_LED_PATH := "/sys/class/leds/green/brightness"
#CHARGING_ENABLED_PATH :=
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true

# Init of the devices boots under 1s but just in case it is hot and charging...
TARGET_INCREASES_COLDBOOT_TIMEOUT := true

### Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery.fstab
# BGRA_8888, RGBA_8888, RGBX_8888, RGB_565
#TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_VARIANT := twrp

### TWRP
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH :=  /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 10
#TW_NO_SCREEN_TIMEOUT := false
#TW_NO_SCREEN_BLANK := false
TW_NEVER_UNMOUNT_SYSTEM := false
# Set to true in order to enable localization
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := en
# Exclude SuperSu e.g. to save some space or for different other reasons
TW_EXCLUDE_SUPERSU := false
# Removes the "Bootloader" button from the "Reboot" menu
TW_NO_REBOOT_BOOTLOADER := false
# Removes the "Recovery" button from the Reboot menu
TW_NO_REBOOT_RECOVERY := false
# Removes the "Mount USB Storage" button  from the "Mount" menu on devices that don't support the
# USB storage. USB Mass Storage is only supported if explicitly enabled in the kernel.
TW_NO_USB_STORAGE := false
# Add an option in the "Reboot" menu to reboot into Download Mode (for Samsung devices)
TW_HAS_DOWNLOAD_MODE := false
#TW_NO_BATT_PERCENT := false
# Some devices don't have a temp sensor. Disable in such case to stop spamming the recovery log
TW_NO_CPU_TEMP := false

TW_HAS_NO_BOOT_PARTITION := false
TW_HAS_NO_RECOVERY_PARTITION := false

# MTP support
#TW_EXCLUDE_MTP := true
# Specify a custom device name for MTP
TW_MTP_DEVICE := "/dev/mtp_usb"

TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone1/temp
TW_HAS_USB_STORAGE := true
# For people who would want to have ToyBox rather than Busybox
TW_USE_TOOLBOX := false
# An awesome way to take screenshots. Back-end improvement, no noticeable user side changes.
# Screenshots work without it too
TW_INCLUDE_FB2PNG := true

# BOARD_HAS_NO_REAL_SDCARD when "true" disables things like sdcard partitioning and may save you
# some space if TWRP isn't fitting in your recovery patition
#BOARD_HAS_NO_REAL_SDCARD := false
# RECOVERY_SDCARD_ON_DATA when "true" enables proper handling of /data/media on devices that have
# this folder for storage (most Honeycomb and devices that originally shipped with ICS like Galaxy
# Nexus) This flag is not required for these types of devices though. If you do not define this
# flag and also do not include any references to /sdcard, /internal_sd, /internal_sdcard, or /emmc
# in your fstab, then we will automatically assume that the device is using emulated storage.
RECOVERY_SDCARD_ON_DATA := true

#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/sdcard1"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "sdcard1"

# This TW_THEME flag replaces the older DEVICE_RESOLUTION flag. TWRP now uses scaling to stretch
# any theme to fit the screen resolution. There are currently 5 settings which are:
#   portrait_mdpi  = 320x480 480x800 480x854 540x960
#   portrait_hdpi  = 720x1280 800x1280 1080x1920 1200x1920 1440x2560 1600x2560
#   watch_mdpi     = 240x240 280x280 320x320
#   landscape_mdpi = 800x480 1024x600 1024x768
#   landscape_hdpi = 1280x800 1920x1200 2560x1600
TW_THEME := portrait_hdpi
TWRP_NEW_THEME := true
#TW_CUSTOM_THEME  := /some/path/

### Backup
# TWRP backup folder is named after the "Serial" entry in the /proc/cpuinfo file. Some devices
# don't show their serial number in that file and the "Serial" entry shows "0000000000000000". By
# using this flag, TWRP will use "ro.product.model" as the folder name instead.
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
# Remove the ability to encrypt backups with a password
TW_EXCLUDE_ENCRYPTED_BACKUPS := false
# The backup of /data/ doesn't include the /data/media/ directory, which contains a lot of user's
# files (images, photos, movies, etc). This options ensures that the backup file will have all of
# the user's data when backed to an external storage.
# -- https://twrp.me/faq/datamedia.html
#TW_BACKUP_DATA_MEDIA := ture
