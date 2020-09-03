PATH_OVERRIDE_SOONG := $(shell echo $(TOOLS_PATH_OVERRIDE) | sed -e 's|$$|$$$$|g')

# Add variables that we wish to make available to soong here.
EXPORT_TO_SOONG := \
    KERNEL_ARCH \
    KERNEL_CROSS_COMPILE \
    KERNEL_MAKE_CMD \
    KERNEL_MAKE_FLAGS \
    PATH_OVERRIDE_SOONG \
    TARGET_KERNEL_CONFIG \
    TARGET_KERNEL_SOURCE

# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/AospExtended/platform_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

SOONG_CONFIG_NAMESPACES += aospVarsPlugin

SOONG_CONFIG_aospVarsPlugin :=

define addVar
  SOONG_CONFIG_aospVarsPlugin += $(1)
  SOONG_CONFIG_aospVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))
