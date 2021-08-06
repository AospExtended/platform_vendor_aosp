# Gapps
$(call inherit-product, vendor/gapps/config.mk)
IS_PHONE := true

# Common Overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay-gapps/common

$(call inherit-product, vendor/aosp/config/rro_overlays.mk)
