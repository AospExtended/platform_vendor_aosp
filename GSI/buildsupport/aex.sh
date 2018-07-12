#!/bin/bash

rom_fp="$(date +%y%m%d)"
mkdir -p release/$rom_fp/
set -e

if [ "$#" -le 1 ];then
	echo "Usage: $0 <android-8.1> aex '# of jobs' 'version' "
	echo "*version examples"
	echo "*arm64-aonly"
	echo "*arm64-ab"
    echo "*all"
	exit 0
fi

localManifestBranch=$1
rom=$2
vers=$4
if [ -z "$USER" ];then
	export USER="$(id -un)"
fi
export LC_ALL=C

if [[ -n "$3" ]];then
	jobs=$3
else
    if [[ $(uname -s) = "Darwin" ]];then
        jobs=$(sysctl -n hw.ncpu)
    elif [[ $(uname -s) = "Linux" ]];then
        jobs=$(nproc)
    fi
fi

if [ "$rom" == "aex" ];then
	repo init -u git://github.com/AospExtended/manifest.git -b 8.1.x-gsi
fi

if [ -d .repo/local_manifests ] ;then
	( cd .repo/local_manifests; git fetch; git reset --hard; git checkout origin/$localManifestBranch)
else
	git clone https://github.com/phhusson/treble_manifest .repo/local_manifests -b $localManifestBranch
fi

if [ -d patches ];then
    ( cd patches; git fetch; git reset --hard; git checkout origin/$localManifestBranch)
else
    git clone https://github.com/phhusson/treble_patches patches -b $localManifestBranch
fi

#We don't want to replace from AOSP since we'll be applying patches by hand
rm -f .repo/local_manifests/replace.xml
rm -f .repo/local_manifests/opengapps.xml

repo sync -c -j$jobs --force-sync
rm -f device/*/sepolicy/common/private/genfs_contexts


#sync aex treble dt
rm -rf device/phh/treble
git clone -b 8.1.x-gsi https://github.com/AospExtended-Devices/device_phh_treble device/phh/treble
bash "$(dirname "$0")/apply-patches.sh" patches

. build/envsetup.sh

buildVariant() {
	lunch $1
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp installclean
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp -j$jobs systemimage
	make WITHOUT_CHECK_API=true BUILD_NUMBER=$rom_fp vndk-test-sepolicy
}

repo manifest -r > release/$rom_fp/manifest.xml

if [[ $vers == "arm64-aonly" ]];then
buildVariant treble_arm64_avN-userdebug arm64-aonly
elif [[ $vers == "arm64-ab" ]];then
buildVariant treble_arm64_bvN-userdebug arm64-ab
elif [[ $vers == "all" ]];then
buildVariant treble_arm64_avN-userdebug arm64-aonly
buildVariant treble_arm64_bvN-userdebug arm64-ab
fi

