rm -rf .repo/local_manifests/

#repo init
repo init -u https://github.com/alphadroid-project/manifest -b alpha-15.2 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

#local_manifest
git clone https://github.com/ikwfahmi/local_manifests.git -b Axion .repo/local_manifests
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

git clone https://github.com/ikwfahmi/build_soong -b alpha-15.2 build/soong

# Export
export BUILD_USERNAME=kyura
export BUILD_HOSTNAME=crave
echo "======= Export Done ======"

# Set up build environment
. build/envsetup.sh
echo "====== Envsetup Done ======="

#build
lunch alpha_X00TD-userdebug && make bacon
