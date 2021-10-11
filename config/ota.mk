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

ifneq ($(IS_GENERIC_SYSTEM_IMAGE), true)
ifeq ($(TARGET_SHIPS_SEPERATE_GAPPS_BUILD), true)
ifeq (true,$(filter true, $(WITH_GAPPS) $(WITH_CORE_GAPPS)))
ifeq ($(IS_GO_VERSION), true)
CUSTOM_OTA_VERSION_CODE := s_go_gapps
else
CUSTOM_OTA_VERSION_CODE := s_gapps
endif
endif
else
ifeq ($(IS_GO_VERSION), true)
CUSTOM_OTA_VERSION_CODE := s_go
else
CUSTOM_OTA_VERSION_CODE := s
endif
endif

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.extended.ota.version_code=$(CUSTOM_OTA_VERSION_CODE)

PRODUCT_PACKAGES += \
    Updates

endif

