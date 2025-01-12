PRODUCT_PACKAGE_OVERLAYS += vendor/vanir/overlay/common

#optional theme files
PRODUCT_PACKAGE_OVERLAYS += vendor/vanir/overlay/theme

# DSPManager and NFC
$(call inherit-product, vendor/vanir/products/media_sexificators.mk)
$(call inherit-product, vendor/vanir/config/nfc_enhanced.mk)

# Build packages included in manifest
PRODUCT_PACKAGES += \
    Terminal \
    busybox \
    Trebuchet \
    LiveWallpapersPicker \
    ExodusUpdater \
    LockClock

# SuperSU
PRODUCT_COPY_FILES += \
   vendor/vanir/proprietary/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
   vendor/vanir/proprietary/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon


# QuickBoot (included automagically for non-oppo qcom devices)
PRODUCT_PACKAGES += \
    QuickBoot \
    init.vanir.quickboot.rc

Vanir_Version=5.0.2
Vanir_BUILD=$(Vanir_Version)

ifeq ($(RELEASE),)
ifneq ($(FORCE_BUILD_DATE),)
BUILD_DATE:=.$(FORCE_BUILD_DATE)
else
BUILD_DATE:=$(shell date +".%m%d%y")
endif
Vanir_BUILD=$(Vanir_Version)$(BUILD_DATE)
endif

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Build Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.feedback \
    ro.com.google.locationfeatures=1 \
    ro.setupwizard.mode=OPTIONAL \
    ro.setupwizard.enterprise_mode=1 \
    ro.config.ringtone=Atria.ogg \
    ro.config.notification_sound=Ariel.ogg \
    ro.config.alarm_alert=Carbon.ogg \
    ro.modversion=$(Vanir_BUILD) \
    ro.goo.version=$(Vanir_BUILD) \
    ro.rommanager.developerid=vanir \
    wifi.supplicant_scan_interval=300 \
    persist.sys.root_access=3 \
    persist.sys.purgeable_assets=1 \
    ro.build.selinux=1

# nomnomnom
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

ifeq ($(VANIR_FAILSAFE),)
# Build.Prop Tweaks
PRODUCT_PROPERTY_OVERRIDES += \
    mot.proximity.delay=20 \
    net.bt.name=Android \
    ro.ril.disable.power.collapse=0 \
    ro.vold.umsdirtyratio=20 \
    pm.sleep_mode=0 \
    ro.config.nocheckin=1 \
    ro.goo.developerid=vanir \
    ro.kernel.android.checkjni=0 \
    ro.kernel.checkjni=0 \
    ro.lge.proximity.delay=20
endif

# Version information used on all builds
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_DISPLAY_ID=LRX22G BUILD_ID=LRX22G BUILD_VERSION_TAGS=release-keys USER=android-build BUILD_EST_DATE=$(shell date +"%s")

PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/xbin/sysrw:system/xbin/sysrw \
    vendor/vanir/proprietary/common/xbin/sysro:system/xbin/sysro \
    vendor/vanir/proprietary/common/xbin/vanirinteractivegovernorgovernor:system/xbin/vanirinteractivegovernorgovernor \
    vendor/vanir/proprietary/common/xbin/vanirflash:system/xbin/vanirflash \
    vendor/vanir/proprietary/common/init.vanir.rc:root/init.vanir.rc \
    vendor/vanir/proprietary/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh \
    vendor/vanir/proprietary/common/bin/sysinit:system/bin/sysinit \
    vendor/vanir/proprietary/common/etc/init.d/00firsties:system/etc/init.d/00firsties

ifeq ($(VANIR_FAILSAFE),)
# Blobs common to all devices
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/vanir/proprietary/common/xbin/hunter:system/xbin/hunter \
    vendor/vanir/proprietary/common/xbin/testinitd:system/xbin/testinitd \
    vendor/vanir/proprietary/common/xbin/vanircheckcpu:system/xbin/vanircheckcpu \
    vendor/vanir/proprietary/common/xbin/vanirnice:system/xbin/vanirnice

# Misc Files
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/etc/resolv.conf:system/etc/resolv.conf

# Keyboard Files
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/vanir/proprietary/common/lib/libjni_latinime.so:system/lib/libjni_latinimegoogle.so

# proprietary guts
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/vanir/proprietary/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# init.d Tweaks
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/vanir/proprietary/common/etc/init.d/09cron:system/etc/init.d/09cron \
    vendor/vanir/proprietary/common/etc/init.d/98SONIC_SHOCK:system/etc/init.d/98SONIC_SHOCK \
    vendor/vanir/proprietary/common/etc/init.d/99vanir:system/etc/init.d/99vanir \
    vendor/vanir/proprietary/common/etc/init.d/90userinit:system/etc/init.d/90userinit \
    vendor/vanir/proprietary/common/etc/cron/cron.minutely/00nicetweaks:/system/etc/cron/cron.minutely/00nicetweaks \
    vendor/vanir/proprietary/common/etc/cron/cron.daily/00sqlitespeed:/system/etc/cron/cron.daily/00sqlitespeed

# system and persistent /data boot.d Tweaks - triggered when ro.boot_complete is set to 1
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/bin/afterboot:system/bin/afterboot \
    vendor/vanir/proprietary/common/etc/boot.d/00vanirnice:system/etc/boot.d/00vanirnice

# Backup Tools
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/bin/automagic.sh:system/bin/automagic.sh \
    vendor/vanir/proprietary/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/vanir/proprietary/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/vanir/proprietary/common/bin/50-vanir.sh:system/addon.d/50-vanir.sh \
    vendor/vanir/proprietary/common/bin/blacklist:system/addon.d/blacklist \
    vendor/vanir/proprietary/common/bin/whitelist:system/addon.d/whitelist
endif

PRODUCT_PACKAGE_OVERLAYS += \
    vendor/vanir/overlay/dictionaries

# Required CM packages
PRODUCT_PACKAGES += \
    Camera \
    Development \
    LatinIME \
    su \
    BluetoothExt

# CM Hardware Abstraction Framework
PRODUCT_PACKAGES += \
    org.cyanogenmod.hardware \
    org.cyanogenmod.hardware.xml

# Optional CM packages
PRODUCT_PACKAGES += \
    libscreenrecorder \
    ScreenRecorder \
    SoundRecorder \
    libemoji

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# Extra tools in CM
PRODUCT_PACKAGES += \
    libsepol \
    e2fsck \
    mke2fs \
    tune2fs \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    bash \
    vim \
    zip \
    unrar \
    nano \
    htop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    ntfsfix \
    ntfs-3g \
    gdbserver \
    micro_bench \
    oprofiled \
    procmem \
    procrank \
    sqlite3 \
    strace

ifneq ($(TARGET_ARCH),arm64)
PRODUCT_PACKAGES += \
    powertop
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync
	
# HFM Files
PRODUCT_COPY_FILES += \
    vendor/vanir/proprietary/common/etc/hosts.alt:system/etc/hosts.alt \
    vendor/vanir/proprietary/common/etc/hosts.og:system/etc/hosts.og

# Theme engine
PRODUCT_PACKAGES += \
    ThemeChooser \
    ThemesProvider

PRODUCT_COPY_FILES += \
    vendor/vanir/config/permissions/org.cyanogenmod.theme.xml:system/etc/permissions/org.cyanogenmod.theme.xml

## STREAMING DMESG?
PRODUCT_PACKAGES += \
    klogripper

## FOR HOTFIXING KERNELS MAINTAINED BY BUNGHOLES
PRODUCT_PACKAGES += \
    utility_mkbootimg \
    utility_unpackbootimg

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

-include vendor/cyngn/product.mk

$(call inherit-product-if-exists, vendor/vanir-private/Private.mk)
$(call inherit-product-if-exists, vendor/extra/product.mk)
