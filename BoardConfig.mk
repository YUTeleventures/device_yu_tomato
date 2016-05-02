#
# Copyright (C) 2016 The YUTeleventures
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

DEVICE_PATH := device/yu/tomato

# inherit from common msm8916_64
-include device/qcom/msm8916_64/BoardConfig.mk

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_CPU_CORTEX_A53 := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Audio
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_AUDIOSPHERE := true
BOARD_USES_ALSA_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Asserts
TARGET_BOARD_INFO_FILE ?= $(DEVICE_PATH)/board-info.txt

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Camera
BOARD_CAMERA_SENSORS := imx135_cp8675 imx214_cp8675 ov5648_cp8675
TARGET_USE_VENDOR_CAMERA_EXT := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USES_AOSP := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.msm

# Compression
TARGET_TRANSPARENT_COMPRESSION_METHOD := lz4

# DoubleTapWake
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/touchscreen/touchscreen_dev/gesture_ctrl"

# FM
AUDIO_FEATURE_ENABLED_FM := true

# Init
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_PATH)/init/init_tomato.cpp

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1
KERNEL_DEFCONFIG := yu_tomato_defconfig
TARGET_USE_CM_RAMDISK := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_PERSISTIMAGE_PARTITION_SIZE := 10485760
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 13576175616 # 13576192000 - 16384

# Disable Block Based OTA
BLOCK_BASED_OTA := false

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := false

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/ramdisk/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := ABGR_8888
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_USERIMAGES_USE_EXT4 := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS := device/yu/tomato

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
TARGET_PROVIDES_WCNSS_QMI := true
TARGET_USES_QCOM_WCNSS_QMI := true
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME := "wlan"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# inherit from the proprietary version
-include vendor/yu/tomato/BoardConfigVendor.mk
