# Copyright (C) 2017 AospExtended
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

 include vendor/aosp/config/version.mk

PRODUCT_BRAND ?= AEX

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosp/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \
    vendor/aosp/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/aosp/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/aosp/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Bootanimation
$(call inherit-product, vendor/aosp/config/bootanimation.mk)

# Hidden API whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/permissions/aex-hiddenapi-package-whitelist.xml:system/etc/permissions/aex-hiddenapi-package-whitelist.xml

# priv-app permissions
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/permissions/privapp-permissions-aex.xml:system/etc/permissions/privapp-permissions-aex.xml

DEVICE_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay/common \
    vendor/aosp/overlay/dictionaries

# Custom AEX packages
ifeq ($(TARGET_USE_GCAM),true)
PRODUCT_PACKAGES += \
    Gcam
endif

ifeq ($(TARGET_USE_JELLY),true)
PRODUCT_PACKAGES += \
    Jelly
endif

PRODUCT_PACKAGES += \
    Terminal \
    LatinIME \
    LiveWallpapers \
    LiveWallpapersPicker \
    Stk \
    ViaBrowser \
    AEXPapers \
    RetroMusicPlayer \
    WallpaperPickerGoogle \
    MarkupGoogle \
    WellbeingPrebuilt \
    Recorder

# Themes
# Accents
PRODUCT_PACKAGES += \
    PixelTheme \
    AmberAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    CandyRedAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    ExtendedGreenAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    JadeGreenAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PaleBlueAccent \
    PaleRedAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    TealAccent \
    YellowAccent

# UI Variants
PRODUCT_PACKAGES += \
    SystemDarkTheme \
    SettingsDarkTheme \
    SystemUIDarkTheme \
    SystemBlackTheme \
    SettingsBlackTheme \
    SystemUIBlackTheme \
    SystemExtendedTheme \
    SettingsExtendedTheme \
    SystemUIExtendedTheme \
    SystemChocolateTheme \
    SettingsChocolateTheme \
    SystemUIChocolateTheme \
    ContactsThemeBlack \
    DialerThemeBlack \
    FilesThemeBlack \
    ContactsThemeDark \
    DialerThemeDark \
    FilesThemeDark \
    ContactsThemeChocolate \
    DialerThemeChocolate \
    FilesThemeChocolate \
    WellbeingChocolateTheme \
    ContactsThemeExtended \
    DialerThemeExtended \
    FilesThemeExtended \
    WellbeingExtendedTheme


# Markup libs
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/aosp/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# Pixel sysconfig
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml

# Turbo
PRODUCT_PACKAGES += \
    Turbo \
    turbo.xml \
    privapp-permissions-turbo.xml

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mke2fs \
    tune2fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    mkfs.f2fs \
    fsck.f2fs \
    fibmap.f2fs \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    7z \
    bash \
    bzip2 \
    curl \
    lib7z \
    powertop \
    pigz \
    tinymix \
    unrar \
    unzip \
    vim \
    rsync \
    zip

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aosp/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# LatinIME gesture typing
ifeq ($(TARGET_ARCH),arm64)
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so \
    vendor/aosp/prebuilt/common/lib64/libjni_latinimegoogle.so:system/lib64/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/libjni_latinime.so:system/lib/libjni_latinime.so \
    vendor/aosp/prebuilt/common/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
endif

# AEX-specific init file
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/init.local.rc:root/init.aosp.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/media/LMspeed_508.emd:system/media/LMspeed_508.emd \
    vendor/aosp/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/aosp/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Media
PRODUCT_GENERIC_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Needed by some RILs and for some gApps packages
PRODUCT_PACKAGES += \
    librsjni \
    libprotobuf-cpp-full

# Charger images
PRODUCT_PACKAGES += \
    charger_res_images

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG ?= false

# Include SDCLANG definitions if it is requested and available
#ifeq ($(HOST_OS),linux)
#    ifneq ($(wildcard vendor/qcom/sdclang-4.0/),)
#        include vendor/aosp/sdclang/sdclang.mk
#    endif
#endif
