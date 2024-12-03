#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from FLEX_A9 device
$(call inherit-product, device/flex/FLEX_A9/device.mk)

PRODUCT_DEVICE := FLEX_A9
PRODUCT_NAME := omni_FLEX_A9
PRODUCT_BRAND := FLEX
PRODUCT_MODEL := A9
PRODUCT_MANUFACTURER := flex

PRODUCT_GMS_CLIENTID_BASE := android-topwell

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="full_k80hd_bsp_fwv_512m-user 8.1.0 O11019 1565253177 release-keys"

BUILD_FINGERPRINT := FLEX/FLEX_A9/FLEX_A9:8.1.0/O11019/1565253177:user/release-keys
