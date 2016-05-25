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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from tomato device
$(call inherit-product, device/yu/tomato/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := tomato
PRODUCT_NAME := full_tomato
PRODUCT_BRAND := YU
PRODUCT_MODEL := AO5510
PRODUCT_MANUFACTURER := YU

PRODUCT_GMS_CLIENTID_BASE := android-micromax

TARGET_VENDOR_PRODUCT_NAME := YUREKA
TARGET_VENDOR_DEVICE_NAME := YUREKA
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=YUREKA PRODUCT_NAME=YUREKA

#Dynamically generate build finger print on every build
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=YUREKA \
    BUILD_FINGERPRINT=YU/YUREKA/YUREKA:$(PLATFORM_VERSION)/$(BUILD_ID)/$(BUILD_NUMBER):$(TARGET_BUILD_VARIANT)/release-keys \
    PRIVATE_BUILD_DESC="YUREKA-user $(PLATFORM_VERSION) $(BUILD_ID) $(BUILD_NUMBER) release-keys"
