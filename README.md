# Android device tree for FLEX A9 (FLEX_A9)

```
#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#
```
> [!IMPORTANT]
> Compress with lz4 to boot. Image must be below ~13MB in size to flash so you should probably exclude some features before building

> [!NOTE]
> Does not boot as an image in fastboot, must be flashed to recovery

## Building
On Arch Linux:
Install dependencies: zip, cpio, lz4, repo, android-tools, git, bison, cpio, pyenv, jdk8-openjdk

Set Java Version to 8
```
archlinux-java set java-8-openjdk
```

Set Python Version to 2.7.18
```
pyenv install 2.7.18
pyenv global 2.7.18
```

Get TWRP Manifest
```
repo init --depth=1 -u https://github.com/stoplookingatme/platform_manifest_twrp_omni.git -b twrp-8.1
repo sync --fail-fast
```

Adding the Device Tree
```
git clone https://github.com/stoplookingatme/android_device_flex_a9 -b android-8.1
rm android_device_flex_a9/Android.bp
mkdir -p device/flex/FLEX_A9
cp -r android_device_flex_a9/* device/flex/FLEX_A9
```

Configuring Bash Environment
```
bash
source build/envsetup.sh
```

Building TWRP
```
lunch omni_FLEX_A9-eng
mka recoveryimage
# Maybe bootimage would work for booting in fastboot? Haven't tried
# Don't worry if the build fails at the end due to the size of the image being too large. Refer back to the "Important" notice near the beginning of the readme
```

Flashing TWRP
```
sudo adb reboot bootloader
sudo fastboot flash recovery out/target/product/FLEX_A9/recovery.img
sudo fastboot reboot recovery
```
