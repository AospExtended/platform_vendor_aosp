# Copyright (C) 2017 AospExtended ROM
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

#Extended Versioning
EXTENDED_VERSION = v6.6

ifndef EXTENDED_BUILD_TYPE
    EXTENDED_BUILD_TYPE := UNOFFICIAL
endif

ifeq ($(EXTENDED_BUILD_TYPE), OFFICIAL)

# AEXOTA
$(call inherit-product-if-exists, vendor/aosp/config/ota.mk)

endif

TARGET_PRODUCT_SHORT := $(subst aosp_,,$(CUSTOM_BUILD))

EXTENDED_DATE_YEAR := $(shell date -u +%Y)
EXTENDED_DATE_MONTH := $(shell date -u +%m)
EXTENDED_DATE_DAY := $(shell date -u +%d)
EXTENDED_DATE_HOUR := $(shell date -u +%H)
EXTENDED_DATE_MINUTE := $(shell date -u +%M)
EXTENDED_BUILD_DATE_UTC := $(shell date -d '$(EXTENDED_DATE_YEAR)-$(EXTENDED_DATE_MONTH)-$(EXTENDED_DATE_DAY) $(EXTENDED_DATE_HOUR):$(EXTENDED_DATE_MINUTE) UTC' +%s)
EXTENDED_BUILD_DATE := $(EXTENDED_DATE_YEAR)$(EXTENDED_DATE_MONTH)$(EXTENDED_DATE_DAY)-$(EXTENDED_DATE_HOUR)$(EXTENDED_DATE_MINUTE)
EXTENDED_MOD_VERSION := AospExtended-$(EXTENDED_VERSION)-$(EXTENDED_BUILD_DATE)-$(EXTENDED_BUILD_TYPE)
EXTENDED_FINGERPRINT := AospExtended/$(EXTENDED_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(EXTENDED_BUILD_DATE)


PRODUCT_GENERIC_PROPERTIES += \
  ro.extended.version=$(EXTENDED_VERSION) \
  ro.extended.releasetype=$(EXTENDED_BUILD_TYPE) \
  ro.modversion=$(EXTENDED_MOD_VERSION)

EXTENDED_DISPLAY_VERSION := AospExtended-$(EXTENDED_VERSION)-$(EXTENDED_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.extended.display.version=$(EXTENDED_DISPLAY_VERSION) \
  ro.extended.fingerprint=$(EXTENDED_FINGERPRINT) \
  ro.extended.build_date_utc=$(EXTENDED_BUILD_DATE_UTC)
