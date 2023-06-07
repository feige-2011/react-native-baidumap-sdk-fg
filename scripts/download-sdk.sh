#!/usr/bin/env bash

sdk_url="https://lbsyun-baidu.cdn.bcebos.com/online/aar_android/all/normal/v_0.0.69/BaiduLBS_Android_V0.0.69_369101056.zip"
curl "$sdk_url" -o sdk.zip
unzip -o sdk.zip
rm -r lib/android/libs
mkdir lib/android/libs
mv libs/BaiduLBS_Android.jar lib/android/libs/
rm -r lib/android/src/main/jniLibs
mv libs lib/android/src/main/jniLibs
rm sdk.zip readme.txt
