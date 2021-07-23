ifeq ($(WITH_GAPPS),true)
# Gapps
$(call inherit-product, vendor/gapps/config.mk)

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/aosp/overlay-gapps

$(call inherit-product, vendor/aosp/config/rro_overlays.mk)
endif

ifeq ($(WITH_CORE_GAPPS),true)
$(call inherit-product, vendor/gapps/config_core.mk)
endif
