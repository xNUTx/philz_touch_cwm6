############################################
# Device Specific Config                   #
# These can go under device BoardConfig.mk #
# By PhilZ for PhilZ Touch recovery        #
############################################
#
# Info on some tags
#   - KERNEL_EXFAT_MODULE_NAME: This will force minivold to use much faster kernel modules instead of slow fuse
#                               it will only work if you have modified vold sources (contact me for info)
#                               you'll also have to copy modules to ramdisk and load them in init.rc or a loader script
#                               you need either an exfat enabled prebuilt kernel or to compile exfat modules along kernel
#                               you also need to patch minivold: https://github.com/PhilZ-cwm6/android_system_vold
#   - KERNEL_NTFS_MODULE_NAME:  Same as above, but for ntfs. Currently, it is only limited write support. Better drop to fuse
#   - BOARD_USE_MTK_LAYOUT :=   true
#                               will enable backup/restore of boot, recovery and uboot partitions on MTK devices
#   - BOARD_MTK_BOOT_LABEL :=   "/bootimg"
#                               This flag is optional, it is used only if BOARD_USE_MTK_LAYOUT is defined
#                               If not defined while previous flag is enabled, default boot label is assumed "/bootimg"
#                               Else, it is assigned the defined value
#                               In fstab.device used by recovery (recovery.fstab), boot mount point must be the same as what we
#                               define in label
#                               It is also mandatory that it is defined to real device label (cat /proc/dumchar_info)
#                               Partition size is grabbed during backup/restore from /proc/dumchar_info
#                               uboot label is defined as "/uboot". It is automatically backed-up/restored with boot and recovery
#                               recovery label is assumed to be "/recovery"
#   - BOARD_HAS_LOW_RESOLUTION: (optional) for all devices 1024x768 resolution.
#                               it forces default touch sensitivity to a lower value. It can be altered in GUI Settings
#   - BOOTLOADER_CMD_ARG:       This will override ro.bootloader.mode. Mostly used for Samsung devices to access download mode
#   - TARGET_COMMON_NAME:       The device name that will be displayed on recovery start and in About dialogue
#   - BRIGHTNESS_SYS_FILE := "path"
#                               Needed to be able to alter screen brightness (touch only)
#                               If not set, recovery will try to auto-detect it on start
#                               If detection succeeds, 'brightness_user_path' key is set to the brightness path in ini file
#                               On next recovery starts, auto-detect is disabled when 'brightness_user_path' key exists
#                               If BRIGHTNESS_SYS_FILE flag is defined during compile, you cannot change brightness path without recompiling recovery
#   - TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
#                               will force using ro.product.model as device id if available
#                               you still need to enable a LOCAL_CFLAGS if defined
#   - BOARD_HAS_SLOW_STORAGE := true
#                               when defined, size progress info during backup/restore will be disabled on default settings
#   - BOARD_HAS_NO_FB2PNG := true
#                               define this to disable fb2png support and spare some space (do not use screen capture)
#   - BOARD_USE_NTFS_3G := false
#                               will not include ntfs-3g binary to format and mount NTFS partitions. This can spare about 300kb space
#                               devices using NTFS kernel modules will still be able to mount NTFS but not format to NTFS
#
#   - BOARD_RECOVERY_USE_LIBTAR := true
#                               link tar command to recovery libtar (minitar) rather than to busybox tar
#
#   - TARGET_USERIMAGES_USE_F2FS := true
#                               enable f2fs support in recovery, include ext4 <-> f2fs data migration
#                               this is an official CWM flag
#
#   - BOARD_HAS_NO_MULTIUSER_SUPPORT := true
#                               Since Android 4.2, internal storage is located in /data/media/0 (multi user compatibility)
#                               When upgrading to android 4.2, /data/media content is "migrated" to /data/media/0
#                               By default, in recovery, we always use /data/media/0 unless /data/media/.cwm_force_data_media file is found
#                               For devices with pre-4.2 android support, we can define BOARD_HAS_NO_MULTIUSER_SUPPORT flag
#                               It will default to /data/media, unless /data/media/0 exists
#                               In any case, user can toggle the storage path by create/delete the file /data/media/.cwm_force_data_media
#                               This is achieved through the Advanced menu
#

#Sony Xperia Z (yuga)
ifeq ($(TARGET_PRODUCT), cm_yuga)
    TARGET_COMMON_NAME := Xperia Z
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1920
    TARGET_SCREEN_WIDTH := 1080
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lm3533-lcd-bl/brightness"

#Sony Xperia Z1 (honami)
else ifeq ($(TARGET_PRODUCT), cm_honami)
    TARGET_COMMON_NAME := Xperia Z1
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1920
    TARGET_SCREEN_WIDTH := 1080
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/wled:backlight/brightness"

#Sony Xperia Z1 Compact (amami)
else ifeq ($(TARGET_PRODUCT), cm_amami)
    TARGET_COMMON_NAME := Xperia Z1 Compact
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1280
    TARGET_SCREEN_WIDTH := 720
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/wled:backlight/brightness"

#Sony Xperia Z2 (sirius)
else ifeq ($(TARGET_PRODUCT), cm_sirius)
    TARGET_COMMON_NAME := Xperia Z2
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1920
    TARGET_SCREEN_WIDTH := 1080
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/wled:backlight/brightness"

#Sony Xperia Tablet Z2 (castor)
else ifeq ($(TARGET_PRODUCT), cm_castor)
    TARGET_COMMON_NAME := Xperia Tablet Z2
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1200
    TARGET_SCREEN_WIDTH := 1920
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

#Sony Xperia Tablet Z2 LTE (castor_windy)
else ifeq ($(TARGET_PRODUCT), cm_castor_windy)
    TARGET_COMMON_NAME := Xperia Tablet Z2 LTE
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1200
    TARGET_SCREEN_WIDTH := 1920
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

#Sony Xperia ZU (togari)
else ifeq ($(TARGET_PRODUCT), cm_togari)
    TARGET_COMMON_NAME := Xperia ZU
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1920
    TARGET_SCREEN_WIDTH := 1080
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/wled:backlight/brightness"

#Sony Xperia S (nozomi)
else ifeq ($(TARGET_PRODUCT), cm_nozomi)
    TARGET_COMMON_NAME := Xperia S
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1280
    TARGET_SCREEN_WIDTH := 720
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

#Sony Xperia L (taoshan)
else ifeq ($(TARGET_PRODUCT), cm_taoshan)
    TARGET_COMMON_NAME := Xperia L
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 854
    TARGET_SCREEN_WIDTH := 480
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

#Sony Xperia P (nypon)
else ifeq ($(TARGET_PRODUCT), cm_nypon)
    TARGET_COMMON_NAME := Xperia P
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1280
    TARGET_SCREEN_WIDTH := 720
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

#Sony Xperia J (jlo)
else ifeq ($(TARGET_PRODUCT), cm_jlo)
    TARGET_COMMON_NAME := Xperia J
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 854
    TARGET_SCREEN_WIDTH := 480
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

#Sony Xperia M (nicki)
else ifeq ($(TARGET_PRODUCT), cm_nicki)
    TARGET_COMMON_NAME := Xperia M
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 854
    TARGET_SCREEN_WIDTH := 480
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"

#Sony Xperia SP (huashan)
else ifeq ($(TARGET_PRODUCT), cm_huashan)
    TARGET_COMMON_NAME := Xperia SP
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1280
    TARGET_SCREEN_WIDTH := 720
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight1/brightness"

#Sony Xperia T (mint)
else ifeq ($(TARGET_PRODUCT), cm_mint)
    TARGET_COMMON_NAME := Xperia T
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1280
    TARGET_SCREEN_WIDTH := 720
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight_1/brightness"

#Sony Xperia ZL (odin)
else ifeq ($(TARGET_PRODUCT), cm_odin)
    TARGET_COMMON_NAME := Xperia ZL
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1920
    TARGET_SCREEN_WIDTH := 1080
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lm3533-lcd-bl-1/brightness"

#Sony Xperia ZR (dogo)
else ifeq ($(TARGET_PRODUCT), cm_dogo)
    TARGET_COMMON_NAME := Xperia ZR
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1280
    TARGET_SCREEN_WIDTH := 720
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lm3533-lcd-bl/brightness"

#Sony Xperia Tablet Z (pollux)
else ifeq ($(TARGET_PRODUCT), cm_pollux)
    TARGET_COMMON_NAME := Xperia Tablet Z
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1200
    TARGET_SCREEN_WIDTH := 1920
    BRIGHTNESS_SYS_FILE := "/sys/devices/i2c-0/0-002c/backlight/lcd-backlight/brightness"

#Sony Xperia Tablet Z LTE (pollux_windy)
else ifeq ($(TARGET_PRODUCT), cm_pollux_windy)
    TARGET_COMMON_NAME := Xperia Tablet Z LTE
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1200
    TARGET_SCREEN_WIDTH := 1920
    BRIGHTNESS_SYS_FILE := "/sys/devices/i2c-0/0-002c/backlight/lcd-backlight/brightness"

#Sony Xperia Z2 (sirius)
else ifeq ($(TARGET_PRODUCT), cm_sirius)
    TARGET_COMMON_NAME := Xperia Z2
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1920
    TARGET_SCREEN_WIDTH := 1080
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/wled:backlight/brightness"

#Sony Xperia Tablet Z2 (castor)
else ifeq ($(TARGET_PRODUCT), cm_castor)
    TARGET_COMMON_NAME := Xperia Tablet Z2
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1200
    TARGET_SCREEN_WIDTH := 1920
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/wled:backlight/brightness"

#Sony Xperia T2 Ultra (tianchi)
else ifeq ($(TARGET_PRODUCT), cm_tianchi)
    TARGET_COMMON_NAME := Xperia T2 Ultra
    KERNEL_EXFAT_MODULE_NAME := "texfat"
    TARGET_SCREEN_HEIGHT := 1280
    TARGET_SCREEN_WIDTH := 720
    BRIGHTNESS_SYS_FILE := "/sys/class/leds/lm3630-lcd-bl/brightness"

endif
#---- end device specific config


# use libtar for backup/restore instead of busybox
BOARD_RECOVERY_USE_LIBTAR := true

# The below flags must always be defined as default in BoardConfig.mk, unless defined above:
# device name to display in About dialog
ifndef TARGET_COMMON_NAME
    TARGET_COMMON_NAME := $(TARGET_PRODUCT)
endif

LOCAL_CFLAGS += -DTARGET_COMMON_NAME="$(TARGET_COMMON_NAME)"

ifdef PHILZ_TOUCH_RECOVERY
    # Battery level default path (PhilZ Touch Only)
    ifndef BATTERY_LEVEL_PATH
        BATTERY_LEVEL_PATH := "/sys/class/power_supply/battery/capacity"
    endif

    ifndef BRIGHTNESS_SYS_FILE
        BRIGHTNESS_SYS_FILE := ""
    endif

    ifndef TARGET_SCREEN_HEIGHT
        $(warning ************************************************************)
        $(warning * TARGET_SCREEN_HEIGHT is NOT SET in BoardConfig.mk )
        $(warning ************************************************************)
        $(error stopping)
    endif

    ifndef TARGET_SCREEN_WIDTH
        $(warning ************************************************************)
        $(warning * TARGET_SCREEN_WIDTH is NOT SET in BoardConfig.mk )
        $(warning ************************************************************)
        $(error stopping)
    endif
endif
