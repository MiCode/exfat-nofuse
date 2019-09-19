LOCAL_PATH := $(call my-dir)

#the DLKM
DLKM_DIR := device/qcom/common/dlkm

ifeq ($(BOARD_USES_BINARY_KERNEL),)
include $(CLEAR_VARS)
LOCAL_MODULE              := exfat.ko
LOCAL_MODULE_TAGS         := optional
$(warning $(PLATFORM_SDK_VERSION))
ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 26 ))" )))
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
else
LOCAL_MODULE_PATH         := $(TARGET_OUT)/lib/modules
endif
include $(DLKM_DIR)/AndroidKernelModule.mk
else
include $(CLEAR_VARS)
LOCAL_MODULE              := exfat.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_CLASS        := ETC
ifeq (1,$(filter 1,$(shell echo "$$(( $(PLATFORM_SDK_VERSION) >= 26 ))" )))
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
else
LOCAL_MODULE_PATH         := $(TARGET_OUT)/lib/modules
endif
LOCAL_SRC_FILES           := ../../../kernel/$(variant)/fs/exfat/exfat.ko
include $(BUILD_PREBUILT)
endif

$(info $(TARGET_KERNEL_VERSION))
$(info $(MODULE_SIGN_FILE))
$(info $(KERNEL_OUT))
