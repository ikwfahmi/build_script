rm -rf .repo/local_manifests/
rm -rf prebuilts/clang/host/linux-x86

#repo init
repo init -u https://github.com/HorizonV2/android.git -b lineage-22.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

#local_manifest
git clone https://github.com/ikwfahmi/local_manifests.git -b horizon .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

#Sync
/opt/crave/resync.sh
echo "============="
echo "Sync success"
echo "============="

# Export
export BUILD_USERNAME=kyura
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

#build
lunch lineage_X00TD-bp1a-userdebug && make installclean && mka horizon
