SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.google.clientidbase=android-google \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0

# Signature compatibility validation
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/otasigcheck.sh:system/bin/otasigcheck.sh

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/sysinit:system/bin/sysinit

# CM-specific init file
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.local.rc:root/init.cm.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/media/LMprec_508.emd:system/media/LMprec_508.emd \
    vendor/aosp/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Required CM packages
PRODUCT_PACKAGES += \
    LatinIME \
    BluetoothExt

# Optional CM packages
PRODUCT_PACKAGES += \
    Basic \
    libemoji

# Custom CM packages
PRODUCT_PACKAGES += \
    Launcher3 \
    audio_effects.conf

# Extra tools in CM
PRODUCT_PACKAGES += \
    libsepol \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs \
    bash \
    nano \
    htop \
    powertop \
    lsof \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    ntfsfix \
    ntfs-3g \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace

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

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libstagefright_soft_ffmpegadec \
    libstagefright_soft_ffmpegvdec \
    libFFmpegExtractor \
    libnamparser

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)

PRODUCT_PACKAGES += \
    procmem \
    procrank \
    Superuser \
    su

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=1
else

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.root_access=0

endif

PRODUCT_PACKAGE_OVERLAYS += vendor/aosp/overlay/common

# by default, do not update the recovery with system updates
PRODUCT_PROPERTY_OVERRIDES += persist.sys.recovery_update=false

-include $(WORKSPACE)/build_env/image-auto-bits.mk

$(call inherit-product-if-exists, vendor/extra/product.mk)
