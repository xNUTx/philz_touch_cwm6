LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LIBTOUCH_GUI_VERSION := 1.42

LOCAL_CFLAGS += -DPHILZ_TOUCH_RECOVERY
LOCAL_CFLAGS += -DLIBTOUCH_GUI_VERSION="$(LIBTOUCH_GUI_VERSION)"

ifeq ($(TARGET_RECOVERY_QCOM_RTC_FIX),)
    ifeq ($(TARGET_CPU_VARIANT),krait)
        LOCAL_CFLAGS += -DQCOM_RTC_FIX
    endif
else ifeq ($(TARGET_RECOVERY_QCOM_RTC_FIX),true)
    LOCAL_CFLAGS += -DQCOM_RTC_FIX
endif

ifdef TARGET_RECOVERY_NEEDS_SPECIFIC_DIM_VALUE
    LOCAL_CFLAGS += -DNEEDS_SPECIFIC_DIM_VALUE="$(TARGET_RECOVERY_NEEDS_SPECIFIC_DIM_VALUE)"
endif

LOCAL_SRC_FILES := touch_gui.c gui_settings.c nandroid_gui.c

LOCAL_MODULE := libtouch_gui

LOCAL_C_INCLUDES += \
    $(LOCAL_PATH)/.. \
    system/core/fs_mgr/include \
    system/extras/ext4_utils

# includes from recovery/voldclient
LOCAL_C_INCLUDES += \
    system/core/include \
    system/core/libcutils \
    system/vold

LOCAL_MODULE_TAGS := eng

include $(BUILD_STATIC_LIBRARY)

