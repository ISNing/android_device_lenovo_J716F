#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),J716F)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

endif

EGL_32_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libEGL_adreno.so
$(EGL_32_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating 32-bit EGL symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf egl/$(notdir $@) $@

GLESv2_32_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libGLESv2_adreno.so
$(GLESv2_32_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating 32-bit GLESv2 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf egl/$(notdir $@) $@

Q3DTOOLS_32_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libq3dtools_adreno.so
$(Q3DTOOLS_32_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating 32-bit Q3D Tools symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf egl/$(notdir $@) $@

EGL_64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/libEGL_adreno.so
$(EGL_64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating 64-bit EGL symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf egl/$(notdir $@) $@

GLESv2_64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/libGLESv2_adreno.so
$(GLESv2_64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating 64-bit GLESv2 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf egl/$(notdir $@) $@

Q3DTOOLS_64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/libq3dtools_adreno.so
$(Q3DTOOLS_64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating 64-bit Q3DTools symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf egl/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(EGL_32_SYMLINK) $(GLESv2_32_SYMLINK) $(Q3DTOOLS_32_SYMLINK) $(EGL_64_SYMLINK) $(GLESv2_64_SYMLINK) $(Q3DTOOLS_64_SYMLINK)

CNE_LIBS := libvndfwk_detect_jni.qti.so
CNE_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR_APPS)/CneApp/lib/arm64/,$(notdir $(CNE_LIBS)))
$(CNE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "CNE lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /vendor/lib64/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(CNE_SYMLINKS)

FIRMWARE_WLAN_QCA_CLD_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/
$(FIRMWARE_WLAN_QCA_CLD_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating qca_cld wlan firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/etc/wifi/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini

FIRMWARE_WLAN_QCA_CLD_QCA6390_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6390/
$(FIRMWARE_WLAN_QCA_CLD_QCA6390_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating qca6490 qca_cld wlan firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/etc/wifi/qca6390/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/qca6390/wlan_mac.bin $@/wlan_mac.bin

FIRMWARE_WLAN_QCA_CLD_QCA6490_SYMLINKS := $(TARGET_OUT_VENDOR)/firmware/wlan/qca_cld/qca6490/
$(FIRMWARE_WLAN_QCA_CLD_QCA6490_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating qca6490 qca_cld wlan firmware symlinks: $@"
	mkdir -p $@
	$(hide) ln -sf /vendor/etc/wifi/qca6490/WCNSS_qcom_cfg.ini $@/WCNSS_qcom_cfg.ini
	$(hide) ln -sf /mnt/vendor/persist/qca6490/wlan_mac.bin $@/wlan_mac.bin

ALL_DEFAULT_INSTALLED_MODULES += \
    $(FIRMWARE_WLAN_QCA_CLD_SYMLINKS) \
    $(FIRMWARE_WLAN_QCA_CLD_QCA6490_SYMLINKS) \
    $(FIRMWARE_WLAN_QCA_CLD_QCA6750_SYMLINKS)