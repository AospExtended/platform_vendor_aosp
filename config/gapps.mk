# Gapps
include vendor/gapps/config.mk
IS_PHONE := true

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/aosp/overlay-gapps
    
$(call inherit-product, vendor/aosp/config/rro_overlays.mk)
