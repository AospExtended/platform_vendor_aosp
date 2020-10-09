# Copyright (C) 2020 AospExtended Project
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

# Build system colors

ifneq ($(BUILD_WITH_COLORS),0)
  CL_RED="\033[31m"
  CL_YLW="\033[33m"
  CL_RST="\033[0m"
endif

# It's called md5 on Mac OS and md5sum on Linux
ifeq ($(HOST_OS),darwin)
MD5:=md5 -q
else
MD5:=md5sum
endif

TARGET_PACKAGE := $(PRODUCT_OUT)/AospExtended-$(EXTENDED_VERSION)-$(TARGET_DEVICE)-$(EXTENDED_BUILD_DATE)-$(EXTENDED_BUILD_TYPE).zip

.PHONY: otapkg bacon aex
otapkg: $(INTERNAL_OTA_PACKAGE_TARGET)
bacon: aex
aex: otapkg
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(TARGET_PACKAGE)
	$(hide) $(MD5) $(TARGET_PACKAGE) > $(TARGET_PACKAGE).md5sum
	@echo -e ${CL_RST} ""
	@echo -e ${CL_RST} " ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄    ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄ ▄▄▄▄▄▄  ▄▄▄▄▄▄▄ ▄▄▄▄▄▄  "
	@echo -e ${CL_RST} "█       █       █       █       █  █       █  █▄█  █       █       █  █  █ █      ██       █      █ "
	@echo -e ${CL_RST} "█   ▄   █   ▄   █  ▄▄▄▄▄█    ▄  █  █    ▄▄▄█       █▄     ▄█    ▄▄▄█   █▄█ █  ▄    █    ▄▄▄█  ▄    █"
	@echo -e ${CL_RST} "█  █▄█  █  █ █  █ █▄▄▄▄▄█   █▄█ █  █   █▄▄▄█       █ █   █ █   █▄▄▄█       █ █ █   █   █▄▄▄█ █ █   █"
	@echo -e ${CL_RST} "█       █  █▄█  █▄▄▄▄▄  █    ▄▄▄█  █    ▄▄▄██     █  █   █ █    ▄▄▄█  ▄    █ █▄█   █    ▄▄▄█ █▄█   █"
	@echo -e ${CL_RST} "█   ▄   █       █▄▄▄▄▄█ █   █      █   █▄▄▄█   ▄   █ █   █ █   █▄▄▄█ █ █   █       █   █▄▄▄█       █"
	@echo -e ${CL_RST} "█▄▄█ █▄▄█▄▄▄▄▄▄▄█▄▄▄▄▄▄▄█▄▄▄█      █▄▄▄▄▄▄▄█▄▄█ █▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄█▄█  █▄▄█▄▄▄▄▄▄██▄▄▄▄▄▄▄█▄▄▄▄▄▄█ "
	@echo -e ${CL_RST} "" ${CL_RST}
	@echo -e ${CL_BLD}${CL_RED}"=======================================-Package complete-======================================="${CL_RED}
	@echo -e ${CL_BLD}${CL_YLW}"Zip: "${CL_YLW} $(TARGET_PACKAGE)${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"MD5: "${CL_YLW}" `cat $(TARGET_PACKAGE).md5sum | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Size:"${CL_YLW}" `du -sh $(TARGET_PACKAGE) | awk '{print $$1}' `"${CL_RST}
	@echo -e ${CL_BLD}${CL_RED}"================================================================================================"${CL_RST}
