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

#Bootanimation

TARGET_BOOT_ANIMATION_RES ?= undefined

ifeq ($(TARGET_BOOT_ANIMATION_RES),480)
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/AEX-480.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),540)
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/AEX-540.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),720)
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/AEX-720.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1080)
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/AEX-1080.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),1440)
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/AEX-1440.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),2160)
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/AEX-1080-2160-18-9.zip:system/media/bootanimation.zip
else ifeq ($(TARGET_BOOT_ANIMATION_RES),undefined)
     $(warning Target bootanimation res is undefined, using generic bootanimation )
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip
else
     $(warning Defined bootanimation res is wrong, using generic bootanimation )
     PRODUCT_COPY_FILES += vendor/aosp/prebuilt/common/media/bootanimation.zip:system/media/bootanimation.zip
endif
