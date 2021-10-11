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
EXTENDED_VERSION = v9.0
EXTENDED_BUILD_TYPE := UNOFFICIAL

ifeq ($(EXTENDED_BUILD_TYPE), OFFICIAL)

# AEXOTA
$(call inherit-product-if-exists, vendor/aosp/config/ota.mk)

endif

# AOSP recovery flashing
ifeq ($(TARGET_USES_AOSP_RECOVERY), true)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    persist.sys.recovery_update=true
endif
