rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

#repo init
repo init -u https://github.com/The-Clover-Project/manifest.git -b 15-qpr2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

#local_manifest
git clone https://github.com/ikwfahmi/local_manifests.git -b Clover .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

#Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

#nuke soong
rm -rf build/soong

git clone https://github.com/ikwfahmi/build_soong -b 15-qpr2 build/soong

# Export
export BUILD_USERNAME=kyura
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

#build
lunch clover_X00TD-bp1a-userdebug && make installclean && mka clover
