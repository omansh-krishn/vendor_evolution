lunch_others_targets=()
for device in $(python vendor/evolution/tools/get_official_devices.py)
do
    for var in user userdebug eng; do
        lunch_others_targets+=("evolution_$device-$var")
    done
done

for i in `find hardware/qcom-caf/*/** -name "Android.bp"` `find vendor/qcom/opensource/*/** -name "Android.bp"`;
do
    sed -i '/clang:/d' $i
done
