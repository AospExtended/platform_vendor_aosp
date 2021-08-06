# Gapps
$(call inherit-product, vendor/gapps/config.mk)
IS_PHONE := true

# Common Overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/aosp/overlay-gapps
    
$(call inherit-product, vendor/aosp/config/rro_overlays.mk)
