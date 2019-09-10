lunch_others_targets=()
for device in $(python vendor/aosp/tools/get_official_devices.py)
do
    for var in eng user userdebug; do
        lunch_others_targets+=("aosp_$device-$var")
    done
done
