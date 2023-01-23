#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet_wifionly.mk)

# Inherit from J716F device
$(call inherit-product, device/lenovo/J716F/device.mk)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_DEVICE := J716F
PRODUCT_NAME := lineage_J716F
PRODUCT_BRAND := Lenovo
PRODUCT_MODEL := Lenovo TB-J716F_PRC
PRODUCT_MANUFACTURER := lenovo

PRODUCT_GMS_CLIENTID_BASE := android-lenovo

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="LenovoTB-J716F_PRC-user 12 SKQ1.220213.001 14.0.107_220929 release-keys"

BUILD_FINGERPRINT := Lenovo/LenovoTB-J716F_PRC/J716F:12/SKQ1.220213.001/14.0.107_220929:user/release-keys
