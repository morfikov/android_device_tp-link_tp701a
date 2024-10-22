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

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Time Zone data Credits to desalesouche => http://forum.xda-developers.com/showpost.php?p=64850444&postcount=1204
PRODUCT_COPY_FILES += \
	bionic/libc/zoneinfo/tzdata:recovery/root/system/usr/share/zoneinfo/tzdata

# Because existing update ZIPs for the phone seem to check "ro.product.device" or "ro.build.product"
# and they're not matching the default 'TP701A' target, force them to be C5.
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=C5 \
	TARGET_DEVICE=C5 \
	TARGET_BOOTLOADER_BOARD_NAME=C5
