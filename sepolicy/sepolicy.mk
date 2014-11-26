#
# This policy configuration will be used by all products that
# inherit from CM
#

BOARD_SEPOLICY_DIRS += \
    vendor/aosp/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    genfs_contexts \
    property_contexts \
    seapp_contexts \
    service_contexts \
    auditd.te \
    healthd.te \
    hostapd.te \
    installd.te \
    netd.te \
    property.te \
    recovery.te \
    shell.te \
    sysinit.te \
    system.te \
    system_app.te \
    ueventd.te \
    uncrypt.te \
    userinit.te \
    vold.te \
    mac_permissions.xml
