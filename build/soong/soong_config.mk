aosp_soong:
# Insert new variables inside the AOSP structure
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"AOSP": {'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false)'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
