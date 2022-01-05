ifeq ($(WITH_GAPPS),true)
# Gapps
$(call inherit-product, vendor/google/common/common-vendor.mk)

# Common Overlay
DEVICE_PACKAGE_OVERLAYS += \
    vendor/aosp/overlay-gapps/common

# Exclude RRO Enforcement
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS +=  \
    vendor/aosp/overlay-gapps/common

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    NexusLauncherRelease

# Add acsa property for CarrierServices
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.acsa=true

# SetupWizard configuration
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.feature.baseline_setupwizard_enabled=true \
    ro.setupwizard.enterprise_mode=1 \
    ro.setupwizard.rotation_locked=true \
    setupwizard.enable_assist_gesture_training=true \
    setupwizard.theme=glif_v3_light \
    setupwizard.feature.skip_button_use_mobile_data.carrier1839=true \
    setupwizard.feature.show_pai_screen_in_main_flow.carrier1839=false \
    setupwizard.feature.show_pixel_tos=false \
    setupwizard.feature.show_support_link_in_deferred_setup=false \
    setupwizard.feature.device_default_dark_mode=true

# OPA configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.opa.eligible_device=true

# Google Play services configuration
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.clientidbase=android-google \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent

$(call inherit-product, vendor/aosp/config/rro_overlays.mk)
endif

ifeq ($(WITH_CORE_GAPPS),true)
$(call inherit-product, vendor/google/common/common-vendor-core.mk)
endif
