# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/sensitive_pn.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sensitive_pn.xml

# World APN list
PRODUCT_COPY_FILES += \
    vendor/aosp/prebuilt/common/etc/apns-conf.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

#PRODUCT_BOOT_JARS += \
#    telephony-ext
