srcDir=`pwd`/src

rm -rf $srcDir
mkdir -p $srcDir
cd $srcDir

yumdownloader --source proj --resolve
yumdownloader --source gdal --resolve

