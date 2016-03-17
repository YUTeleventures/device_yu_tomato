#
# Copyright (C) 2015 The AOSParadox Project
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
$(call inherit-product-if-exists, vendor/yu/tomato/tomato-vendor.mk)

$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# OpenGLES
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml \

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/tomato/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/yu/tomato/prebuilt/system,system)

# CodeAurora msm8916_64 Tree
include device/qcom/msm8916_64/msm8916_64.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/yu/tomato/overlay
PRODUCT_PACKAGE_OVERLAYS += device/yu/tomato/overlay

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# ANT+
PRODUCT_PACKAGES += \
    AntHalService \
    com.dsi.ant.antradio_library \
    libantradio

# Bluetooth
PRODUCT_PACKAGES += \
    yl_btmac

# Camera
PRODUCT_PACKAGES += \
    libmm-qcamera

# Charger
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.usb.id.charge=F006 \
    ro.usb.id.mtp=F003 \
    ro.usb.id.mtp_adb=9039 \
    ro.usb.id.ptp=904D \
    ro.usb.id.ptp_adb=904E \
    ro.usb.id.ums=F000 \
    ro.usb.id.ums_adb=9015 \
    ro.usb.vid=05c6

# GPS
PRODUCT_PACKAGES += \
    gps.msm8916

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8916 \
    keystore.qcom

# Model
PRODUCT_PACKAGES += \
    ro.product.model=YUREKA

# Power HAL
PRODUCT_PACKAGES += \
    power.msm8916 \
    power.qcom

# Sensors
PRODUCT_PACKAGES += \
    libjni_proximityCalibrate \
    ProximityCalibrate \
    sensors.msm8916

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    libwcnss_qmi \
    wcnss_service
