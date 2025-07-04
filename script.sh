rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

#repo init
repo init -u https://github.com/BlissRoms/stable_releases.git -b refs/tags/v18.6-stable-voyager --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

#local_manifest
git clone https://github.com/ikwfahmi/local_manifests.git -b Bliss .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

#Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

#nuke fsgen
rm -rf build/soong

git clone https://github.com/ikwfahmi/platform_build_soong -b voyager-qpr2 build/soong

# Export
export BUILD_USERNAME=kyura
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

#build
blissify -v X00TD
