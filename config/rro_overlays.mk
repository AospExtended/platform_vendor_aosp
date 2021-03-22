# RRO Overlays
PRODUCT_PACKAGES += \
    FilesOverlay \
    NowPlayingOverlay \
    PixelDocumentsUIGoogleOverlay \
    PixelSetupWizardAodOverlay
    
ifeq ($(TARGET_INCLUDE_LIVE_WALLPAPERS),true)
PRODUCT_PACKAGES += \
    PixelLiveWallpapersOverlay
endif
